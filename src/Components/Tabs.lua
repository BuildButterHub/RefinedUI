	local tab = {}
	local Tabs = true
	
	function tab:Tab(Config)
		local Tabss = {
			Title = Config.Title or "Tab name",
			Icon = Config.Icon,
			Elements = {},
			iconImage = nil
		}

		local PadL local TabImg
		TabImg = Config.Icon and Config.Icon ~= ""
		PadL = TabImg and UDim.new(0, 33) or UDim.new(0, 10)		

		local iconImage

		if string.find(Config.Icon, "rbxassetid://") then
    		Tabss.iconImage = Config.Icon
		else
    		Tabss.iconImage = "rbxassetid://" .. Config.Icon
		end
		
		local TabModule = Library:Create("TextButton", {
			Parent = leftScrollFrame,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Size = UDim2.new(0, 138, 0, 27),
			Font = Enum.Font.SourceSansBold,
			Text = Config.Title,
			TextColor3 = UI.Theme.TabModule.TabEnable,
			TextSize = 15.000,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left
		})

		local TabModuleUp = Library:Create("UIPadding", {Parent = TabModule, PaddingLeft = PadL})
		
		if TabImg then
		local TabImageM = Library:Create("ImageLabel", {
			Parent = TabModule,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(-0.272, 0, 0.111, 0),
			Size = UDim2.new(0, 20, 0, 20),
			Image = Tabss.iconImage
		})
		end
		
		local RightScrollFrame = Library:Create("ScrollingFrame", {
			Name = "RightScrollFrame",
			Parent = ContairFrame,
			Active = true,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0,0,0),
			Size = UDim2.new(0, 338,0, 352),
			ScrollBarThickness = 3,
			AutomaticSize = Y
		})
		
		local RightScrollFrameULL = Library:Create("UIListLayout", {
			Name = "RightScrollFrameULL",
			Parent = RightScrollFrame,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 4)
		})

		local RightScrollFrameUP = Library:Create("UIPadding", {
			Parent = RightScrollFrame,
			PaddingLeft = UDim.new(0, 2)
		})

		if Tabs then
			RightScrollFrame.Visible = true
			TabModule.TextColor3 = UI.Theme.TabModule.TabEnable
			Tabs = false
		else
			TabModule.TextColor3 = UI.Theme.TabModule.TabDisable
			RightScrollFrame.Visible = false
		end
	
		TabModule.MouseButton1Click:Connect(function()
			for i, v in next, ContairFrame:GetChildren() do
				if v:IsA("GuiObject") then
					v.Visible = false
				end
			end
			RightScrollFrame.Visible = true
			for i, v in next, leftScrollFrame:GetChildren() do
				if v:IsA("TextButton") then
					Utility:TweenObject(v, {TextColor3 = UI.Theme.TabModule.TabDisable}, 0.2)
				end
			end
			Utility:TweenObject(TabModule, {TextColor3 = UI.Theme.TabModule.TabEnable}, 0.2)
		end)
return tab
end
