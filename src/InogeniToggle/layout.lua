local CurrentPage = PageNames[props["page_index"].Value]
if CurrentPage == "Main" then

  Logo = "--[[ #encode "logo.png" ]]"
  Triangle ="--[[ #encode "triangle.png" ]]"
  table.insert(graphics,{
    Type="Image",
    Image=Logo,
    Position={15,10},
    Size={200,35}
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "Toggle",
    FontSize = 32,
    HTextAlign = "Center",
    Position = {280, 10},
    Size = {120, 35}
  })
  layout["Status"] = {
    PrettyName = string.format("Status"),
    Style = "Status",
    Position = {15,45},
    Size = {200, 35}
  }
  table.insert(graphics,{
    Type = "Text",
    Text = "FW:",
    FontSize = 22,
    HTextAlign = "Center",
    Position = {15, 80},
    Size = {55, 35}
  })
  layout["system.fwversion"] = {
    PrettyName = "Firmware Version",
    Style = "Text",
    FontSize = 22,
    HTextAlign = "Center",
    Padding = 0,
    StrokeWidth = 0,
    Position = {70, 80},
    Size = {145, 35}
  }
  table.insert(graphics,{
    Type="Image",
    Image=Triangle,
    Position={280,45},
    Size={35,35}
  })
  table.insert(graphics,{
    Type="Image",
    Image=Triangle,
    Position={323,45},
    Size={35,35}
  })
  table.insert(graphics,{
    Type="Image",
    Image=Triangle,
    Position={365,45},
    Size={35,35}
  })
  layout["select.off"] = {
    PrettyName = "Select~Off",
    Legend = "Off",
    FontSize = 22,
    Style = "Button",
    ButtonStyle = "Flat",
    Color = {210,71,39},
    OffColor = {109,129,142},
    UnlinkOffColor = true,
    Position = {0, 120},
    Size = {120, 80},
    CornerRadius = 2,
  }
  layout["select.pc1"] = {
    PrettyName = "Select~PC 1",
    Legend = "PC 1",
    FontSize = 22,
    Style = "Button",
    ButtonStyle = "Flat",
    Color = {210,71,39},
    OffColor = {109,129,142},
    UnlinkOffColor = true,
    Position = {140, 120},
    Size = {120, 80},
    CornerRadius = 2,
  }
  layout["select.pc2"] = {
    PrettyName = "Select~PC 2",
    Legend = "PC 2",
    FontSize = 22,
    Style = "Button",
    ButtonStyle = "Flat",
    Color = {210,71,39},
    OffColor = {109,129,142},
    UnlinkOffColor = true,
    Position = {280, 120},
    Size = {120, 80},
    CornerRadius = 2,
  }
end