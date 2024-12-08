local Notifications = {}
Notifications.instance = nil

function Notifications:Init()
    local PylonNotifications = Instance.new("ScreenGui")
    local List = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")

    PylonNotifications.Name = "Pylon-Notifications"
    PylonNotifications.Parent = game:WaitForChild("CoreGui")
    PylonNotifications.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    List.Name = "List"
    List.Parent = PylonNotifications
    List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    List.BackgroundTransparency = 1.000
    List.BorderColor3 = Color3.fromRGB(0, 0, 0)
    List.BorderSizePixel = 0
    List.Position = UDim2.new(0.864681304, 0, 0, 0)
    List.Size = UDim2.new(0.135318711, 0, 1, 0)
    
    UIListLayout.Parent = List
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    UIListLayout.FillDirection = Enum.FillDirection.Vertical
    UIListLayout.Padding = UDim.new(0, 5)

    Notifications.instance = PylonNotifications
end

function Notifications:Notify(title, message)
    local Notification = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local UIPadding = Instance.new("UIPadding")
    local Information = Instance.new("TextLabel")
    local UIPadding_2 = Instance.new("UIPadding")
    local Bar = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    
    Notification.Name = "Notification"
    Notification.Parent = Notifications.instance.List
    Notification.BackgroundColor3 = Color3.fromRGB(20, 26, 29)
    Notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Notification.BorderSizePixel = 0
    Notification.Size = UDim2.new(1, 0, 0.12935324, 0)
    
    Title.Name = "Title"
    Title.Parent = Notification
    Title.BackgroundColor3 = Color3.fromRGB(20, 26, 29)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(-0.00323651289, 0, 0, 0)
    Title.Size = UDim2.new(1.00323701, 0, 0.315616012, 0)
    Title.Font = Enum.Font.Unknown
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(171, 227, 255)
    Title.TextScaled = true
    Title.TextSize = 14.000
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    UIPadding.Parent = Title
    UIPadding.PaddingLeft = UDim.new(0, 4)
    
    Information.Name = "Information"
    Information.Parent = Notification
    Information.BackgroundColor3 = Color3.fromRGB(20, 26, 29)
    Information.BackgroundTransparency = 1.000
    Information.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Information.BorderSizePixel = 0
    Information.Position = UDim2.new(-0.00323651289, 0, 0.355769217, 0)
    Information.Size = UDim2.new(1.00323701, 0, 0.278845578, 0)
    Information.Font = Enum.Font.Unknown
    Information.Text = message
    Information.TextColor3 = Color3.fromRGB(32, 43, 48)
    Information.TextScaled = true
    Information.TextSize = 14.000
    Information.TextWrapped = true
    Information.TextXAlignment = Enum.TextXAlignment.Left
    
    UIPadding_2.Parent = Information
    UIPadding_2.PaddingLeft = UDim.new(0, 4)
    
    Bar.Name = "Bar"
    Bar.Parent = Notification
    Bar.BackgroundColor3 = Color3.fromRGB(176, 229, 255)
    Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Bar.BorderSizePixel = 0
    Bar.Position = UDim2.new(0.0115830116, 0, 0.836538434, 0)
    Bar.Size = UDim2.new(0.972972989, 0, 0.0865384638, 0)
    
    UICorner.Parent = Bar

    --tween bar

    local Tween = game:GetService("TweenService"):Create(Bar, TweenInfo.new(1, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 0.0865384638, 0)})
    Tween:Play()
    task.wait(1)
    Notification:Destroy()
end

return Notifications
