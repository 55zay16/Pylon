local Core = loadstring(game:HttpGet("https://raw.githubusercontent.com/55zay16/Pylon/refs/heads/main/modules/Core.lua"))()

local Pylon = Core.UIlib:InitWindow("Pylon")

local Combat = Core.UIlib:CreateTab(Pylon, "Combat")
local Movement = Core.UIlib:CreateTab(Pylon, "Movement")
local Visuals = Core.UIlib:CreateTab(Pylon, "Visuals")
local Utility = Core.UIlib:CreateTab(Pylon, "Utility")

local lplr = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")

local AIMBOTSettings = { 
    ["Range"] = {
        ["Object"] = nil,
        ["Type"] = "TextBox",
        ["Placeholder"] = "range 100",
        ["Value"] = 100,
    },
}

local CANAIMBOT = false
local Aimbot = Core.UIlib:CreateButton(Combat, "Aimbot",AIMBOTSettings,function(NewStatus)
    CANAIMBOT = NewStatus
end)

local CANESP = false
local ESP = Core.UIlib:CreateButton(Visuals, "ESP",{},function(NewStatus)
    CANESP = NewStatus

    if CANESP == true then
        for _,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v ~= lplr then
                pcall(function()
                    local Highlight = Instance.new("Highlight")
                    Highlight.FillColor = Color3.fromRGB(255,255,255)
                    Highlight.OutlineColor = Color3.fromRGB(255,255,255)
                    Highlight.FillTransparency = 0.3
                    Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    Highlight.Enabled = true
                    Highlight.Parent = v.Character
                end)
            end
        end
    else
        for _,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Character:FindFirstChild("Highlight") then
                pcall(function()
                    v.Character.Highlight:Destroy()
                end)
            end
        end
    end
end)

local CANTRACERS = false
local Tracers = Core.UIlib:CreateButton(Visuals, "Tracers",{},function(NewStatus)
    CANTRACERS = NewStatus

    if CANTRACERS == true then
        for _,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v ~= lplr then
                pcall(function()
                    local Tracer = Instance.new("Beam")
                    Tracer.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
                    Tracer.Width0 = 0.1
                    Tracer.Width1 = 0.1
                    Tracer.Attachment0 = lplr.Character.HumanoidRootPart.RootAttachment
                    Tracer.Attachment1 = v.Character.HumanoidRootPart.RootAttachment
                    Tracer.Parent = v.Character.Head
                end) 
            end
        end
    else
        for _,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Character.Head:FindFirstChild("Beam") then
                pcall(function()
                    v.Character.Head.Beam:Destroy()
                end)
            end
        end
    end
end)

local CANNAMETAGS = false
local Nametags = Core.UIlib:CreateButton(Visuals, "Nametags",{},function(NewStatus)
    CANNAMETAGS = NewStatus

    if CANNAMETAGS == true then
        for _,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v ~= lplr then
                pcall(function()
                    local Nametag = Instance.new("BillboardGui")
                    Nametag.Name = "Nametag"
                    Nametag.Size = UDim2.new(0, 100, 0, 40)
                    Nametag.AlwaysOnTop = true
                    Nametag.StudsOffset = Vector3.new(0, 2, 0)
                    Nametag.Parent = v.Character.Head

                    local TextLabel = Instance.new("TextLabel")
                    TextLabel.BackgroundTransparency = 1
                    TextLabel.Size = UDim2.new(1, 0, 1, 0)
                    TextLabel.Text = v.Name
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 14.000
                    TextLabel.Parent = Nametag
                    TextLabel.Font = Enum.Font.RobotoMono
                end)
            end
        end
    else
        for _,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Character.Head:FindFirstChild("Nametag") then
                pcall(function()
                    v.Character.Head.Nametag:Destroy()
                end)
            end
        end
    end
end)

game:GetService("Players").PlayerAdded:Connect(function(Player) 
    Player.CharacterAdded:Connect(function(Character)
        task.wait(0.3)
        if CANESP == true then
            local Highlight = Instance.new("Highlight")
            Highlight.FillColor = Color3.fromRGB(255,255,255)
            Highlight.OutlineColor = Color3.fromRGB(255,255,255)
            Highlight.FillTransparency = 0.3
            Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            Highlight.Enabled = true
            Highlight.Parent = Character
        end

        if CANTRACERS == true then
            local Tracer = Instance.new("Beam")
            Tracer.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
            Tracer.Width0 = 0.1
            Tracer.Width1 = 0.1
            Tracer.Attachment0 = lplr.Character.HumanoidRootPart.RootAttachment
            Tracer.Attachment1 = Character.HumanoidRootPart.RootAttachment
            Tracer.Parent = Character.Head
        end

        if CANNAMETAGS == true then
            pcall(function()
                local Nametag = Instance.new("BillboardGui")
                Nametag.Name = "Nametag"
                Nametag.Size = UDim2.new(0, 100, 0, 40)
                Nametag.AlwaysOnTop = true
                Nametag.StudsOffset = Vector3.new(0, 2, 0)
                Nametag.Parent = Character.Head

                local TextLabel = Instance.new("TextLabel")
                TextLabel.BackgroundTransparency = 1
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.Text = Player.Name
                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.TextSize = 14.000
                TextLabel.Parent = Nametag
                TextLabel.Font = Enum.Font.RobotoMono
            end)
        end
    end)
end)

local SPEEDSettings = {
    ["Speed Label"] = {
        ["Object"] = nil,
        ["Type"] = "Label",
        ["Text"] = "Speed",
    },
    ["Speed"] = {
        ["Object"] = nil,
        ["Type"] = "TextBox",
        ["Placeholder"] = "speed 0.05 (any higher would anticheat)",
        ["Value"] = 0.05,
    },
}
local CANSPEED = false
local Speed = Core.UIlib:CreateButton(Movement, "Speed",SPEEDSettings,function(NewStatus)
    CANSPEED = NewStatus
end)


