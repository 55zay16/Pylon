local UIlib = {}

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
    Main.Size = UDim2.new(0, 622, 0, 32)
    Main.Font = Enum.Font.Unknown
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
    Minimize.Position = UDim2.new(0.918498933, 0, 0.530939102, 0)
    Minimize.Size = UDim2.new(0.0537997484, 0, 1, 0)
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
    Close.Position = UDim2.new(0.973113, 0, 0.5, 0)
    Close.Size = UDim2.new(0.0537731685, 0, 1, 0)
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
    Dropdown.Size = UDim2.new(0, 622, 0, 384)
    
    Tabs.Name = "Tabs"
    Tabs.Parent = Dropdown
    Tabs.Active = true
    Tabs.BackgroundColor3 = Color3.fromRGB(30, 39, 44)
    Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tabs.BorderSizePixel = 0
    Tabs.Size = UDim2.new(0, 622, 0, 40)
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
    Border.Size = UDim2.new(0, 622, 0, 1)
    Border.ZIndex = 3

    return Pylon
end

return UIlib