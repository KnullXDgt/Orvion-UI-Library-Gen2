-- Orvion UI Library - Example Script
-- Load the library
local Orvion = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/KnullXDgt/Orvion-UI-Library/main/source.luau"
))()

-- Create window
local Window = Orvion:CreateWindow({
    Title          = "My Script",
    Theme          = "Darker",
    Center         = true,
    Draggable      = true,
    Resizable      = true,
    ToggleButton   = true,
    ConfigFolder   = "MyScriptConfigs",
    -- BackgroundImage = "rbxassetid://123981509631924",  -- optional bg image
})

-- Create tabs
local MainTab = Window:CreateTab("Main")
local SettingsTab = Window:CreateTab("Settings")

-- Collapsible section
local Section = Window:AddCollapsible(MainTab, "General", true)

Window:AddToggle(Section, "Enable Feature", "Toggle the main feature on/off", false, function(state)
    print("Enable Feature:", state)
end)

Window:AddSlider(Section, "Speed", "Movement speed multiplier", 0, 100, 16, function(value)
    print("Speed:", value)
end)

Window:AddInput(Section, "Player Name", "Target player name", "Enter name...", function(value)
    print("Player Name:", value)
end)

Window:AddDropdown(Section, "Mode", "Select operation mode",
    {"Fast", "Balanced", "Safe"}, false, "Balanced",
    function(value)
        print("Mode:", value)
    end
)

Window:AddButtonGrid(Section,
    { Title = "Start", Callback = function()
        Orvion:Notify({ Title = "Started", Description = "OK", Content = "Feature started!", Color = Color3.fromRGB(150,150,170), Delay = 3 })
    end },
    { Title = "Stop", Callback = function()
        Orvion:Notify({ Title = "Stopped", Description = "OK", Content = "Feature stopped.", Color = Color3.fromRGB(150,150,170), Delay = 3 })
    end }
)

-- Settings tab
Window:AddToggle(SettingsTab, "Anti AFK", "Prevent auto-kick", false, function(state) end)
Window:AddToggle(SettingsTab, "Show FPS", "Display FPS counter", false, function(state) end)

-- Config tab is auto-generated (last tab labeled "Configs")
-- It includes: Config Name input, Select Config dropdown,
-- Save/Load/Delete/Set Autoload/Refresh/Clear Autoload buttons,
-- and Reset All Elements button.
-- Configs are saved to ConfigFolder/Configs/name.json
-- Autoload is saved to ConfigFolder/Autoload.txt
