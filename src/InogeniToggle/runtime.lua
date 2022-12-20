-- Status
-- Have an interior status table to aggregate statuses
internalStatus = {}
-- Each entry should be a table with:
-- reason: string
-- state: number
--    0: OK (green)
--    1: Compromised (orange)
--    2: Fault (red)
--    3: Not Present (gray)
--    4: Missing (dark red)
--    -1: Initializing (light blue)
statusUpdater = Timer.New()
statusUpdater.EventHandler = function()
  local status = -1
  local reason = ""
  for k, v in pairs(internalStatus) do
    if v.status > status then
      status = v.status
      reason = v.reason
    elseif v.status == status then
      if reason == "" then
        reason = v.reason
      else
        reason = reason .. ", " .. v.reason
      end
    end
  end
  if status == -1 then status = 5 end -- Remap to QSYS values
  if reason == "" then
    Controls['Status'].Value = status
    Controls['Status'].String = ''
  else
    Controls['Status'].Value = status
    Controls['Status'].String = reason
  end
end
statusUpdater:Start(1)

-- RS232 connection
connection = SerialPorts[1]
connection.EventHandler = function(port, msg)
  if msg == SerialPorts.Events.Data then
    local line = port:ReadLine(SerialPorts.EOL.Null)
    while line ~= nil do
      line = port:ReadLine(SerialPorts.EOL.Null)
      print("RS232 RX: "..line)
      if string.find(line, "FW_VER") then
        Controls["system.fwversion"].String = string.sub(line, 8)
      elseif tonumber(string.sub(line,1,1)) then
        UpdateSelectFeedback(tonumber(string.sub(line,1,1)))
      end
    end
  end
end

-- Polling
pollTimer = Timer.New()
pollTimer.EventHandler = function(timer)
  Poll()
end

function PollTimerInitialize()
  pollTimer:Stop()
  pollTimer:Start(5)
end

function Poll()
  SendData("GH")
  SendData("FW")
end

-- Helper Functions
function SendData(dataToSend)
  -- Fault if Serial Port is not working
  if connection.IsOpen then
    internalStatus["plugin"] = {
      status = 0,
      reason = ""
    }
  else
    internalStatus["plugin"] = {
      status = 2,
      reason = "Serial Port Not Open"
    }
    -- Attempt to open Serial Port
    connection:Open( 9600, 8, "N")
  end
  print("RS232 TX: "..dataToSend) -- Debug
  -- Fake Feedback before confirming it on the Poll
  if string.find(dataToSend, "SH") then
    UpdateSelectFeedback(string.sub(dataToSend, -1))
  end
  -- Send Data and continue Polling
  connection:Write("data out to serial port")
  PollTimerInitialize()
end


-- Controls
ControlNames = {"select.off", "select.pc1", "select.pc2"}
for idx,val in ipairs(ControlNames) do
  Controls[val].EventHandler = function()
    SendData("SH "..(idx-1))
  end
end

function UpdateSelectFeedback(intIndex)
  for idx,val in ipairs(ControlNames) do
    Controls[val].Boolean = (idx==(intIndex+1))
    end
end

internalStatus["plugin"] = {
  status = -1,
  reason = ""
}
PollTimerInitialize()