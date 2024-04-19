local lib = {}

if game:GetService("CoreGui"):FindFirstChild("Dougware") then
    tempPos = game:GetService("CoreGui").Dougware.Frame.Position + UDim2.new(0,0,2,0)
    game.TweenService:Create(game:GetService("CoreGui").Dougware.Frame, TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{
    	Position = tempPos
    }):Play()
    wait(2)
    game:GetService("CoreGui").Dougware:Destroy()
end
if dougware_connect then
    for i,v in pairs(dougware_connect) do
        v:Disconnect()
    end
end
NotifCount = 0
DelPos = 0
function lib.Notification(Name,DelayNotif,ColorZ)
    NotifCount = NotifCount+1
    local HisPos = NotifCount
    local Notif = Instance.new("Frame")
    local UINotif = Instance.new("UICorner")
    local Color = Instance.new("Frame")
    local UIColor = Instance.new("UICorner")
    local ColorDis = Instance.new("Frame")
    local TextLab = Instance.new("TextLabel")
    local Stick = Instance.new("Frame")
    
    Tpos = (1-(HisPos*0.05))-0.05
    Notif.Name = "Notif"
    Notif.Parent = game:GetService("CoreGui").Dougware
    Notif.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
    Notif.ClipsDescendants = true
    Notif.Position = UDim2.new(1.5, 0, Tpos, 0)
    Notif.Size = UDim2.new(0, 293, 0, 46)
    Notif.AnchorPoint = Vector2.new(1,0)
    Notif.AutomaticSize = "X"
    
    UINotif.Name = "UINotif"
    UINotif.Parent = Notif
    
    Color.Name = "Color"
    Color.Parent = Notif
    Color.BackgroundColor3 = ColorZ
    Color.Size = UDim2.new(0, 12, 0, 46)
    
    UIColor.Name = "UIColor"
    UIColor.Parent = Color
    
    ColorDis.Name = "Color-Dis"
    ColorDis.Parent = Color
    ColorDis.BackgroundColor3 = ColorZ
    ColorDis.BorderSizePixel = 0
    ColorDis.Position = UDim2.new(0.5, 0, 0, 0)
    ColorDis.Size = UDim2.new(0, 6, 0, 46)
    
    TextLab.Name = "TextLab"
    TextLab.Parent = Notif
    TextLab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLab.BackgroundTransparency = 1.000
    TextLab.Position = UDim2.new(0.0853242353, 0, 0.239130437, 0)
    TextLab.Size = UDim2.new(0, 256, 0, 23)
    TextLab.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
    TextLab.TextSize = 14.000
    TextLab.TextXAlignment = Enum.TextXAlignment.Left
    TextLab.TextColor3 = ColorZ
    TextLab.AutomaticSize = "X"
    TextLab.Text = ""
    
    Stick.Name = "Stick"
    Stick.Parent = Notif
    Stick.BackgroundColor3 = ColorZ
    Stick.BorderSizePixel = 0
    Stick.Position = UDim2.new(0.0853242353, 0, 0.739130437, 0)
    Stick.Size = UDim2.new(0, 0, 0, 2)
    
    local TempDelay = true
    
    local OldNot = NotifCount
    spawn(function() 
        while wait() do
            if OldNot > NotifCount and HisPos > DelPos then
                local TempPoss = Notif.Position.Y.Scale+0.05
                HisPos = HisPos-1
                if TempDelay then
                    game.TweenService:Create(Notif, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{
                        Position = UDim2.new(.98, 0, TempPoss, 0)
                    }):Play()
                end
                OldNot = OldNot-1
            else
                OldNot = NotifCount
            end
            wait(.1)
        end
    end)
    game.TweenService:Create(Notif, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{
    	Position = UDim2.new(.98, 0, Tpos, 0)
    }):Play()
    wait(.5)
    spawn(function()
    c = string.split(Name,"")
    for i,v in pairs(c) do
        TextLab.Text = TextLab.Text:gsub("_","")
        TextLab.Text = TextLab.Text..v.."_"
        TextLab.Position = TextLab.Position - UDim2.new(0.0005, 0, 0, 0)
        Stick.Position = Stick.Position - UDim2.new(0.0005, 0, 0, 0)
        wait(.02)
    end
    game.TweenService:Create(Stick, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{
    	Size = UDim2.new(0, TextLab.AbsoluteSize.X-10, 0, 2)
    }):Play()
    wait(.5)
    TextLab.Text = TextLab.Text:gsub("_","").."   "
    wait(DelayNotif)
    game.TweenService:Create(Stick, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{
    	Size = UDim2.new(0, 0, 0, 2)
    }):Play()
    TempDelay = false
    game.TweenService:Create(Notif, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{
    	Position = UDim2.new(1.5, 0, Notif.Position.Y.Scale, 0)
    }):Play()
    wait(.5)
    DelPos = HisPos
    NotifCount = NotifCount-1
    Notif:Destroy()
    end)
end

