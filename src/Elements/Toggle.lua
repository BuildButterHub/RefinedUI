		function SectionModule:Toggle(Config)
			local toggle = {
				Title = Config.Title or "Toggle",
				Default = Config.Default or false,
				Callback = Config.Callback or function() end
			}
			local ToggleModule = Library:Create("Frame", {
				Name = "ToggleModule",
				Parent = L1,
				BackgroundColor3 = UI.Theme.ElementColor,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				Transparency = (Config.Transparency and 0.15) or 0,
				BorderSizePixel = 0,
				Size = UDim2.new(0, 321, 0, 46),
				AutomaticSize = Y
			})
			local ToggleModuleC = Library:Create("UICorner", {
				Name = "ToggleModuleC",
				Parent = ToggleModule,
				CornerRadius = UDim.new(0, 6)
			})			
			local Toggle = Library:Create("Frame", {
				Name = "Toggle",
				Parent = ToggleModule,
				BackgroundColor3 = UI.Theme.ToggleModule.Toggle,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0.826, 0, 0.229, 0),
				Size = UDim2.new(0, 42, 0, 24)
			})
			local ToggleC = Library:Create("UICorner", {
				Name = "ToggleC",
				Parent = Toggle,
				CornerRadius = UDim.new(0, 15)
			})
			local ToggleScroll = Library:Create("Frame", {
				Name = "ToggleScroll",
				Parent = Toggle,
				BackgroundColor3 = UI.Theme.ToggleModule.Scroll,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0.08, 0, 0.125, 0),
				Size = UDim2.new(0, 17, 0, 17)
			})
			local ToggleScrollC = Library:Create("UICorner", {
				Name = "ToggleScrollC",
				Parent = ToggleScroll,
				CornerRadius = UDim.new(0, 20)
			})
			local ToggleTitle = Library:Create("TextLabel", {
				Name = "ToggleTitle",
				Parent = ToggleModule,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1.000,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0.028, 0, 0.015, 0),
				Size = UDim2.new(0, 249, 0, 46),
				Font = Enum.Font.SourceSansBold,
				Text = toggle.Title,
				TextColor3 = UI.Theme.Text,
				TextSize = 16.000,
				TextXAlignment = Enum.TextXAlignment.Left
			})
  
			local ToggleTrigger = Library:Create("TextButton", {
				Name = "ToggleTrigger",
				Parent = ToggleModule,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1.000,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Size = UDim2.new(0, 321, 0, 46),
				Font = Enum.Font.SourceSans,
				TextColor3 = Color3.fromRGB(0, 0, 0),
				TextSize = 14.000,
				TextTransparency = 1.000
			})

		local function updateToggleState()
    		local Position = toggle.Default and UDim2.new(0.49, 0, 0.125, 0) or UDim2.new(0.08, 0, 0.125, 0)
    		local Color = toggle.Default and UI.Theme.ToggleModule.ScrollNew or UI.Theme.ToggleModule.Scroll
    		Utility:TweenObject(ToggleScroll, {Position = Position}, 0.2)
    		Utility:TweenObject(ToggleScroll, {BackgroundColor3 = Color}, 0.2)
    		task.spawn(function()
        		pcall(toggle.Callback, toggle.Default)
    		end)
		end

		updateToggleState()

		ToggleTrigger.MouseButton1Click:Connect(function()
    		toggle.Default = not toggle.Default
    		updateToggleState()
		end)
			return toggle
		end
