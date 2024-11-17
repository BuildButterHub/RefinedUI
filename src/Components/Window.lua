function Library:UI(Config)
	local FunctionTransparency = {}
	local UI = {
		Object = {},
		Title = Config.Title or "Ui Library",
		Author = Config.Author,
		Icon = Config.Icon,
		Theme = Config.Theme or "DarkTheme",
		Folder = Config.Folder or {},
		Transparency = Config.Transparency or false,
		Position = UDim2.new(
			0.5, 0,
			0.5, 0
		),
		userinfo = {},
		UiIcon = nil
	}

	if string.find(Config.Icon, "rbxassetid://") then
		UI.UiIcon = Config.Icon
	else
		UI.UiIcon = "rbxassetid://" .. Config.Icon
	end

	if Config.Folder then
        makefolder("RefinedUI / " .. Config.Folder)
    end

	function setTheme(themeName)
		if Themes[themeName] then
			UI.Theme = Themes[themeName]
		else
			UI.Theme = {}
			for key, value in pairs(defaultColors) do
				UI.Theme[key] = value
			end
		end
	end

	if UI.Theme and UI.Theme ~= "" then
		setTheme(UI.Theme)
	end

	for _, v in next, game.CoreGui:GetChildren() do
        if v.Name == "ScreenGui" then 
          v:Destroy()
        end
      end

	local ScreenGui = Library:Create("ScreenGui", {
		Parent = game.CoreGui,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	})
	local MainFrame = Library:Create("Frame", {
		Parent = ScreenGui,
		BackgroundColor3 = UI.Theme.Background,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Transparency = (Config.Transparency and 0.10) or 0,
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, -589/2, 0.5, -391/2),
		Size = UDim2.new(0, 508, 0, 400)
	})
	local MainFrameC = Library:Create("UICorner", {Parent = MainFrame})
	--[[local BlurIcon = Library:Create("ImageLabel", {
		Parent = MainFrame,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(0, 508, 0, 400),
		Visible = false,
		Image = "http://www.roblox.com/asset/?id=6430908053",
		ImageColor3 = Color3.fromRGB(37, 37, 37),
		ImageTransparency = 0.300
	})--]]
	local LeftTBar = Library:Create("Frame", {
		Parent = MainFrame,
		BackgroundColor3 = UI.Theme.LeftBackground, --Color3.fromRGB(29, 29, 29),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Transparency = (Config.Transparency and 1) or 0,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 162, 0, 400)
	})

	local LeftTBarC = Library:Create("UICorner", {
		Parent = LeftTBar
	})

	enableDragging(MainFrame)
	local MainFrameC_2 = Library:Create("Frame", {
		Name = "MainFrameC",
		Parent = LeftTBar
	})
	local LTB = Library:Create("Frame", {
		Parent = LeftTBar,
		BackgroundColor3 = UI.Theme.LeftBackground,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Transparency = (Config.Transparency and 1) or 0,
		Position = UDim2.new(0.962962985, 0, 0, 0),
		Size = UDim2.new(0, 6, 0, 400)
	})
	local UiName = Library:Create("TextLabel", {
		Parent = LeftTBar,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.216049388, 0, 0.0199999996, 0),
		Size = UDim2.new(0, 116, 0, 18),
		Font = Enum.Font.SourceSansBold,
		Text = Config.Title,
		TextColor3 = UI.Theme.Text, --Color3.fromRGB(207, 207, 207),
		TextScaled = true,
		TextSize = 14.000,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left
	})
	
	local CreatorName = Library:Create("TextLabel", {
		Parent = UiName,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.256198347, 0, 1, 0),
		Size = UDim2.new(0, 86,0, 15),
		Font = Enum.Font.SourceSansBold,
		Text = "By " .. Config.Author, --By .s.h.ark.
		TextColor3 = UI.Theme.CreatorUI,
		TextScaled = true,
		TextSize = 14.000,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left
	})
	
	local UiLogo = Library:Create("ImageLabel", {
		Name = "UiLogo",
		Parent = LeftTBar,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.0432098769, 0, 0.0175000001, 0),
		Size = UDim2.new(0, 26, 0, 26),
		Image = UI.Icon
	})
	
	local Cross = Library:Create("ImageButton", {
		Name = "Cross",
		Parent = MainFrame,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.929133832, 0, 0.0250000004, 0),
		Size = UDim2.new(0, 23, 0, 23),
		Image = "rbxassetid://105086435000470"
	})
	
	local leftScrollFrame = Library:Create("ScrollingFrame", {
		Name = "leftScrollFrame",
		Parent = LeftTBar,
		Active = true,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.0432098769, 0, 0.112499997, 0),
		Size = UDim2.new(0, 149, 0, 346),
		ScrollBarThickness = 0
	})
	local leftScrollFrameULL = Library:Create("UIListLayout", {
		Name = "leftScrollFrameULL",
		Parent = leftScrollFrame,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 5)
	})

	Cross.MouseButton1Click:Connect(function()
		MainFrame:Destroy()
	end)

	--local RightFolder = Library:Create("Folder", {Parent = MainFrame})
	local ContairFrame = Library:Create("Frame", {
		Name = "ContairFrame",
		Parent = MainFrame,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.333000004, 0, 0.101999998, 0),
		Size = UDim2.new(0, 338, 0, 352)
	})

	local Minimized = Library:Create("ImageButton", {
		Name = "Minimized",
		Parent = MainFrame,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.845000029, 0, 0.0250000004, 0),
		Size = UDim2.new(0, 23, 0, 23),
		Image = "rbxassetid://126477060859012",
	})
	
		frame.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = false
				if dragInput then
					dragInput:Disconnect()
					dragInput = nil
				end
			end
		end)
	end

	local MaximizeUI = Library:Create("Frame", {
		Name = "MaximizeUI",
		Parent = ScreenGui,
		BackgroundColor3 = Color3.fromRGB(29, 29, 29),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Visible = false,
		Position = UDim2.new(0.31, 0,0.166, 0),
		Size = UDim2.new(0, 37, 0, 37),
	})

	local MaximizeUIC Library:Create("UICorner", {CornerRadius = UDim.new(0, 12), Name = "MaximizeUIC", Parent = MaximizeUI})

	local Logo = Library:Create("ImageLabel", {
		Name = "Logo",
		Parent = MaximizeUI,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.122972645, 0, 0.144351035, 0),
		Size = UDim2.new(0, 26, 0, 26),
		Image = UI.UiIcon,
	})

	local TriggerM = Library:Create("TextButton", {
		Parent = MaximizeUI,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(0, 37, 0, 37),
		Font = Enum.Font.SourceSans,
		TextColor3 = Color3.fromRGB(0, 0, 0),
		TextSize = 14.000,
		TextTransparency = 1.000,
	})

	TriggerM.MouseButton1Click:Connect(function()
		MainFrame.Visible = true
		MaximizeUI.Visible = false
	end)

	Minimized.MouseButton1Click:Connect(function()
		MainFrame.Visible = false
		MaximizeUI.Visible = true
	end)

return UI
end
