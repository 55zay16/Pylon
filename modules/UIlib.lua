local TweenService = game:GetService("TweenService")
local UIlib = {}

function UIlib:InitWindow(Title)
    local Pylon = Instance.new("ScreenGui")
    local Main = Instance.new("TextLabel")
    local UIPadding = Instance.new("UIPadding")
    local Minimize = Instance.new("ImageButton")
    local Close = Instance.new("ImageButton")
    local Dropdown = Instance.new("Frame")
    local Tabs = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local Border = Instance.new("Frame")

    Pylon.Name = "Pylon"
    Pylon.Parent = game:WaitForChild("CoreGui")
    Pylon.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Main.Name = "Main"
    Main.Parent = Pylon
    Main.BackgroundColor3 = Color3.fromRGB(20, 26, 29)
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.305642635, 0, 0.198492467, 0)
    Main.Size = UDim2.new(0.324973881, 0, 0.0402010046, 0)
    Main.Font = Enum.Font.RobotoMono
    Main.Text = Title
    Main.TextColor3 = Color3.fromRGB(171, 227, 255)
    Main.TextScaled = true
    Main.TextSize = 14.000
    Main.TextWrapped = true
    Main.TextXAlignment = Enum.TextXAlignment.Left

    UIPadding.Parent = Main
    UIPadding.PaddingLeft = UDim.new(0, 4)

    Minimize.Name = "Minimize"
    Minimize.Parent = Main
    Minimize.AnchorPoint = Vector2.new(0.5, 0.5)
    Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Minimize.BackgroundTransparency = 1.000
    Minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Minimize.BorderSizePixel = 0
    Minimize.Position = UDim2.new(0.920926094, 0, 0.499689102, 0)
    Minimize.Size = UDim2.new(0.0518356487, 0, 1, 0)
    Minimize.Image = "rbxassetid://8445470826"
    Minimize.ImageRectOffset = Vector2.new(404, 404)
    Minimize.ImageRectSize = Vector2.new(96, 96)
    Minimize.ScaleType = Enum.ScaleType.Fit

    Close.Name = "Close"
    Close.Parent = Main
    Close.AnchorPoint = Vector2.new(0.5, 0.5)
    Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundTransparency = 1.000
    Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(0.973922014, 0, 0.5, 0)
    Close.Size = UDim2.new(0.0518092364, 0, 1, 0)
    Close.Image = "rbxassetid://8445470984"
    Close.ImageRectOffset = Vector2.new(304, 304)
    Close.ImageRectSize = Vector2.new(96, 96)
    Close.ScaleType = Enum.ScaleType.Fit

    Dropdown.Name = "Dropdown"
    Dropdown.Parent = Main
    Dropdown.BackgroundColor3 = Color3.fromRGB(42, 55, 62)
    Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Dropdown.BorderSizePixel = 0
    Dropdown.ClipsDescendants = true
    Dropdown.Position = UDim2.new(-0.00665500481, 0, 0.988693237, 0)
    Dropdown.Size = UDim2.new(1.00665498, 0, 12, 0)

    Tabs.Name = "Tabs" 
    Tabs.Parent = Dropdown
    Tabs.Active = true
    Tabs.BackgroundColor3 = Color3.fromRGB(20, 27, 30)
    Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tabs.BorderSizePixel = 0
    Tabs.Size = UDim2.new(0.999818683, 0, 0.104166664, 0)
    Tabs.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
    Tabs.ScrollBarThickness = 4
    Tabs.ScrollingDirection = Enum.ScrollingDirection.X 
    Tabs.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

    UIListLayout.Parent = Tabs
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.Padding = UDim.new(0, 5)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    Border.Name = "Border"
    Border.Parent = Dropdown
    Border.BackgroundColor3 = Color3.fromRGB(23, 29, 33)
    Border.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Border.BorderSizePixel = 0
    Border.Position = UDim2.new(0, 0, 0.104166664, 0) 
    Border.Size = UDim2.new(0.999818683, 0, 0.00260416674, 0)
    Border.ZIndex = 3


    coroutine.wrap(function() 
        local script = Instance.new('Script', Main)
        script.Name = "Pylon-Handler"

        local UserInputService = game:GetService("UserInputService")
        local runService = (game:GetService("RunService"));

        local gui = script.Parent

        local dragging
        local dragInput
        local dragStart
        local startPos

        local function Lerp(a, b, m)
            return a + (b - a) * m
        end;

        local lastMousePos
        local lastGoalPos
        local DRAG_SPEED = (8); -- // The speed of the UI darg.
        local function Update(dt)
            if not (startPos) then return end;
            if not (dragging) and (lastGoalPos) then
                gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
                return 
            end;

            local delta = (lastMousePos - UserInputService:GetMouseLocation())
            local xGoal = (startPos.X.Offset - delta.X);
            local yGoal = (startPos.Y.Offset - delta.Y);
            lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
            gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
        end;

        gui.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = gui.Position
                lastMousePos = UserInputService:GetMouseLocation()

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        gui.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        runService.Heartbeat:Connect(Update)

        Minimize.MouseButton1Click:Connect(function()
            if Minimize.Rotation == 0 then
                TweenService:Create(Minimize, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 180}):Play()
                Dropdown:TweenSize(UDim2.new(1.00665498, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.3, true)
            elseif Minimize.Rotation == 180 then
                TweenService:Create(Minimize, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 0}):Play()
                Dropdown:TweenSize(UDim2.new(1.00665498, 0, 12, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.3, true)
            end
        end)

        Close.MouseButton1Click:Connect(function()
            gui:Destroy()
        end)
    end)()

    return Pylon
