		function SectionModule:Dropdown(Config)
			local Dropdown = {
				Title = Config.Title or "Dropdown",
				Multi = Config.Multi or false,
				Option = Config.Option or {},
				Value = Config.Value,
				Callback = Config.Callback or function() end,
				Val = true,
				ASpeed = 0.10 
			}
		
			local DropDownModule = Library:Create("Frame", {
				Name = "DropDownModule",
				Parent = L1,
				BackgroundColor3 = UI.Theme.ElementColor,
				Transparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0.496284127, 0),
				Size = UDim2.new(0, 321, 0, 46),
				ZIndex = 0
			})

			local Sizedrops = Library:Create("Frame", {
				Name = "Sizedrops",
				Parent = DropDownModule,
				BackgroundColor3 = UI.Theme.ElementColor,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				--AutomaticSize = Y,
				Size = UDim2.new(0, 321, 0, 46),
				ZIndex = 1
			})
			
			local DropDownModuleC = Library:Create("UICorner", {
				CornerRadius = UDim.new(0, 6),
				Name = "DropDownModuleC",
				Parent = Sizedrops
			})
		
			local RightTrig = Library:Create("TextButton", {
				Name = "RightTrig",
				Parent = Sizedrops,
				BackgroundColor3 = UI.Theme.Dropdown.DropValue,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0.523364484, 0, 0.218477994, 0),
				Size = UDim2.new(0, 141, 0, 25),
				ZIndex = 2,
				AutoButtonColor = false,
				Font = Enum.Font.SourceSansBold,
				Text = Dropdown.Title,
				TextColor3 = UI.Theme.Text,
				TextSize = 12,
				TextXAlignment = Enum.TextXAlignment.Left
			})
			
			local RightTrigC = Library:Create("UICorner", {
				Name = "RightTrigC",
				Parent = RightTrig
			})
			
			local RightImage = Library:Create("ImageLabel", {
				Name = "RightImage",
				Parent = RightTrig,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1.000,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0.818181813, 0, 0.319999993, 0),
				Rotation = 90.000,
				Size = UDim2.new(0, 10, 0, 10),
				ZIndex = 2,
				Image = "rbxassetid://104110394707338"
			})
			
			local RightTrigLabelUP = Library:Create("UIPadding", {
				Name = "RightTrigLabelUP",
				Parent = RightTrig,
				PaddingLeft = UDim.new(0, 7)
			})
			
			local DropTitle = Library:Create("TextLabel", {
				Name = "DropTitle",
				Parent = Sizedrops,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1.000,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0.0280373823, 0, 0.0176802929, 0),
				Size = UDim2.new(0, 150, 0, 46),
				Font = Enum.Font.SourceSansBold,
				Text = Dropdown.Title,
				TextColor3 = UI.Theme.Text,
				TextSize = 16.000,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		
			local DropdownFrame1 = Library:Create("Frame", {
				Name = "DropdownFrame1",
				Size = UDim2.new(0, 321, 0, 46),
				BackgroundTransparency = 1.000,
				Position = UDim2.new(0, -8, 0, 46), -- -8
				Parent = Sizedrops,
				AnchorPoint = Vector2.new(1, 0),
				AutomaticSize = "XY",
				BackgroundColor3 = Color3.fromRGB(38, 38, 38)
			})
		
			local DropdownFrame = Library:Create("ScrollingFrame", {
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				AutomaticCanvasSize = "Y",
				BackgroundTransparency = 1,
				Parent = DropdownFrame1,
				ScrollBarThickness = 0,
				ScrollingDirection = "Y",
				CanvasSize = UDim2.new(0, 0, 0, 0)
			})
		
			local DropdownC = Library:Create("UICorner", {
				CornerRadius = UDim.new(0, 8),
				Parent = DropdownFrame1
			})
			
			local DropdownUIPadding = Library:Create("UIPadding", {
				PaddingTop = UDim.new(0, 0),
				PaddingLeft = UDim.new(0, 0),
				PaddingRight = UDim.new(0, 6),
				PaddingBottom = UDim.new(0, 0),
				Parent = DropdownFrame
			})
			
			local DropdownUISize = Library:Create("UISizeConstraint", {
				MinSize = Vector2.new(321, 0),
				MaxSize = Vector2.new(321, 149),
				Parent = DropdownFrame1
			})
			
			local DropdownModuleL = Library:Create("UIListLayout", {
				Name = "DropdownModuleL",
				Parent = DropdownFrame,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 6)
			})
		
			RightTrig.MouseButton1Click:Connect(function()
				if Dropdown.Val then
					Utility:TweenObject(DropdownFrame1, {Size = UDim2.new(0, DropdownModuleL.AbsoluteContentSize.X, 0, DropdownModuleL.AbsoluteContentSize.Y+12)}, Dropdown.ASpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
					Utility:TweenObject(DropdownUIPadding, {PaddingTop = UDim.new(0, 6), PaddingBottom = UDim.new(0, 6)}, Dropdown.ASpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
					Utility:TweenObject(DropdownFrame1, {Position = UDim2.new(1, 0, 0, 48)}, Dropdown.ASpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
					Utility:TweenObject(DropDownModule, {Size = UDim2.new(0, 321, 0, 199)}, Dropdown.ASpeed)
					Utility:TweenObject(RightImage, {Rotation = -90}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
				else
					Utility:TweenObject(DropdownFrame1, {Size = UDim2.new(0, DropdownModuleL.AbsoluteContentSize.X, 0, 0)}, Dropdown.ASpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
					Utility:TweenObject(DropdownUIPadding, {PaddingTop = UDim.new(0, 0), PaddingBottom = UDim.new(0, 0)}, Dropdown.ASpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
					Utility:TweenObject(DropdownFrame1, {Position = UDim2.new(1, 0, 0, 48)}, Dropdown.ASpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
					Utility:TweenObject(DropDownModule, {Size = UDim2.new(0, 321, 0, 46)}, Dropdown.ASpeed)
					Utility:TweenObject(RightImage, {Rotation = 90}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
				end
				Dropdown.Val = not Dropdown.Val
			end)
		
			local Items = {}
			local ClickedItems = {}
			
			for _, Item in ipairs(Dropdown.Option) do
				local ItemButton = Library:Create("TextButton", {
					Name = "ItemButton",
					Size = UDim2.new(0, 321, 0, 24),
					BackgroundTransparency = 0,
					BackgroundColor3 = UI.Theme.Dropdown.DropOption,
					AutoButtonColor = false,
					Parent = DropdownFrame,
					AutomaticSize = "Y",
					TextColor3 = UI.Theme.Text,
					Font = Enum.Font.SourceSansBold,
					TextSize = 14,
					TextWrapped = true,
					Text = Item
				})
				local ItemUICorner = Library:Create("UICorner", {
					Parent = ItemButton,
					CornerRadius = UDim.new(0, 6)
				})
		
				local MultiClick = false
				ItemButton.MouseButton1Click:Connect(function()
					if not Dropdown.Multi then
						for _, item in pairs(Items) do
							item.Selected = false
						end
						Dropdown.Value = Item
						task.spawn(Dropdown.Callback, Item)
						Dropdown.Val = false
						RightTrig.Text = ItemButton.Text
						Utility:TweenObject(ItemButton, {BackgroundColor3 = UI.Theme.Dropdown.NewAnim}, 0.1)
						wait(0.1)
						Utility:TweenObject(ItemButton, {BackgroundColor3 = UI.Theme.Dropdown.OldAnim}, 0.1)
						Utility:TweenObject(DropdownFrame1, {Size = UDim2.new(0, DropdownModuleL.AbsoluteContentSize.X, 0, 0)}, Dropdown.ASpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
						Utility:TweenObject(DropdownUIPadding, {PaddingTop = UDim.new(0, 0), PaddingBottom = UDim.new(0, 0)}, Dropdown.ASpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
						Utility:TweenObject(DropdownFrame1, {Position = UDim2.new(1, 0, 0, 48)}, Dropdown.ASpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
						Utility:TweenObject(DropDownModule, {Size = UDim2.new(0, 321, 0, 46)}, Dropdown.ASpeed)
						Utility:TweenObject(RightImage, {Rotation = 90}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
					else
						MultiClick = not MultiClick
						if MultiClick then
							table.insert(ClickedItems, Item)
							Utility:TweenObject(ItemButton, {BackgroundColor3 = UI.Theme.Dropdown.NewAnim}, 0.1)
						else
							for i = #ClickedItems, 1, -1 do
								if ClickedItems[i] == Item then
									table.remove(ClickedItems, i)
									break 
								end
							end
							Utility:TweenObject(ItemButton, {BackgroundColor3 = UI.Theme.Dropdown.OldAnim}, 0.1)
						end
						task.spawn(Dropdown.Callback, ClickedItems)
					end
				end)
				Items[#Items + 1] = { ItemButton = ItemButton, Selected = false }
			end
			DropdownFrame1.Size = UDim2.new(0, DropdownModuleL.AbsoluteContentSize.X, 0, 0)
    return Dropdown
		end
