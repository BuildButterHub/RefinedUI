local Win = Library:UI({
	Title = "RefinedUI",
	Author = ".s.h.ark.",
	Theme = "DarkTheme",
	Icon = "rbxassetid://120817848459191",
	Folder = "RefinedUI",
	Transparency = false
})

local Tab1 = Win:Tab({
	Title = "Element",
	Icon = "rbxassetid://78414666186178"
})

local Tab2 = Win:Tab({
	Title = "Drop",
	Icon = "78414666186178"
})

local Tab3 = Win:Tab({
	Title = "Tab3",
	Icon = ""
})

local Section1 = Tab1:Section({
	Title = "Section 1",
	Default = true
})

local Section2 = Tab1:Section({
	Title = "Section false",
	Default = false
})

Section1:Button({
	Title = "Button",
	Callback = function()
		print("Click")
	end
})

Section1:Paragraph({
	Title = "Paragraph"
})

local Section2 = Tab1:Section({
	Title = "Section 2",
	Default = true
})

Section2:Toggle({
	Title = "Toggle false",
	Default = false,
	Callback = function(Value)
		print(Value)		
	end
})

Section2:Toggle({
	Title = "Toggle true",
	Default = true,
	Callback = function(Value)
		print(Value)		
	end
})

Section2:Slider({
	Title = "Slider",
	Step = 10,
	Value = {
		Min = 1,
		Max = 120,
		Default = 1,
	},
	Callback = function(Value)
		print(Value)
	end
})

Section2:Slider({
	Title = "Slider",
	Step = 1,
	Value = {
		Min = 1,
		Max = 120,
		Default = 30,
	},
	Callback = function(Value)
		print(Value)
	end
})

local Tab2Sect = Tab2:Section({
	Title = "Dropdown",
	Default = true
})

Tab2Sect:Dropdown({
	Title = "Dropdown",
	Multi = false,
	Option = {"Option 1", "Option 2", "Option 3", "Option 4", "Option 5", "Option 6", "Option 7", "Option 8", "Option 9", "Option 10", "Option 11", "Option 12"},
	Value = "Option 1",
	Callback = function(Value)
		print(Value)
	end
})

Tab2Sect:Dropdown({
	Title = "Dropdown multi",
	Multi = true,
	Option = {"Option 1", "Option 2", "Option 3", "Option 4", "Option 5", "Option 6", "Option 7", "Option 8", "Option 9", "Option 10", "Option 11", "Option 12"},
	Value = "Option 1",
	Callback = function(Value)
		warn(game:GetService("HttpService"):JSONEncode(Value))
	end
})
