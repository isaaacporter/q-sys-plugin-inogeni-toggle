local CurrentPage = PageNames[props["page_index"].Value]
if CurrentPage == "Main" then

  Logo = "--[[ #encode "logo.png" ]]"
  Triangle ="--[[ #encode "triangle.png" ]]"
  table.insert(graphics,{
    Type = "GroupBox",
    Fill = {255, 255, 255},
    CornerRadius = 0,
    StrokeColor = {255, 255, 255},
    StrokeWidth = 0,
    Position = {0, 0},
    Size = {390, 80}
  })
  table.insert(graphics,{
    Type="Image",
    Image=Logo,
    Position={85, 21},
    Size={220, 38}
  })
  table.insert(graphics,{
    Type = "GroupBox",
    Fill = {218, 218, 218},
    CornerRadius = 0,
    StrokeColor = {218, 218, 218},
    StrokeWidth = 0,
    Position = {1, 106},
    Size = {390, 344}
  })
  table.insert(graphics,{
    Type = "Header",
    Text = "Connection Status",
    HTextAlign = "Center",
    Color = {51, 51, 51},
    FontSize = 16,
    Position = {40, 118},
    Size = {310, 20}
  })
  layout["Status"] = {
    PrettyName = string.format("Status"),
    Style = "Status",
    Position = {40, 152},
    Size = {310, 40}
  }
  table.insert(graphics,{
    Type = "Header",
    Text = "Device Information",
    HTextAlign = "Center",
    Color = {51, 51, 51},
    FontSize = 16,
    Position = {40, 202},
    Size = {310, 20}
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "Firmware:",
    FontSize = 14,
    HTextAlign = "Right",
    Position = {55, 234},
    Size = {100, 18}
  })
  layout["system_fwversion"] = {
    PrettyName = "Firmware Version",
    Style = "Text",
    FontSize = 12,
    HTextAlign = "Center",
    Padding = 0,
    Color = {200, 200, 200},
    StrokeColor = {105, 105, 105},
    StrokeWidth = 1,
    Position = {174, 234},
    Size = {130, 20}
  }
  table.insert(graphics,{
    Type = "Header",
    Text = "Input Select",
    HTextAlign = "Center",
    Color = {51, 51, 51},
    FontSize = 16,
    Position = {40, 290},
    Size = {310, 20}
  })
  layout["select_off"] = {
    PrettyName = "Select~Off",
    Legend = "Off",
    FontSize = 14,
    Style = "Button",
    ButtonStyle = "Flat",
    Color = {210, 71, 39},
    OffColor = {109, 129, 142},
    UnlinkOffColor = true,
    Position = {40, 316},
    Size = {100, 100},
    CornerRadius = 2,
  }
  layout["select_pc1"] = {
    PrettyName = "Select~PC 1",
    Legend = "PC 1",
    FontSize = 14,
    Style = "Button",
    ButtonStyle = "Flat",
    Color = {210, 71, 39},
    OffColor = {109, 129, 142},
    UnlinkOffColor = true,
    Position = {145, 316},
    Size = {100, 100},
    CornerRadius = 2,
  }
  layout["select_pc2"] = {
    PrettyName = "Select~PC 2",
    Legend = "PC 2",
    FontSize = 14,
    Style = "Button",
    ButtonStyle = "Flat",
    Color = {210, 71, 39},
    OffColor = {109, 129, 142},
    UnlinkOffColor = true,
    Position = {250, 316},
    Size = {100, 100},
    CornerRadius = 2,
  }
  table.insert(graphics,{
    Type = "Text",
    Text = "Developed by Isaac Porter",
    FontSize = 12,
    HTextAlign = "Right",
    Position = {1, 430},
    Size = {150, 18}
  })
end