end

function UIlib:CreateTab(PylonInstance, Title)
    local TabName = Instance.new("Frame")
    local Buttons = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local Settings = Instance.new("ScrollingFrame")
    local UIListLayout_2 = Instance.new("UIListLayout")
    
    TabName.Name = Title
    TabName.Parent = PylonInstance.Main.Dropdown
    TabName.BackgroundColor3 = Color3.fromRGB(29, 38, 43)
    TabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabName.BorderSizePixel = 0
    TabName.Visible = false
    TabName.Position = UDim2.new(0, 0, 0.104166664, 0)
    TabName.Size = UDim2.new(0.641362786, 0, 0.895833313, 0)
    
    Buttons.Name = "Buttons"
    Buttons.Parent = TabName
    Buttons.Active = true
    Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Buttons.BackgroundTransparency = 1.000
    Buttons.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Buttons.BorderSizePixel = 0
    Buttons.Size = UDim2.new(1, 0, 1, 0)
    Buttons.ScrollBarThickness = 4
    
    UIListLayout.Parent = Buttons
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    Settings.Name = "Settings"
    Settings.Parent = TabName
    Settings.Active = true
    Settings.BackgroundColor3 = Color3.fromRGB(36, 49, 54)
    Settings.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Settings.BorderSizePixel = 0
    Settings.Position = UDim2.new(1, 0, 0, 0)
    Settings.Size = UDim2.new(0.558897257, 0, 1, 0)
    Settings.ScrollBarThickness = 4
    Settings.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Settings.ScrollingDirection = Enum.ScrollingDirection.Y
    
    UIListLayout_2.Parent = Settings
    UIListLayout_2.FillDirection = Enum.FillDirection.Vertical
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Top
    
    local TabButton = Instance.new("TextButton")

    TabButton.Name = "TabButton"
    TabButton.Parent = PylonInstance.Main.Dropdown.Tabs
    TabButton.BackgroundColor3 = Color3.fromRGB(20, 27, 30)
    TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabButton.BorderSizePixel = 0
    TabButton.Position = UDim2.new(0.305642635, 0, 0.238806695, 0)
    TabButton.Size = UDim2.new(0.194000006, 0, 0.050999999, 0)
    TabButton.Font = Enum.Font.RobotoMono
    TabButton.Text = Title
    TabButton.TextColor3 = Color3.fromRGB(173, 226, 255)
    TabButton.TextScaled = true
    TabButton.TextSize = 14.000
    TabButton.TextWrapped = true

    
    TabButton.MouseButton1Click:Connect(function()
        for _, Item in pairs(PylonInstance.Main.Dropdown:GetChildren()) do
            if Item.Name == "Tabs" or Item.Name == "Border" then
            else
                Item.Visible = false
            end
        end

        for _, Item in pairs(PylonInstance.Main.Dropdown.Tabs:GetChildren()) do
            if Item:IsA("TextButton") then
                Item.BackgroundColor3 = Color3.fromRGB(20, 27, 30)
            end
        end

        TabName.Visible = true
        TabButton.BackgroundColor3 = Color3.fromRGB(46, 61, 68)
    end)

    return TabName
