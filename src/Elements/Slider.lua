		local HoldingSlider = false
		function SectionModule:Slider(Config)
			local Slider = {
				Title = Config.Title or "Slider",
				Step = Config.Step or 1,
				Value = {
					Min = Config.Min or 1,
					Max = Config.Max or 120,
					Default = Config.Default or 1
				},
				Callback = Config.Callback or function() end,
				size = 104,
			}
			local SliderModel = Library:Create("Frame", {
				Name = "SliderModel",
				Parent = L1,
				BackgroundColor3 = UI.Theme.ElementColor,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				Transparency = (Config.Transparency and 0.15) or 0,
				BorderSizePixel = 0,
				Size = UDim2.new(0, 321, 0, 46)
			})
			local SliderModelC = Library:Create("UICorner", {
				CornerRadius = UDim.new(0, 6),
				Name = "SliderModelC",
				Parent = SliderModel
			})
			local SliderBar = Library:Create("Frame", {
				Name = "SliderBar",
				Parent = SliderModel,
				BackgroundColor3 = UI.Theme.SliderModule.SliderBar,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0.330957323, 40, 0.363844484, 0),
				Size = UDim2.new(0, 104, 0, 12)
			})
			local SliderBack = Library:Create("TextButton", {
				Name = "SliderBack",
				Parent = SliderBar,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1.000,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Size = UDim2.new(0, 104, 0, 12),
				Font = Enum.Font.SourceSans,
				TextColor3 = Color3.fromRGB(0, 0, 0),
				TextSize = 14.000,
				TextTransparency = 1.000
			})
			local SliderBarC = Library:Create("UICorner", {
				CornerRadius = UDim.new(0, 5),
				Name = "SliderBarC",
				Parent = SliderBar
			})
			local SliderPart = Library:Create("Frame", {
				Name = "SliderPart",
				Parent = SliderBar,
				BackgroundColor3 = UI.Theme.SliderModule.SliderPart,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Size = UDim2.new(0, 54, 0, 13)
			})
			local SliderPartC = Library:Create("UICorner", {
				CornerRadius = UDim.new(0, 5),
				Name = "SliderPartC",
				Parent = SliderPart
			})
			local SliderTitle = Library:Create("TextLabel", {
				Name = "SliderTitle",
				Parent = SliderModel,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1.000,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0.028, 0, 0.015, 0),
				Size = UDim2.new(0, 128, 0, 46),
				Font = Enum.Font.SourceSansBold,
				Text = Slider.Title,
				TextColor3 = UI.Theme.Text,
				TextSize = 16.000,
				TextXAlignment = Enum.TextXAlignment.Left
			})
			local SliderValBG = Library:Create("TextButton", {
				Name = "SliderValBG",
				Parent = SliderModel,
				BackgroundColor3 = UI.Theme.SliderModule.SliderValBG,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0.839, 0, 0.175, 0),
				Size = UDim2.new(0, 41, 0, 28),
				Font = Enum.Font.SourceSans,
				Text = "",
				TextColor3 = Color3.fromRGB(0, 0, 0),
				TextSize = 14.000
			})
			local SliderValBGC = Library:Create("UICorner", {
				CornerRadius = UDim.new(0, 6),
				Name = "SliderValBGC",
				Parent = SliderValBG
			})
			local SliderValBG_2 = Library:Create("TextBox", {
				Name = "SliderValBG_2",
				Parent = SliderValBG,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1.000,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Font = Enum.Font.FredokaOne,
				PlaceholderColor3 = Color3.fromRGB(0, 0, 0),
				Text = "",
				TextColor3 = UI.Theme.SliderModule.SliderValBGLabel,
				TextSize = 14.000,
				TextWrapped = true
			})
			local Value
			local moveconnection
			local releaseconnection
			local isTouch = false
			local isFocusing = false

			SliderValBG_2.Focused:Connect(function()
				isFocusing = true
			end)

			SliderValBG_2.FocusLost:Connect(function(enterPressed)
				isFocusing = false
				if tonumber(SliderValBG_2.Text) then
					local inputValue = tonumber(SliderValBG_2.Text)
					local clampedValue = math.clamp(inputValue, Slider.Value.Min, Slider.Value.Max)
					Value = clampedValue
					SliderValBG_2.Text = Value
					SliderPart.Size = UDim2.new((clampedValue - Slider.Value.Min) / (Slider.Value.Max - Slider.Value.Min), 0, 1, -2)
					task.spawn(Slider.Callback, clampedValue)
				end
			end)
			
			local clampedDefault = math.clamp(Slider.Value.Default, Slider.Value.Min, Slider.Value.Max)
			Value = clampedDefault
			SliderPart.Size = UDim2.new((clampedDefault - Slider.Value.Min) / (Slider.Value.Max - Slider.Value.Min), 0, 1, -2)
			SliderValBG_2.Text = tostring(clampedDefault)
			task.spawn(Slider.Callback, clampedDefault)
			
			SliderValBG_2:GetPropertyChangedSignal("Text"):Connect(function()
				if tonumber(SliderValBG_2.Text) then
					local inputValue = tonumber(SliderValBG_2.Text)
					local clampedValue = math.clamp(inputValue, Slider.Value.Min, Slider.Value.Max)
					Value = clampedValue
					SliderPart.Size = UDim2.new((clampedValue - Slider.Value.Min) / (Slider.Value.Max - Slider.Value.Min), 0, 1, -2)
					task.spawn(Slider.Callback, clampedValue)
				end
			end)
			
			SliderBack.InputBegan:Connect(function(input)
				if not isFocusing and not HoldingSlider and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
					isTouch = (input.UserInputType == Enum.UserInputType.Touch)
					HoldingSlider = true
					moveconnection = game:GetService("RunService").RenderStepped:Connect(function()
						local inputPosition
						if isTouch then
							inputPosition = input.Position.X
						else
							inputPosition = game:GetService("UserInputService"):GetMouseLocation().X
						end
						local delta = math.clamp((inputPosition - SliderPart.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
						Value = math.floor((Slider.Value.Min + delta * (Slider.Value.Max - Slider.Value.Min)) / Slider.Step + 0.5) * Slider.Step
						SliderPart.Size = UDim2.new(delta, 0, 1, -2)
						SliderValBG_2.Text = tostring(Value)
						task.spawn(Slider.Callback, Value)
					end)
					
					releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(endInput)
						if (endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch) and input == endInput then
							moveconnection:Disconnect()
							releaseconnection:Disconnect()
							HoldingSlider = false
						end
					end)
				end
			end)
			return Slider
		end
