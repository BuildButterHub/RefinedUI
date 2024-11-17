	local ElementTabs = {}

	function ElementTabs:Section(Config)
		local section = {
			Title = Config.Title or "Section Name",
			Default = Config.Default or true
		}
		local SectionModule = Library:Create("Frame", {
			Name = "SectionModule",
			Parent = RightScrollFrame,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			AutomaticSize = Y,
			Position = UDim2.new(-0.123999886, 0, 0, 5),
			Size = UDim2.new(0, 321, 0, 0),
		})
		local SectionLabel = Library:Create("TextLabel", {
			Name = "SectionLabel",
			Parent = SectionModule,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Size = UDim2.new(0, 271, 0, 26),
			Font = Enum.Font.SourceSansBold,
			Text = Config.Title,
			TextColor3 = UI.Theme.Text,
			TextSize = 20.000,
			TextXAlignment = Enum.TextXAlignment.Left
		})
		local SectionIcon = Library:Create("ImageLabel", {
			Name = "SectionIcon",
			Parent = SectionLabel,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(-0.135, 0, -0.0107, 0),
			Size = UDim2.new(0, 25, 0, 25),
			Image = "rbxassetid://74761066657765"
		})
		local SectionIcon1 = Library:Create("ImageLabel", {
			Parent = SectionLabel,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(-0.135, 0,-0.011, 0),
			Size = UDim2.new(0, 25, 0, 25),
			ImageTransparency = 1.000,
			Image = "rbxassetid://81030773570278"
		})
		local SctionTrigger = Library:Create("TextButton", {
			Name = "SectionTrigger",
			Parent = SectionLabel,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(0, 321, 0, 26),
			Font = Enum.Font.SourceSans,
			TextColor3 = Color3.fromRGB(0, 0, 0),
			TextScaled = true,
			TextSize = 14.000,
			TextTransparency = 1,
			TextWrapped = true
		})
		local SectionUP = Library:Create("UIPadding", {
			Name = "SectionUP",
			Parent = SectionLabel,
			PaddingLeft = UDim.new(0, 35)
		})
		
		local L1 = Library:Create("Frame", {
			Name = "L1",
			Parent = SectionModule,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 6, 0, 36),
			Size = UDim2.new(0, 321, 0, 0),
			--AutomaticSize = Y
		})
			local UICornerL1 = Library:Create("UICorner", {
				Parent = L1,
				CornerRadius = UDim.new(0, 4)
			})
		
		local L2 = Library:Create("UIListLayout", {
			Name = "L2",
			Parent = L1,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 4)
		})

		if Config.Default then
				SectionModule.ClipsDescendants = false
			else
				SectionModule.ClipsDescendants = true
		end
		
		local function updateSectionSize()
			TweenService:Create(SectionModule, TweenInfo.new(0.2), {Size = UDim2.new(0, 343, 0, Config.Default and 36 + L2.AbsoluteContentSize.Y + 8 or 36)}):Play()
			SectionIcon.ImageTransparency = (Config.Default and 0 or 1)
			SectionIcon1.ImageTransparency = (Config.Default and 1 or 0)
			SectionModule.ClipsDescendants = true
		end
		
		if TabVal ~= false then
			updateSectionSize()
		end
		
		SctionTrigger.MouseButton1Click:Connect(function()
			Config.Default = not Config.Default
			updateSectionSize()
			SectionIcon.ImageTransparency = (Config.Default and 0 or 1)
			SectionIcon1.ImageTransparency = (Config.Default and 1 or 0)
		end)
		
		L2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			if not Config.Default then return end
			TweenService:Create(SectionModule, TweenInfo.new(0.2), {Size = UDim2.new(0, 343, 0, 36 + L2.AbsoluteContentSize.Y + 7)}):Play()
			SectionModule.ClipsDescendants = true
		end)

		local FunctionSection = {}
		function FunctionSection:UpdateSection(NewText)
			if SectionLabel.Text ~= NewText then
				SectionLabel.Text = NewText
			end
		end
return ElementTabs
end