local TPAURASettings = {
    ["Range Label"] = {
        ["Object"] = nil,
        ["Type"] = "Label",
        ["Text"] = "Range",
    },
    ["Range"] = {
        ["Object"] = nil,
        ["Type"] = "TextBox",
        ["Placeholder"] = "Attack Range (10 - any higher would likely anticheat)",
        ["Value"] = 10,
    },
    ["Anti Death"] = {
        ["Object"] = nil,
        ["Type"] = "ToggleButton",
        ["Text"] = "Anti Death",
        ["Callback"] = nil,
        ["Value"] = false,
    },
    ["Anti Death Health Threshold"] = {
        ["Object"] = nil,
        ["Type"] = "TextBox",
        ["Placeholder"] = "Health Threshold (60)",
        ["Value"] = 60,
    },
}

TPAURASettings["Anti Death"]["Callback"] = function(NewStatus)
    TPAURASettings["Anti Death"]["Value"] = NewStatus
end

local CANTPAURA = false
local TPAURA = Core.UIlib:CreateButton(Combat, "Tp Aura",TPAURASettings,function(NewStatus)
    CANTPAURA = NewStatus
end)

local function GetNearestPlayer(range)
    local closestPlayer = nil
    local closestDistance = range

    for i, v in pairs(game:GetService("Players"):GetPlayers()) do
        if v ~= lplr then
            pcall(function()
                local distance = (v.Character.PrimaryPart.Position - lplr.Character.PrimaryPart.Position).magnitude

                if distance < closestDistance and distance < range then
                    closestDistance = distance
                    closestPlayer = v
                end
            end)
        end
    end

    return closestPlayer
end


coroutine.wrap(function()
    while task.wait(0) do
        local s,e = pcall(function()
            if CANTPAURA == true then
                local TargetPlayer = GetNearestPlayer(tonumber(TPAURASettings["Range"]["Value"]))

                if TargetPlayer then
                    if TPAURASettings["Anti Death"]["Value"] == true then
                        if lplr.Character.Humanoid.Health <= tonumber(TPAURASettings["Anti Death Health Threshold"]["Value"]) then
                            lplr.Character.HumanoidRootPart.CFrame = TargetPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,5,0)
                            lplr.Character.Humanoid.Jump = true
                        else
                            lplr.Character.HumanoidRootPart.CFrame = TargetPlayer.Character.HumanoidRootPart.CFrame  - TargetPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2
                        end
                    else
                        lplr.Character.HumanoidRootPart.CFrame = TargetPlayer.Character.HumanoidRootPart.CFrame - TargetPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2
                    end
                end
            end
        end)

        if s == false then
            print(e)
        end
    end
end)()

coroutine.wrap(function()
    while task.wait(0) do
        local s,e = pcall(function()

            if CANSPEED == true then
                lplr.Character.HumanoidRootPart.CFrame += lplr.Character.Humanoid.MoveDirection * tonumber(SPEEDSettings["Speed"]["Value"])
            end
        end)

        if s == false then
            print(e)
        end
    end
end)()

coroutine.wrap(function()    
    while task.wait(0) do
        local Success, ErrorMessage = pcall(function()
            if CANAIMBOT == true then
                -- Get the nearest player within range (100 studs)
                local TargetPlayer = GetNearestPlayer(tonumber(AIMBOTSettings["Range"]["Value"]))

                if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("Head") then
                    local CurrentCamera = game:GetService("Workspace").CurrentCamera
                    local Player = game.Players.LocalPlayer
                    local HeadPosition = TargetPlayer.Character.Head.Position
                    local CameraPosition = CurrentCamera.CFrame.Position

                    -- Perform raycast from camera to target's head
                    local fliter = {CurrentCamera, Player.Character}
                    local over = OverlapParams.new()
                    over.FilterDescendantsInstances = fliter
                    over.FilterType = Enum.RaycastFilterType.Exclude
                    local RaycastResult = workspace:Raycast(CameraPosition, (HeadPosition - CameraPosition).unit * (CameraPosition - HeadPosition).Magnitude)
                    
                    -- If the raycast doesn't hit anything (nil result) or hits the target's head, the line of sight is clear
                    if RaycastResult then
                        if RaycastResult.Instance.Parent:IsA("Model") and RaycastResult.Instance.Parent:FindFirstChild("Head") then
                        
                            -- Convert the target's head position to a screen point to check if it's in the player's view
                            local ScreenPoint = CurrentCamera:WorldToScreenPoint(HeadPosition)

                            -- Access screen size through a ScreenGui in PlayerGui
                            local PlayerGui = Player.PlayerGui
                            local ScreenGui = PlayerGui:FindFirstChildOfClass("ScreenGui")
                            if not ScreenGui then
                                return
                            end

                            -- Get screen size
                            local ScreenSize = ScreenGui.AbsoluteSize

                            -- Check if the target is within the view (screen space)
                            local OnScreen = ScreenPoint.Z > 0 and ScreenPoint.X >= 0 and ScreenPoint.X <= ScreenSize.X and ScreenPoint.Y >= 0 and ScreenPoint.Y <= ScreenSize.Y
                            
                            if OnScreen then
                                -- If the target is in the view and there's no obstruction, make the camera look at the target's head
                                CurrentCamera.CFrame = CFrame.new(CameraPosition, HeadPosition)
                            end
                        end
                    end
                end
            end
        end)

        if not Success then
            print("Error: " .. ErrorMessage)
        end
    end
end)()


