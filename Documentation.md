# Create RefinedUI
```lua
local RefinedUI = 
```

<hr>

## Create Window
```lua
local Window = RefinedUI:UI({
	Title = "UI Library", --Ui title
	Author = ".s.h.ark.", --Author & Creator
	Theme = "DarkTheme", --Ui Theme
	Icon = "rbxassetid://120817848459191", --ID or rbxassetid
	Folder = "RefinedUi", --Folder name
	Transparency = false --UI Transparency
})
```

<hr>

## Create Tab
```lua
local Tab = RefinedUI:Tab({
	Title = "main",
	Icon = "rbxassetid://78414666186178" --ID or rbxassetid
})
```

## Create Section
```lua
local Section = Tab:Section({
	Title = "Section 1",
	Default = true
})
```

<hr>

# Element

## Create Button
```lua
Section:Button({
	Title = "Button",
	Callback = function()
		print("Click")
	end
})
```

<hr>

## Create Paragraph
```lua
Section:Paragraph({Title = "Paragraph"})
```

<hr>

## Create Toggle
```lua
Section:Toggle({
	Title = "Toggle false",
	Default = false,
	Callback = function(Value)
		print(Value)		
	end
})
```

<hr>

## Create Slider
```lua
Section:Slider({
	Title = "Slider",
	Step = 1, --Step slider
	Value = {
		Min = 1,
		Max = 120,
		Default = 1,
	},
	Callback = function(Value)
		print(Value)
	end
})
```

<hr>

## Create Dropdown
```lua
Section:Dropdown({
	Title = "Dropdown",
	Multi = false,
	Option = {"Option 1", "Option 2", "Option 3"},
	Value = "Option 1",
	Callback = function(Value)
		print(Value)
	end
})
```
