local UIlib = {}

-- Creates a empty pylon window 
function UIlib:CreateWindow(Title)
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
    Main.BackgroundColor3 = Color3.fromRGB(47, 62, 70)
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.305642635, 0, 0.198492467, 0)
    Main.Size = UDim2.new(0.324973881, 0, 0.0402010046, 0)
    Main.Font = Enum.Font.RobotoMono
    Main.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold)
    Main.Text = Title
    Main.TextColor3 = Color3.fromRGB(255, 255, 255)
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
    Tabs.BackgroundColor3 = Color3.fromRGB(30, 39, 44)
    Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tabs.BorderSizePixel = 0
    Tabs.Size = UDim2.new(0.999818683, 0, 0.104166664, 0)
    Tabs.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
    Tabs.ScrollBarThickness = 4
    Tabs.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
    
    UIListLayout.Parent = Tabs
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    Border.Name = "Border"
    Border.Parent = Dropdown
    Border.BackgroundColor3 = Color3.fromRGB(23, 29, 33)
    Border.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Border.BorderSizePixel = 0
    Border.Position = UDim2.new(0, 0, 0.104166664, 0)
    Border.Size = UDim2.new(0.999818683, 0, 0.00260416674, 0)
    Border.ZIndex = 3

    local script = Instance.new('Script', Main)
    coroutine.wrap(function() -- Drag
        
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
    end)()

    coroutine.wrap(function() -- Close/Minimize
        Main.Close.MouseButton1Click:Connect(function()
            Pylon:Destroy()
        end)

        Main.Minimize.MouseButton1Click:Connect(function()
            if Main.Minimize.Rotation == 0 then
                game:GetService("TweenService"):Create(Main.Minimize, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 180}):Play()
                game:GetService("TweenService"):Create(Dropdown, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(1.00665498, 0, 0, 0)}):Play()
            else
                game:GetService("TweenService"):Create(Main.Minimize, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 0}):Play()
                game:GetService("TweenService"):Create(Dropdown, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(1.00665498, 0, 12, 0)}):Play()
            end
        end)
    end)()

    return Pylon
end


return UIlib