end

function UIlib:CreateButton(TabInstance,Title,ButtonSettings,Callback)
    local Button = Instance.new("TextButton")
    local UIPadding = Instance.new("UIPadding")
    local SettingsButton = Instance.new("TextButton")
    local UIPadding_2 = Instance.new("UIPadding")

    Button.Name = Title
    Button.Parent = TabInstance.Buttons
    Button.BackgroundColor3 = Color3.fromRGB(20, 27, 30)
    Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Button.BorderSizePixel = 0
    Button.Size = UDim2.new(1, 0, 0.0469024193, 0)
    Button.Font = Enum.Font.RobotoMono
    Button.Text = Title
    Button.TextColor3 = Color3.fromRGB(173, 226, 255)
    Button.TextScaled = true
    Button.TextSize = 14.000
    Button.TextWrapped = true
    Button.TextXAlignment = Enum.TextXAlignment.Left

    UIPadding.Parent = Button
    UIPadding.PaddingLeft = UDim.new(0, 3)

    SettingsButton.Name = "SettingsButton"
    SettingsButton.Parent = Button
    SettingsButton.BackgroundColor3 = Color3.fromRGB(25, 34, 38)
    SettingsButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SettingsButton.BorderSizePixel = 0
    SettingsButton.Position = UDim2.new(0.76262629, 0, -0.0314491875, 0)
    SettingsButton.Size = UDim2.new(0.237373739, 0, 1.0314486, 0)
    SettingsButton.Font = Enum.Font.RobotoMono
    SettingsButton.Text = "Settings"
    SettingsButton.TextColor3 = Color3.fromRGB(173, 226, 255)
    SettingsButton.TextScaled = true
    SettingsButton.TextSize = 14.000
    SettingsButton.TextWrapped = true
    SettingsButton.TextXAlignment = Enum.TextXAlignment.Left

    UIPadding_2.Parent = SettingsButton
    UIPadding_2.PaddingLeft = UDim.new(0, 3)

    for _, Item in pairs(ButtonSettings) do
        if Item["Type"] == "Label" then
            local LabelTabname = Instance.new("TextLabel")

            LabelTabname.Name = Button.Name
            LabelTabname.Parent = TabInstance.Settings
            LabelTabname.BackgroundColor3 = Color3.fromRGB(28, 38, 42)
            LabelTabname.BorderColor3 = Color3.fromRGB(0, 0, 0)
            LabelTabname.BorderSizePixel = 0
            LabelTabname.Position = UDim2.new(0, 0, 4.39155805e-08, 0)
            LabelTabname.Size = UDim2.new(0, 223, 0, 26)
            LabelTabname.Font = Enum.Font.Unknown
            LabelTabname.TextColor3 = Color3.fromRGB(171, 227, 255)
            LabelTabname.TextScaled = true
            LabelTabname.TextSize = 14.000
            LabelTabname.Visible = false
            LabelTabname.Text = Item["Text"]
            LabelTabname.TextWrapped = true
            Item["Object"] = LabelTabname
        elseif Item["Type"] == "TextBox" then
            local TextBoxTabname = Instance.new("TextBox")
            TextBoxTabname.Name = Button.Name
            TextBoxTabname.Parent = TabInstance.Settings
            TextBoxTabname.BackgroundColor3 = Color3.fromRGB(25, 34, 38)
            TextBoxTabname.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextBoxTabname.BorderSizePixel = 0
            TextBoxTabname.Position = UDim2.new(0, 0, 0.0748293847, 0)
            TextBoxTabname.Size = UDim2.new(0, 223, 0, 22)
            TextBoxTabname.Font = Enum.Font.Unknown
            TextBoxTabname.PlaceholderText = Item["Placeholder"]
            TextBoxTabname.TextColor3 = Color3.fromRGB(171, 227, 255)
            TextBoxTabname.TextScaled = true
            TextBoxTabname.TextSize = 14.000
            TextBoxTabname.Visible = false
            TextBoxTabname.TextWrapped = true
            Item["Object"] = TextBoxTabname

            TextBoxTabname:GetPropertyChangedSignal("Text"):Connect(function()
                Item["Value"] =TextBoxTabname.Text
            end)
        elseif Item["Type"] == "Button" then
            local ButtonTabname = Instance.new("TextButton")
            local UIPadding = Instance.new("UIPadding")
            
            ButtonTabname.Name = Button.Name
            ButtonTabname.Parent = TabInstance.Settings
            ButtonTabname.BackgroundColor3 = Color3.fromRGB(25, 34, 38)
            ButtonTabname.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ButtonTabname.BorderSizePixel = 0
            ButtonTabname.Position = UDim2.new(0, 0, 0.0748293847, 0)
            ButtonTabname.Size = UDim2.new(1.00000024, 0, 0.090325743, 0)
            ButtonTabname.Font = Enum.Font.Unknown
            ButtonTabname.TextColor3 = Color3.fromRGB(173, 226, 255)
            ButtonTabname.TextScaled = true
            ButtonTabname.TextSize = 14.000
            ButtonTabname.Text = Item["Text"]
            ButtonTabname.Visible = false
            ButtonTabname.TextWrapped = true
            
            UIPadding.Parent = ButtonTabname
            UIPadding.PaddingLeft = UDim.new(0, 3)

            Item["Object"] = ButtonTabname

            ButtonTabname.MouseButton1Click:Connect(function()
                Item["Callback"](ButtonTabname)
            end)
        elseif Item["Type"] == "ToggleButton" then
            local ButtonTabname = Instance.new("TextButton")
            local UIPadding = Instance.new("UIPadding")
            
            ButtonTabname.Name = Button.Name
            ButtonTabname.Parent = TabInstance.Settings
            ButtonTabname.BackgroundColor3 = Color3.fromRGB(25, 34, 38)
            ButtonTabname.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ButtonTabname.BorderSizePixel = 0
            ButtonTabname.Position = UDim2.new(0, 0, 0.0748293847, 0)
            ButtonTabname.Size = UDim2.new(1.00000024, 0, 0.090325743, 0)
            ButtonTabname.Font = Enum.Font.Unknown
            ButtonTabname.TextColor3 = Color3.fromRGB(173, 226, 255)
            ButtonTabname.TextScaled = true
            ButtonTabname.TextSize = 14.000
            ButtonTabname.Text = Item["Text"]
            ButtonTabname.Visible = false
            ButtonTabname.TextWrapped = true
            
            UIPadding.Parent = ButtonTabname
            UIPadding.PaddingLeft = UDim.new(0, 3)

            Item["Object"] = ButtonTabname

            ButtonTabname.MouseButton1Click:Connect(function()
                if ButtonTabname.BackgroundColor3 == Color3.fromRGB(25, 34, 38) then
                    ButtonTabname.BackgroundColor3 = Color3.fromRGB(46, 61, 68)
                    Item["Callback"](true)
                else
                    ButtonTabname.BackgroundColor3 = Color3.fromRGB(25, 34, 38)
                    Item["Callback"](false)
                end
            end)
        end
    end

    Button.MouseButton1Down:Connect(function()
        if Button.BackgroundColor3 == Color3.fromRGB(20, 27, 30) then
            Button.BackgroundColor3 = Color3.fromRGB(46, 61, 68)
            Callback(true)
        else
            Button.BackgroundColor3 = Color3.fromRGB(20, 27, 30)
            Callback(false)
        end
    end)

    SettingsButton.MouseButton1Down:Connect(function()
        for _, Item in pairs(TabInstance.Settings:GetChildren()) do
            if Item:IsA("UIListLayout") == false and Item.Name == Button.Name then
                Item.Visible = true
            elseif Item:IsA("UIListLayout") == false then
                Item.Visible = false
            end
        end
    end)
end

return UIlib
