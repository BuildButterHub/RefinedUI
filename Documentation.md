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
	Transparency = true --UI Transparency
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

##Create Section
```lua
local Section = Tab:Section({
	Title = "Section 1",
	Default = true
})
```