getgenv().dougware_connect = {}
function lib.Window(Name, Des, Image, DefBind)
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local Left = Instance.new("ImageLabel")
    local NameLibrary = Instance.new("TextLabel")
    local Creator = Instance.new("TextLabel")
    local Right = Instance.new("ImageLabel")
    local Container = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")
    local ImageLabel_2 = Instance.new("ImageLabel")
    local NameLibrary = Instance.new("TextLabel")
    local Creator = Instance.new("TextLabel")
    local Right = Instance.new("ImageLabel")
    local Shadow = Instance.new("ImageLabel")
    local ToggleUI = Instance.new("Frame")
    local Label = Instance.new("Frame")
    local UICornerTU = Instance.new("UICorner")
    local Bind = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")
    local ToggleUILabel = Instance.new("TextLabel")

    Shadow.Name = "Shadow"
    Shadow.Parent = Frame
    Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Shadow.BackgroundTransparency = 1.000
    Shadow.Position = UDim2.new(-0.320338994, 0, -0.277936965, 0)
    Shadow.Size = UDim2.new(0, 958,0, 535)
    Shadow.ZIndex = 0
    Shadow.Image = "rbxassetid://5587865193"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.4
    
    ScreenGui.Parent = game:WaitForChild("CoreGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Name = "Dougware"
    
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame.BackgroundTransparency = 1.000
    Frame.Position = UDim2.new(0.34196496, 0, 1.1, 0)
    Frame.Size = UDim2.new(0, 590, 0, 349)
    
    Left.Name = "Left"
    Left.Parent = Frame
    Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Left.BackgroundTransparency = 1.000
    Left.Position = UDim2.new(-0.000671383925, 0, -0.00421339273, 0)
    Left.Size = UDim2.new(0, 180, 0, 350)
    Left.ZIndex = 2
    Left.Image = "rbxassetid://3570695787"
    Left.ImageColor3 = Color3.fromRGB(26, 26, 26)
    Left.ScaleType = Enum.ScaleType.Slice
    Left.SliceCenter = Rect.new(100, 100, 100, 100)
    Left.SliceScale = 0.100
    
    Container.Name = "Container"
    Container.Parent = Left
    Container.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
    Container.BorderSizePixel = 0
    Container.Position = UDim2.new(0, 0, 0.13333331, 0)
    Container.Size = UDim2.new(0, 180, 0, 290)
    
    UIListLayout.Parent = Container
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0.0146000003, 0)
    
    UIPadding.Parent = Container
    UIPadding.PaddingLeft = UDim.new(0.0299999993, 0)
    UIPadding.PaddingTop = UDim.new(0.0250000004, 0)
    
    ImageLabel_2.Parent = Left
    ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_2.BackgroundTransparency = 1.000
    ImageLabel_2.Position = UDim2.new(0.0199999996, 0, 0, 0)
    ImageLabel_2.Size = UDim2.new(0, 41, 0, 44)
    ImageLabel_2.Image = "rbxassetid://"..tostring(Image)
    ImageLabel_2.ImageColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_2.ScaleType = Enum.ScaleType.Crop
    
    NameLibrary.Name = "NameLibrary"
    NameLibrary.Parent = Left
    NameLibrary.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameLibrary.BackgroundTransparency = 1.000
    NameLibrary.Position = UDim2.new(0.272222221, 0, 0.0225603376, 0)
    NameLibrary.Size = UDim2.new(0, 124, 0, 21)
    NameLibrary.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
    NameLibrary.Text = Name or "Cat Hub Revival"
    NameLibrary.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameLibrary.TextSize = 14.000
    NameLibrary.TextWrapped = true
    NameLibrary.TextXAlignment = Enum.TextXAlignment.Left
    
    Creator.Name = "Creator"
    Creator.Parent = Left
    Creator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Creator.BackgroundTransparency = 1.000
    Creator.Position = UDim2.new(0.272222221, 0, 0.0825603381, 0)
    Creator.Size = UDim2.new(0, 131, 0, 14)
    Creator.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
    Creator.Text = Des or "Made By Senpaigmx"
    Creator.TextColor3 = Color3.fromRGB(255, 255, 255)
    Creator.TextSize = 10.000
    Creator.TextWrapped = true
    Creator.TextXAlignment = Enum.TextXAlignment.Left
    
    Right.Name = "Right"
    Right.Parent = Frame
    Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Right.BackgroundTransparency = 1.000
    Right.BorderSizePixel = 0
    Right.Position = UDim2.new(0.320675433, 0, -0.0016456095, 0)
    Right.Size = UDim2.new(0, 400, 0, 350)
    Right.Image = "rbxassetid://17117023655"
    Right.ScaleType = Enum.ScaleType.Crop
    
    UICor = Instance.new("UICorner", Right)
    
    ToggleUI.Name = "Toggle-UI"
    ToggleUI.Parent = Left
    ToggleUI.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    ToggleUI.BorderSizePixel = 0
    ToggleUI.Position = UDim2.new(0.0599999987, 0, 0.874000013, 0)
    ToggleUI.Size = UDim2.new(0, 160, 0, 44)
    
    Label.Name = "Label"
    Label.Parent = ToggleUI
    Label.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    Label.BorderSizePixel = 0
    Label.Position = UDim2.new(0, 0, 0.545454562, 0)
    Label.Size = UDim2.new(0, 160, 0, 20)
    
    UICornerTU.Name = "UICornerTU"
    UICornerTU.Parent = ToggleUI
    
    Bind.Name = "Bind"
    Bind.Parent = ToggleUI
    Bind.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
    Bind.Position = UDim2.new(0.53125, 0, 0.19999972, 0)
    Bind.Size = UDim2.new(0, 65, 0, 21)
    Bind.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
    Bind.Text = DefBind or "LeftAlt"
    Bind.TextTruncate = "AtEnd"
    Bind.TextColor3 = Color3.fromRGB(255, 255, 255)
    Bind.TextSize = 14.000
    
    UICorner.Parent = Bind
    
    ToggleUILabel.Name = "Toggle-UI-Label"
    ToggleUILabel.Parent = ToggleUI
    ToggleUILabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ToggleUILabel.BackgroundTransparency = 1.000
    ToggleUILabel.Position = UDim2.new(0.0625, 0, 0.19999972, 0)
    ToggleUILabel.Size = UDim2.new(0, 65, 0, 21)
    ToggleUILabel.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
    ToggleUILabel.Text = "UI-Toggle"
    ToggleUILabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleUILabel.TextSize = 14.000
	
	game.TweenService:Create(game:GetService("CoreGui").Dougware.Frame, TweenInfo.new(.8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{
    	Position = UDim2.new(0.34196496, 0, 0.334146351, 0)
    }):Play()
    wait(.8)
    
    local dragging
    local dragInput
    local dragStart
    local startPos
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local function change(a)
    	local diff = a.Position - dragStart
        local tween = TweenService:Create(Frame, tweenInfo, {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + diff.X, startPos.Y.Scale, startPos.Y.Offset + diff.Y)})
	    tween:Play()
    end
    dougware_connect[#dougware_connect+1] = Frame.InputChanged:Connect(function(a)
        if a.UserInputType == Enum.UserInputType.MouseMovement or a.UserInputType == Enum.UserInputType.Touch then
            dragInput = a
        end
    end)
	dougware_connect[#dougware_connect+1] = Frame.InputBegan:Connect(function(a)
        if a.UserInputType == Enum.UserInputType.MouseButton1 or a.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = a.Position
		    startPos = Frame.Position
		    
		    dougware_connect[#dougware_connect+1] = a.Changed:Connect(function()
		        if a.UserInputState == Enum.UserInputState.End then
		            dragging = false
		        end
		    end)
        end
    end)
    
    dougware_connect[#dougware_connect+1] = UserInputService.InputChanged:Connect(function(a)
        if a == dragInput and dragging == true then
            change(a)
        end
    end)
    
	local listL = {"W","A","S","D","Space","Unknown","Tab","Escape","Return"}
	local por = true
	dougware_connect[#dougware_connect+1] = Bind.MouseButton1Click:Connect(function() 
		local zdd
		por = false
		Bind.Text = "..."
		zdd = game.UserInputService.InputBegan:Connect(function(b)
			if not table.find(listL,b.KeyCode.Name) then
				Bind.Text = b.KeyCode.Name
			end
			zdd:Disconnect()
		end)
	end)
	
	dougware_connect[#dougware_connect+1] = game.UserInputService.InputBegan:Connect(function(b)
		if (Bind.Text == b.KeyCode.Name) and por then
            ScreenGui.Enabled = not ScreenGui.Enabled
		elseif not por then
			por = true
		end
	end)
	
	local Tabs = {}
	local d = false
	local cota = 0
	
	function Tabs:Tab(Name,Image)
	    local Tab = Instance.new("ImageButton")
        local TextLabel = Instance.new("TextLabel")
        local ImageLabel = Instance.new("ImageLabel")
	    local Frame_2 = Instance.new("Frame")
	    cota = cota+1
	    
	    Tab.Name = "Tab"
        Tab.Parent = Container
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 1.000
        Tab.BorderSizePixel = 0
        Tab.Position = UDim2.new(1.74785669e-07, 0, 0, 0)
        Tab.Size = UDim2.new(0, 168, 0, 25)
        Tab.Image = "rbxassetid://3570695787"
        Tab.ImageColor3 = Color3.fromRGB(26, 26, 26)
        Tab.ScaleType = Enum.ScaleType.Slice
        Tab.SliceCenter = Rect.new(100, 100, 100, 100)
        Tab.SliceScale = 0.100
        Tab.ImageTransparency = 1
        
        TextLabel.Parent = Tab
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Position = UDim2.new(0.25, 0, 0.07, 0)
        TextLabel.Size = UDim2.new(0, 123, 0, 25)
        TextLabel.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
        TextLabel.Text = Name
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextSize = 15.000
        TextLabel.TextWrapped = true
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.TextTransparency = 1
        
        ImageLabel.Parent = Tab
        ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel.BackgroundTransparency = 1.000
        ImageLabel.Position = UDim2.new(0.0299999993, 0, 0, 0)
        ImageLabel.Size = UDim2.new(0, 25, 0, 25)
        ImageLabel.Image = "rbxassetid://"..Image
        ImageLabel.ImageTransparency = 1
        
        Frame_2.Parent = Tab
        Frame_2.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
        Frame_2.BorderSizePixel = 0
        Frame_2.Position = UDim2.new(0.200000003, 0, 0, 0)
        Frame_2.Size = UDim2.new(0, 2, 0, 25)
        Frame_2.BackgroundTransparency = 0
        
        local tabs = Container
    	local right = Right
    	local count1 = 1
    	local countOld = 1
    	
    	local Section = Instance.new("ScrollingFrame")
        local UIListLayout_2 = Instance.new("UIListLayout")
         
        Section.Name = "Section"
        Section.Parent = Right
        Section.Active = true
        Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Section.BackgroundTransparency = 1.000
        Section.Position = UDim2.new(0.0250000004, 0, 0.0371428579, 0)
        Section.Size = UDim2.new(0, 380, 0, 330)
        Section.CanvasSize = UDim2.new(0, 0, 0, 0)
        Section.ScrollBarThickness = 0
        Section.AutomaticCanvasSize = "Y"
        Section.Visible = true and cota == 1 or false
        if Section.Visible then TabOld = Section end
        
        UIListLayout_2.Parent = Section
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0.0199999996, 0)
        
        local function ChangeVisible(Brick,Toggle)
            if #Brick:GetChildren() > 0 then
                for i,v in pairs(Brick:GetChildren()) do
                    if v:IsA("TextButton") or v:IsA("TextLabel") then
                        game.TweenService:Create(v, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                            BackgroundTransparency = Toggle,
                            TextTransparency = Toggle
                        }):Play()
                    elseif not v:IsA("UIListLayout") and not v:IsA("UICorner") then
                        game.TweenService:Create(v, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                            BackgroundTransparency = Toggle
                        }):Play()
                    end
                    for ii,vv in pairs(v:GetChildren()) do
                        if v:IsA("TextButton") or v:IsA("TextLabel") then
                            game.TweenService:Create(v, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                                BackgroundTransparency = Toggle,
                                TextTransparency = Toggle
                            }):Play()
                        else
                            game.TweenService:Create(v, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                                BackgroundTransparency = Toggle
                            }):Play()
                        end
                    end
                end
            else
                if Brick:IsA("TextButton") and Brick.Name ~= "Tab" then
                    game.TweenService:Create(Brick, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                        BackgroundTransparency = Toggle,
                        TextTransparency = Toggle
                    }):Play()
                elseif Brick.Name ~= "Tab" then
                    game.TweenService:Create(Brick, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                        BackgroundTransparency = Toggle
                    }):Play()
                end
            end
        end
        
        ChangeVisible(Section,1)
        wait(.1)
        game.TweenService:Create(ImageLabel, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
            ImageTransparency = 0
        }):Play()
        game.TweenService:Create(Tab, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
            ImageTransparency = 0
        }):Play()
        game.TweenService:Create(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
            TextTransparency = 0
        }):Play()
        
        if Section.Visible then ChangeVisible(Section,0) end
    	local text = Tab.TextLabel
    	local image = Tab.ImageLabel
    	dougware_connect[#dougware_connect+1] = Tab.MouseEnter:Connect(function()
    		game.TweenService:Create(text, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
    			TextColor3 = Color3.fromRGB(255, 255, 255)
    		}):Play()
    		game.TweenService:Create(image, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
    			ImageColor3 = Color3.fromRGB(255, 255, 255)
    		}):Play()
    	end)
    	dougware_connect[#dougware_connect+1] = Tab.MouseLeave:Connect(function()
    		game.TweenService:Create(text, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
    			TextColor3 = Color3.fromRGB(255,255,255)
    		}):Play()
    		game.TweenService:Create(image, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
    			ImageColor3 = Color3.fromRGB(255,255,255)
    		}):Play()
    	end)
    	dougware_connect[#dougware_connect+1] = Tab.MouseButton1Down:Connect(function()
    		if not d then
    			d = true
    			game.TweenService:Create(Tab, TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
    				Size = UDim2.new(0, 155,0, 25)
    			}):Play()
    			if TabOld then
        			ChangeVisible(TabOld,1)
        			wait(.1)
    		    	TabOld.Visible = false
    			end
    			wait(.05)
    			game.TweenService:Create(Tab, TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
        			Size = UDim2.new(0, 168,0, 25)
        		}):Play()
        		game.TweenService:Create(right, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
        			Size = UDim2.new(0, 0, 0, 350)
        		}):Play()
        		task.wait(.25)
        		if Section == TabOld then
        		    game.TweenService:Create(Frame, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
        			    Size = UDim2.new(0, 180,0, 350)
        		    }):Play()
        		    game.TweenService:Create(Shadow, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
        		    	Size = UDim2.new(0, 375,0, 528),
        		    	Position = UDim2.new(-0.5, 0,-0.25, 0)
        		    }):Play()
        		    task.wait(.25)
        		end
    			if TabOld ~= Section then
        			game.TweenService:Create(right, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
        				Size = UDim2.new(0, 400, 0, 350)
        			}):Play()
        			game.TweenService:Create(Frame, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
        				Size = UDim2.new(0, 590,0, 350)
        			}):Play()
        			game.TweenService:Create(Shadow, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
        				Size = UDim2.new(0, 958,0, 528),
        				Position = UDim2.new(-0.32, 0,-0.278, 0)
        			}):Play()
        			task.wait(.25)
        			ChangeVisible(Section,0)
        			Section.Visible = true
        			TabOld = Section
        		else
        		    TabOld = nil
        		end
    			d = false
    		end
    	end)
            
        local SubSections = {}
        
        function SubSections:SubSection(Name)
            local Section_2 = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local Main = Instance.new("Frame")
            local UIListLayout_3 = Instance.new("UIListLayout")
            local Title = Instance.new("TextLabel")
            local UIPadding_2 = Instance.new("UIPadding")
            
            Section_2.Name = "Section"
            Section_2.Parent = Section
            Section_2.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            Section_2.BorderSizePixel = 0
            Section_2.Position = UDim2.new(0.644736767, 0, 0.157575667, 0)
            Section_2.Size = UDim2.new(0, 380, 0, 40)
            Section_2.AutomaticSize = "Y"
            
            UICorner.Parent = Section_2
            
            Main.Name = Name
            Main.Parent = Section_2
            Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Main.BackgroundTransparency = 1.000
            Main.Position = UDim2.new(0.0263157897, 0, 0, 0)
            Main.Size = UDim2.new(0, 360, 0, 32)
            Main.AutomaticSize = "Y"
            
            UIListLayout_3.Parent = Main
            UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_3.Padding = UDim.new(0, 4)
            
            UIPadding_2.Parent = Main
            UIPadding_2.PaddingBottom = UDim.new(0, 9)
            UIPadding_2.PaddingTop = UDim.new(0, 5)
            
            Title.Name = "Title"
            Title.Parent = Main
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.Position = UDim2.new(0.129166678, 0, 0.0313588865, 0)
            Title.Size = UDim2.new(0, 123, 0, 14)
            Title.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
            Title.Text = Name
            Title.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title.TextSize = 12.000
            Title.TextWrapped = true
            
            
            local Item = {}
            function Item:Button(Name,Callback)
                local Button = Instance.new("TextButton")
                local Frame_3 = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local TextLabel_2 = Instance.new("TextLabel")
                
                TextWarn = "Warn!"
                Button.Name = "Button"
                Button.Parent = Main
                Button.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
                Button.BackgroundTransparency = 1.000
                Button.Size = UDim2.new(0, 360, 0, 35)
                Button.Font = Enum.Font.Unknown
                Button.Text = ""
                Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                Button.TextSize = 14.000
                
                Frame_3.Parent = Button
                Frame_3.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
                Frame_3.Size = UDim2.new(0, 360, 0, 35)
                
                UICorner_2.Parent = Frame_3
                
                TextLabel_2.Parent = Frame_3
                TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_2.BackgroundTransparency = 1.000
                TextLabel_2.Size = UDim2.new(0, 360, 0, 35)
                TextLabel_2.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
                TextLabel_2.Text = Name
                TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_2.TextSize = 14.000
                
                local lock = false
                local ButtonFun = {}
                
                function ButtonFun:Click()
                    if not lock then
                    	game.TweenService:Create(TextLabel_2, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                    		TextColor3 = Color3.fromRGB(255, 255, 255)
                    	}):Play()
                    	task.wait(.1)
                    	game.TweenService:Create(TextLabel_2, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                    		TextColor3 = Color3.fromRGB(255, 255, 255)
                    	}):Play()
                    	spawn(function() Callback() end)
                    else
                        game.TweenService:Create(Frame_3, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                    		Position = UDim2.new(0.01,0,0,0)
                    	}):Play()
                    	task.wait(.1)
                    	game.TweenService:Create(Frame_3, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                    		Position = UDim2.new(-0.01,0,0,0)
                    	}):Play()
                    	task.wait(.1)
                    	game.TweenService:Create(Frame_3, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                    		Position = UDim2.new(0,0,0,0)
                    	}):Play()
                    	lib.Notification(TextWarn, 5, Color3.fromRGB(255, 0, 0))
                    end
                end
                function ButtonFun:Lock(Wr)
                    lock = true
                    TextWarn = Wr or TextWarn
                end
                function ButtonFun:UnLock()
                    lock = false
                end
                
                dougware_connect[#dougware_connect+1] = Button.MouseButton1Click:Connect(function()
                    ButtonFun:Click()
                end)
            	dougware_connect[#dougware_connect+1] = Button.MouseEnter:Connect(function()
            		game.TweenService:Create(Frame_3, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
            			BackgroundColor3 = Color3.fromRGB(25, 21, 26)
            		}):Play()
            	end)
            	dougware_connect[#dougware_connect+1] = Button.MouseLeave:Connect(function()
            		game.TweenService:Create(Frame_3, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
            			BackgroundColor3 = Color3.fromRGB(16, 16, 16)
            		}):Play()
            	end)
            	return ButtonFun
            end
            
            function Item:Toggle(Name,Def,Callback)
                local Toggle = Instance.new("TextButton")
                local Frame_4 = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local TextLabel_3 = Instance.new("TextLabel")
                local Frame_5 = Instance.new("Frame")
                local UICorner_4 = Instance.new("UICorner")
                local Frame_6 = Instance.new("Frame")
                local UICorner_5 = Instance.new("UICorner")
                
                Toggle.Name = "Toggle"
                Toggle.Parent = Main
                Toggle.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
                Toggle.BackgroundTransparency = 1.000
                Toggle.Size = UDim2.new(0, 360, 0, 35)
                Toggle.Font = Enum.Font.Unknown
                Toggle.Text = ""
                Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
                Toggle.TextSize = 14.000
                
                Frame_4.Parent = Toggle
                Frame_4.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
                Frame_4.Size = UDim2.new(0, 360, 0, 35)
                
                UICorner_3.Parent = Frame_4
                
                TextLabel_3.Parent = Frame_4
                TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_3.BackgroundTransparency = 1.000
                TextLabel_3.Position = UDim2.new(0.03, 0, 0, 0)
                TextLabel_3.Size = UDim2.new(0, 255, 0, 35)
                TextLabel_3.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
                TextLabel_3.Text = Name
                TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_3.TextSize = 14.000
                TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
                
                Frame_5.Parent = Frame_4
                Frame_5.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                Frame_5.Position = UDim2.new(0.797222197, 0, 0.142857149, 0)
                Frame_5.Size = UDim2.new(0, 60, 0, 25)
                
                UICorner_4.Parent = Frame_5
                
                Frame_6.Parent = Frame_5
                if not Def then
                    Frame_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Frame_6.Position = UDim2.new(0.03, 0, 0.08, 0)
                else
                    Frame_6.BackgroundColor3 = Color3.fromRGB(213, 75, 208)
                    Frame_6.Position = UDim2.new(0.53, 0, 0.08, 0)
                end
                Frame_6.Size = UDim2.new(0, 26, 0, 21)
                
                UICorner_5.Parent = Frame_6
                
                local toggle = Def
                local ToggleFun = {}
                local lock = false
                local lockDelay = false
                local TextWarn = ""
                
                function ToggleFun:Lock(txt)
                    lock = true
                    TextWarn = txt
                end
                
                function ToggleFun:UnLock()
                    lock = false
                end
                Tg = false
                function ToggleFun:State(Dt)
                    if not lock then
                        if Dt then
                            game.TweenService:Create(Frame_6, TweenInfo.new(0.05, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
                                Position = UDim2.new(0.53, 0, 0.08, 0),
                                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            }):Play()
                        else
                            game.TweenService:Create(Frame_6, TweenInfo.new(0.05, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
                            	Position = UDim2.new(0.03, 0, 0.08, 0),
                            	BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            }):Play()
                        end
                        toggle = Dt
                        spawn(function() Callback(Dt) end)
                    else
                        if Tg then
                            game.TweenService:Create(Frame_4, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
                                Position = UDim2.new(0.01, 0, 0, 0)
                            }):Play()
                            wait(.1)
                            game.TweenService:Create(Frame_4, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
                                Position = UDim2.new(-0.01, 0, 0, 0)
                            }):Play()
                            wait(.1)
                            game.TweenService:Create(Frame_4, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
                                Position = UDim2.new(0, 0, 0, 0)
                            }):Play()
                            lib.Notification(TextWarn, 5, Color3.fromRGB(255, 0, 0))
                        else
                            Tg = true
                        end
                    end
                end
                ToggleFun:State(Def)
                
            	dougware_connect[#dougware_connect+1] = Toggle.MouseButton1Click:Connect(function() 
            		toggle = not toggle
            		ToggleFun:State(toggle)
            	end)
            	dougware_connect[#dougware_connect+1] = Toggle.MouseEnter:Connect(function()
            		game.TweenService:Create(TextLabel_3, TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
            			TextColor3 = Color3.fromRGB(255, 255, 255)
            		}):Play()
            	end)
            	dougware_connect[#dougware_connect+1] = Toggle.MouseLeave:Connect(function()
            		game.TweenService:Create(TextLabel_3, TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
            			TextColor3 = Color3.fromRGB(255, 255, 255)
            		}):Play()
            	end)
            	
            	return ToggleFun
            end
            
            function Item:DropDown(Name,ListAll,Callback)
                local DropDown = Instance.new("Frame")
                local UICorner_6 = Instance.new("UICorner")
                local UIListLayout_4 = Instance.new("UIListLayout")
                local ListName = Instance.new("Frame")
                local ListToggle = Instance.new("TextLabel")
                local LabelName = Instance.new("TextLabel")
                local TextButton = Instance.new("TextButton")
                local List = Instance.new("Frame")
                local ListScroll = Instance.new("ScrollingFrame")
                local UIListLayout_5 = Instance.new("UIListLayout")
                local UIPadding_3 = Instance.new("UIPadding")
                local TextBox = Instance.new("TextBox")
                
                DropDown.Name = "DropDown"
                DropDown.Parent = Main
                DropDown.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
                DropDown.Position = UDim2.new(0.361111104, 0, 0.889679611, 0)
                DropDown.Size = UDim2.new(0, 360, 0, 35)
                DropDown.AutomaticSize = "Y"
                
                UICorner_6.Parent = DropDown
                
                UIListLayout_4.Parent = DropDown
                UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
                
                ListName.Name = "ListName"
                ListName.Parent = DropDown
                ListName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ListName.BackgroundTransparency = 1.000
                ListName.Size = UDim2.new(0, 360, 0, 35)
                
                ListToggle.Name = "ListToggle"
                ListToggle.Parent = ListName
                ListToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ListToggle.BackgroundTransparency = 1.000
                ListToggle.Position = UDim2.new(0.866666675, 0, 0, 0)
                ListToggle.Size = UDim2.new(0, 35, 0, 35)
                ListToggle.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
                ListToggle.Text = "+"
                ListToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
                ListToggle.TextScaled = true
                ListToggle.TextSize = 14.000
                ListToggle.TextWrapped = true
                
                TextBox.Parent = ListName
                TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextBox.BackgroundTransparency = 1.000
                TextBox.Position = UDim2.new(0.0333333351, 0, 0, 0)
                TextBox.Size = UDim2.new(0, 300, 0, 35)
                TextBox.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
                TextBox.Text = Name or "DropBox"
                TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextBox.TextSize = 14.000
                TextBox.TextXAlignment = Enum.TextXAlignment.Left
                TextBox.ZIndex = 3
                
                TextButton.Parent = ListName
                TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.BackgroundTransparency = 1.000
                TextButton.Size = UDim2.new(0, 360, 0, 35)
                TextButton.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
                TextButton.Text = ""
                TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                TextButton.TextSize = 14.000
                TextButton.ZIndex = 1
                
                List.Name = "List"
                List.Parent = DropDown
                List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                List.BackgroundTransparency = 1.000
                List.Position = UDim2.new(0, 0, 0.777777791, 0)
                List.Size = UDim2.new(0, 360, 0, 0)
                List.Visible = false
                List.ZIndex = 3
                
                ListScroll.Name = "ListScroll"
                ListScroll.Parent = List
                ListScroll.Active = true
                ListScroll.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                ListScroll.BorderSizePixel = 0
                ListScroll.Position = UDim2.new(0.0333333351, 0, 0, 0)
                ListScroll.Size = UDim2.new(0, 335, 0, 0)
                ListScroll.Visible = false
                ListScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
                ListScroll.AutomaticCanvasSize = "Y"
                ListScroll.ScrollBarThickness = 1
                
                UIListLayout_5.Parent = ListScroll
                UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_5.Padding = UDim.new(0, 4)
                
                UIPadding_3.Parent = ListScroll
                UIPadding_3.PaddingBottom = UDim.new(0, 5)
                UIPadding_3.PaddingLeft = UDim.new(0, 17)
                UIPadding_3.PaddingTop = UDim.new(0, 5)
                local lock = false
                
                local DropDownFunc = {}
                
                function DropDownFunc:Update(ListDrop)
                    for i,v in pairs(ListScroll:GetChildren()) do
                        if v:IsA("Frame") then
                            v:Destroy()
                        end
                    end
                    for i in next, ListDrop do
                        local Button_2 = Instance.new("Frame")
                        local UICorner_7 = Instance.new("UICorner")
                        local TextButton_2 = Instance.new("TextButton")
                        local TextLabel_4 = Instance.new("TextLabel")
                        
                        Button_2.Name = ListDrop[i].Name or ListDrop[i]
                        Button_2.Parent = ListScroll
                        Button_2.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
                        Button_2.Size = UDim2.new(0, 300, 0, 25)
                        
                        UICorner_7.Parent = Button_2
                        
                        TextButton_2.Parent = Button_2
                        TextButton_2.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
                        TextButton_2.BackgroundTransparency = 1.000
                        TextButton_2.Size = UDim2.new(0, 300, 0, 25)
                        TextButton_2.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
                        TextButton_2.Text = ""
                        TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextButton_2.TextSize = 14.000
                        
                        TextLabel_4.Parent = Button_2
                        TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel_4.BackgroundTransparency = 1.000
                        TextLabel_4.Size = UDim2.new(0, 300, 0, 25)
                        TextLabel_4.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
                        TextLabel_4.Text = ListDrop[i].Name or ListDrop[i]
                        TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel_4.TextSize = 14.000
                    end
                    for i,v in pairs(ListScroll:GetChildren()) do
                        if v:IsA("Frame") then
                            dougware_connect[#dougware_connect+1] = v.TextButton.MouseEnter:connect(function()
                    			game.TweenService:Create(v.TextLabel, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                    				TextColor3 = Color3.fromRGB(205, 205, 205)
                    			}):Play()
                    		end)
                    		dougware_connect[#dougware_connect+1] = v.TextButton.MouseLeave:connect(function()
                    			game.TweenService:Create(v.TextLabel, TweenInfo.new(0.18, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{
                    				TextColor3 = Color3.fromRGB(255, 255, 255)
                    			}):Play()
                    		end)
                    		dougware_connect[#dougware_connect+1] = v.TextButton.MouseButton1Click:Connect(function()
                    		    TextBox.Text = Name.." - "..v.TextLabel.Text or "DropDown - "..v.TextLabel.Text
                    		    Callback(v.TextLabel.Text)
                    		end)
                        end
                    end
                end
                DropDownFunc:Update(ListAll)
                
                function DropDownFunc:Lock(zze)
                    lock = true
                    TextWarn = zze or "Warn!"
                end
                function DropDownFunc:UnLock()
                    lock = false
                end
                
                local toggle = false
            	local cd = false
            	
            	local function OrC()
                	if not lock then
                    	if not cd then
                    		toggle = not toggle
                    		if toggle then
                    		    for i,v in pairs(ListScroll:GetChildren()) do
                    	            if v:IsA("Frame") then
                        	            v.Visible = true
                        	        end
                    	        end
                    			cd = true
                    			ListToggle.Text = "-"
                    			game.TweenService:Create(ListToggle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{
                    				Rotation = 180
                    			}):Play()
                    			List.Visible = true
                    			ListScroll.Visible = true
                    			game.TweenService:Create(List, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{
                    				Size = UDim2.new(0, 360, 0, 115)
                    			}):Play()
                    			game.TweenService:Create(ListScroll, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{
                    				Size = UDim2.new(0, 335,0, 105)
                    			}):Play()
                    			task.wait(.5)
                    			cd = false
                    		else
                    			cd = true
                    			ListToggle.Text = "+"
                    			game.TweenService:Create(ListToggle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{
                    				Rotation = 0
                    			}):Play()
                    			game.TweenService:Create(ListScroll, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{
                    				Size = UDim2.new(0, 335, 0, 0)
                    			}):Play()
                    			game.TweenService:Create(List, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{
                    				Size = UDim2.new(0, 360, 0, 0)
                    			}):Play()
                    			task.wait(0.2)
                    			List.Visible = false
                    			ListScroll.Visible = false
                    			cd = false
                    		end
                    	end
                    else
                        game.TweenService:Create(LabelName, TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
                    		TextColor3 = Color3.fromRGB(255, 0, 0)
                    	}):Play()
                    	game.TweenService:Create(ListToggle, TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
                    		TextColor3 = Color3.fromRGB(255, 0, 0)
                    	}):Play()
                        wait(.1)
                        game.TweenService:Create(LabelName, TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
                            TextColor3 = Color3.fromRGB(255, 255, 255)
                        }):Play()
                    	game.TweenService:Create(ListToggle, TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
                    		TextColor3 = Color3.fromRGB(255, 255, 255)
                    	}):Play()
                        lib.Notification(TextWarn, 5, Color3.fromRGB(255, 0, 0))
                    end
            	end
            	
            	dougware_connect[#dougware_connect+1] = TextButton.MouseButton1Click:Connect(function()
            	    OrC()
            	end)
            	dougware_connect[#dougware_connect+1] = TextButton.MouseEnter:Connect(function()
            		game.TweenService:Create(LabelName, TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
            			TextColor3 = Color3.fromRGB(255, 255, 255)
            		}):Play()
            	end)
            	dougware_connect[#dougware_connect+1] = TextButton.MouseLeave:Connect(function()
            		game.TweenService:Create(LabelName, TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
            			TextColor3 = Color3.fromRGB(255, 255, 255)
            		}):Play()
            	end)
            	dougware_connect[#dougware_connect+1] = TextBox.Focused:connect(function()
            	    if not ListScroll.Visible then
            	        OrC()
            	    end
            	end)
            	dougware_connect[#dougware_connect+1] = TextBox.FocusLost:connect(function()
            	    if ListScroll.Visible then
            	        OrC()
            	    end
            	    wait(.1)
            	    if TextBox == "" then
            	        TextBox.Text = Name
            	    end
            	end)
            	dougware_connect[#dougware_connect+1] = TextBox.Changed:Connect(function(z)
            	    if z == "Text" then
            	        for i,v in pairs(ListScroll:GetChildren()) do
            	            if v:IsA("Frame") then
                	            if not string.find(v.Name,TextBox.Text) then
                	                v.Visible = false
                	            else
                	                v.Visible = true
                	            end
                	        end
            	        end
            	    end
            	end)
            	
            	return DropDownFunc
            end
            
            function Item:TextBox(Name,Def,Callback)
                local TextBox = Instance.new("Frame")
                local UICorner_8 = Instance.new("UICorner")
                local TextLabel_5 = Instance.new("TextLabel")
                local TextBox_2 = Instance.new("TextBox")
                local UICorner_9 = Instance.new("UICorner")
                
                TextBox.Name = "TextBox"
                TextBox.Parent = Main
                TextBox.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
                TextBox.Size = UDim2.new(0, 360, 0, 35)
                
                UICorner_8.Parent = TextBox
                
                TextLabel_5.Parent = TextBox
                TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_5.BackgroundTransparency = 1.000
                TextLabel_5.Position = UDim2.new(0.0333333351, 0, 0, 0)
                TextLabel_5.Size = UDim2.new(0, 255, 0, 35)
                TextLabel_5.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
                TextLabel_5.Text = Name
                TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_5.TextSize = 14.000
                TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left
                
                TextBox_2.Parent = TextBox
                TextBox_2.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                TextBox_2.Position = UDim2.new(0.580555558, 0, 0.200000003, 0)
                TextBox_2.Size = UDim2.new(0, 138, 0, 21)
                TextBox_2.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
                TextBox_2.PlaceholderText = Def
                TextBox_2.Text = ""
                TextBox_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextBox_2.TextSize = 14.000
                TextBox_2.TextWrapped = true
                
                UICorner_9.Parent = TextBox_2
                
                dougware_connect[#dougware_connect+1] = TextBox_2.FocusLost:Connect(function()
                    spawn(function() Callback(TextBox_2.Text) end)
                end)
            end
            
            function Item:KeyBind(Name,Def,Callback,List)
                local KeyBox = Instance.new("Frame")
                local UICorner_10 = Instance.new("UICorner")
                local TextLabel_6 = Instance.new("TextLabel")
                local TextButton_3 = Instance.new("TextButton")
                local UICorner_11 = Instance.new("UICorner")
                
                KeyBox.Name = Name or "KeyBind"
                KeyBox.Parent = Main
                KeyBox.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
                KeyBox.Size = UDim2.new(0, 360, 0, 35)
                
                UICorner_10.Parent = KeyBox
                
                TextLabel_6.Parent = KeyBox
                TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_6.BackgroundTransparency = 1.000
                TextLabel_6.Position = UDim2.new(0.0333333351, 0, 0, 0)
                TextLabel_6.Size = UDim2.new(0, 255, 0, 35)
                TextLabel_6.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
                TextLabel_6.Text = Name or "KeyBind"
                TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_6.TextSize = 14.000
                TextLabel_6.TextXAlignment = Enum.TextXAlignment.Left
                
                TextButton_3.Parent = KeyBox
                TextButton_3.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                TextButton_3.Position = UDim2.new(0.962, 0, 0.200000003, 0)
                TextButton_3.Size = UDim2.new(0, 59, 0, 21)
                TextButton_3.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
                TextButton_3.Text = Def ~= "" and Def or "..."
                TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_3.TextSize = 14.000
                TextButton_3.AnchorPoint = Vector2.new(1,0)
                TextButton_3.AutomaticSize = "X"
                
                UICorner_11.Parent = TextButton_3
                
                local listd = {"W","A","S","D","Space","Unknown","Tab","Escape","Return","Backspace"} or List
            	dougware_connect[#dougware_connect+1] = TextButton_3.MouseButton1Click:Connect(function() 
            		local piska
            		TextButton_3.Text = "..."
            		piska = game.UserInputService.InputBegan:Connect(function(b)
            		    if not table.find(listd,b.KeyCode.Name) then
            				TextButton_3.Text = b.KeyCode.Name
            			end
            			piska:Disconnect()
            		end)
            	end)
            	dougware_connect[#dougware_connect+1] = game.UserInputService.InputBegan:Connect(function(b)
            		if b.KeyCode.Name == TextButton_3.Text then
            		    Callback(true)
            		end
            	end)
            end
            
            function Item:Label(Name, Pos)
                local Label = Instance.new("Frame")
                local UICorner_12 = Instance.new("UICorner")
                local TextLabel_7 = Instance.new("TextLabel")
                
                Label.Name = Name or "Label"
                Label.Parent = Main
                Label.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
                Label.Size = UDim2.new(0, 360, 0, 35)
                
                UICorner_12.Parent = Label
                
                TextLabel_7.Parent = Label
                TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_7.BackgroundTransparency = 1.000
                TextLabel_7.BorderColor3 = Color3.fromRGB(27, 42, 53)
                TextLabel_7.Position = UDim2.new(0.0333333351, 0, 0, 0)
                TextLabel_7.Size = UDim2.new(0, 335, 0, 35)
                TextLabel_7.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
                TextLabel_7.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_7.TextSize = 14.000
                if Pos == "Right" then
                    Alig = Enum.TextXAlignment.Right
                elseif Pos == "Center" then
                    Alig = Enum.TextXAlignment.Center
                elseif Pos == "Left" then
                    Alig = Enum.TextXAlignment.Left
                end
                TextLabel_7.TextXAlignment = Alig
                TextLabel_7.Text = Name or "Label"
                
                ReName = {}
                
                function ReName:Update(Name1)
            	    game.TweenService:Create(TextLabel_7, TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
            	    	TextTransparency = 1
            	    }):Play()
            	    wait(.185)
            	    TextLabel_7.Text = Name1 or "Label"
            	    game.TweenService:Create(TextLabel_7, TweenInfo.new(0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{
            	    	TextTransparency = 0
            	    }):Play()
                end
                
                return ReName
            end
            
            function Item:Slider(Name,min,max,current,spam,Callback)
                local Sliderz = Instance.new("Frame")
                local UICornerz = Instance.new("UICorner")
                local NameLabelz = Instance.new("TextLabel")
                local Valuez = Instance.new("TextLabel")
                local Framez = Instance.new("Frame")
                local UICorner_z = Instance.new("UICorner")
                local Bar = Instance.new("TextButton")
                local Frame_z = Instance.new("Frame")
                local UICorner_zz = Instance.new("UICorner")
                local UICorner_zzz = Instance.new("UICorner")
                
                Sliderz.Name = "Slider"
                Sliderz.Parent = Main
                Sliderz.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
                Sliderz.Size = UDim2.new(0, 360, 0, 35)
                
                UICornerz.Parent = Sliderz
                
                NameLabelz.Name = "NameLabel"
                NameLabelz.Parent = Sliderz
                NameLabelz.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                NameLabelz.BackgroundTransparency = 1.000
                NameLabelz.Position = UDim2.new(0.0333333351, 0, 0, 0)
                NameLabelz.Size = UDim2.new(0, 106, 0, 35)
                NameLabelz.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
                NameLabelz.Text = Name
                NameLabelz.TextColor3 = Color3.fromRGB(255, 255, 255)
                NameLabelz.TextSize = 14.000
                NameLabelz.TextXAlignment = Enum.TextXAlignment.Left
                
                Valuez.Name = "Value"
                Valuez.Parent = Sliderz
                Valuez.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Valuez.BackgroundTransparency = 1.000
                Valuez.Position = UDim2.new(0.327777773, 0, 0.171428576, 0)
                Valuez.Size = UDim2.new(0, 54, 0, 22)
                Valuez.FontFace = Font.new("rbxasset://fonts/families/JosefinSans.json", Enum.FontWeight.Bold)
                Valuez.Text = current
                Valuez.TextColor3 = Color3.fromRGB(255, 255, 255)
                Valuez.TextSize = 16.000
                Valuez.TextXAlignment = Enum.TextXAlignment.Right
                
                Framez.Parent = Sliderz
                Framez.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Framez.BorderSizePixel = 0
                Framez.Position = UDim2.new(0.508333325, 0, 0.342857152, 0)
                Framez.Size = UDim2.new(0, 163, 0, 10)
                
                UICorner_z.CornerRadius = UDim.new(0, 20)
                UICorner_z.Parent = Framez
                
                Bar.Parent = Framez
                Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Bar.BackgroundTransparency = 1.000
                Bar.BorderSizePixel = 0
                Bar.Position = UDim2.new(0.00609756075, 0, 0, 0)
                Bar.Size = UDim2.new(0, 165, 0, 10)
                Bar.ZIndex = 2
                Bar.Font = Enum.Font.SourceSans
                Bar.Text = ""
                Bar.TextColor3 = Color3.fromRGB(0, 0, 0)
                Bar.TextSize = 14.000
                
                Frame_z.Parent = Bar
                Frame_z.BackgroundColor3 = Color3.fromRGB(205, 205, 205)
                Frame_z.Position = UDim2.new(-0.0122330943, 0, 0, 0)
                Frame_z.Size = UDim2.new(0, 166, 0, 10)
                Frame_z.BorderSizePixel = 0
                
                UICorner_zz.Parent = Frame_z
                
                UICorner_zzz.Parent = Bar
                
            	local CurrBar = Frame_z
            	local ValueTxt = Valuez
            	
            	local function getSize(Bar, min, max)
            		max = max - min -- i hate math
            	
            		local BarSize = Bar.AbsoluteSize.X
            		local CurrBarSize = Frame_z.Size.X.Offset
            		local Value = min + (max * (CurrBarSize / BarSize))
            		local Size = math.floor(Value)
            	
            		return Size
            	end
            	
            	local function setSize(Bar, max, min, curr)
            		Frame_z.Size = UDim2.new(0, ((curr / (max + min)) * Bar.AbsoluteSize.X), 1, 0)
            	end
            	
            	local UserInputService = game:GetService("UserInputService")
            	
            	local TweenService = game:GetService("TweenService")
            	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
            	
            	local PlayerMouse = game:GetService("Players").LocalPlayer:GetMouse()
            	
            	local isDown = false
            	local currSize = current
            	
            	dougware_connect[#dougware_connect+1] = Bar.MouseButton1Down:Connect(function()
            		isDown = true
            		repeat game:GetService("RunService").RenderStepped:Wait() until isDown == false
            		if not spam then
                		Callback(currSize)
                	end
            	end)
            	
            	dougware_connect[#dougware_connect+1] = UserInputService.InputEnded:Connect(function(input, gp)
            		if input.UserInputType == Enum.UserInputType.MouseButton1 then
            			isDown = false
            		end
            	end)
            	
            	setSize(Bar, max, min, current)
            	
            	dougware_connect[#dougware_connect+1] = PlayerMouse.Move:Connect(function()
            		if isDown == true then
            			local tween;
            	
            			if PlayerMouse.X < Bar.AbsolutePosition.X then
            				tween = TweenService:Create(CurrBar, tweenInfo, {Size = UDim2.new(0, 0, 1, 0)})
            			elseif PlayerMouse.X > (Bar.AbsolutePosition.X + Bar.AbsoluteSize.X) then
            				tween = TweenService:Create(CurrBar, tweenInfo, {Size = UDim2.new(0, Bar.AbsoluteSize.X, 1, 0)})
            			else
            				tween = TweenService:Create(CurrBar, tweenInfo, {Size = UDim2.new(0, (PlayerMouse.X - Bar.AbsolutePosition.X), 1, 0)})
            			end
            	
            			tween:Play()
            	
            			currSize = getSize(Bar, min, max)
            			ValueTxt.Text = currSize
            			if spam then
            			    Callback(currSize)
            			end
            		end
            	end)
            end
            
            return Item
        end
        return SubSections
	end
	return Tabs
end
return lib