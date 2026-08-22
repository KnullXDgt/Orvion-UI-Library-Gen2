# Orvion UI Library

A Roblox UI library for executor scripts. Dark theme, mobile-first, drops into any script without setup.

---

## Loading

```lua
local Orvion = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/KnullXDgt/Orvion-UI-Library/main/source.luau"
))()
```

---

## Creating a window

```lua
local Window = Orvion:CreateWindow({
    Title          = "My Script",
    Center         = true,
    Draggable      = true,
    Resizable      = true,
    ToggleButton   = true,
    ConfigFolder   = "MyFolder",
    -- BackgroundImage = "rbxassetid://...",
})
```

---

## Tabs

```lua
local Tab = Window:CreateTab("Features")
```

---

## Collapsible sections

```lua
local Section = Window:AddCollapsible(Tab, "Section Name", true)
```

Elements can go into a tab directly or inside a collapsible section.

---

## Elements

### Toggle

```lua
Window:AddToggle(Tab, "Enable Something", "Description", false, function(state)
    print(state)
end)
```

### Button

```lua
Window:AddButton(Tab, "Do Action", "Description", "rbxassetid://16932740082", function()
    print("clicked")
end)
```

### Button grid (2 side by side)

```lua
Window:AddButtonGrid(Tab,
    { Title = "Start", Callback = function() end },
    { Title = "Stop",  Callback = function() end }
)
```

### Input

```lua
Window:AddInput(Tab, "Player Name", "Optional description", "placeholder", function(value)
    print(value)
end)
```

### Slider

```lua
Window:AddSlider(Tab, "Speed", "Description", 0, 100, 16, function(value)
    print(value)
end)
```

### Dropdown

```lua
Window:AddDropdown(Tab, "Mode", "Description",
    {"Option A", "Option B", "Option C"},
    false, "Option A",
    function(value) print(value) end
)
```

### Multi-select dropdown

```lua
Window:AddMultiDropdown(Tab, "Perks", "Description",
    {"Speed", "Jump", "Shield"},
    {},
    function(values) print(values) end
)
```

### Paragraph

```lua
Window:AddParagraph(Tab, "Title", "Body text here.")
```

### Color picker

```lua
Window:AddColorPicker(Tab, "Color", "Pick a color", Color3.fromRGB(255,0,0), function(color)
    print(color)
end)
```

### Keybind

```lua
Window:AddKeybind(Tab, "Hotkey", "Press to activate", Enum.KeyCode.E, function(key)
    print(key.Name)
end)
```

---

## Notifications

```lua
Orvion:Notify({
    Title       = "Title",
    Description = "Subtitle",
    Content     = "Message body.",
    Color       = Color3.fromRGB(150, 150, 170),
    Delay       = 3
})
```

---

## Config system

Every window gets a Configs tab automatically. From there you can save and load element states to a JSON file, set a config to auto-load on the next run, delete configs, or reset everything to default.

Files go to `ConfigFolder/Configs/name.json`. The autoload marker is at `ConfigFolder/Autoload.txt`.

```lua
local Window = Orvion:CreateWindow({
    Title        = "My Script",
    ConfigFolder = "MyScriptName",
})
```

---

## Search

Type in the sidebar search bar to find any element across all tabs. Click a result to jump to it.

---

## Toggle button

A draggable button on the left side of the screen that opens and closes the UI.

```lua
ToggleButton       = true,
ToggleButton_Image = "rbxassetid://...",  -- optional custom icon
```

---

## Background image

Shows an image inside the main content area. Only visible on the Darker theme by default.

```lua
BackgroundImage       = "rbxassetid://123981509631924",
BackgroundImage_Theme = "Darker",
```

---

## Setting values from code

Every element returns an object with a `:Set()` method.

```lua
local MyToggle = Window:AddToggle(Tab, "Auto Fish", "", false, function(state) end)
MyToggle:Set(true)

local MySlider = Window:AddSlider(Tab, "Delay", "", 0, 10, 2, function(v) end)
MySlider:Set(5)

local MyDropdown = Window:AddDropdown(Tab, "Mode", "", {"A","B"}, false, "A", function(v) end)
MyDropdown:Set("B")
```

---

*Credits to Kairo UI and Itzzavi*
