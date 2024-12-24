local Core = loadstring(game:HttpGet("https://raw.githubusercontent.com/55zay16/Pylon/refs/heads/main/modules/Core.lua"))()

local Pylon = Core.UIlib:InitWindow("Pylon")

local Combat = Core.UIlib:CreateTab(Pylon, "Combat")
local Movement = Core.UIlib:CreateTab(Pylon, "Movement")
local Visuals = Core.UIlib:CreateTab(Pylon, "Visuals")
local Utility = Core.UIlib:CreateTab(Pylon, "Utility")

local lplr = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")

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

game.Players.PlayerAdded:Connect(function(Player) 
    if CANNAMETAGS == true then
        pcall(function()
            local Nametag = Instance.new("BillboardGui")
            Nametag.Name = "Nametag"
            Nametag.Size = UDim2.new(0, 100, 0, 40)
            Nametag.AlwaysOnTop = true
            Nametag.StudsOffset = Vector3.new(0, 2, 0)
            Nametag.Parent = Player.Character.Head

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

    if CANTRACERS == true then
        pcall(function()
            local Tracer = Instance.new("Beam")
            Tracer.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
            Tracer.Width0 = 0.1
            Tracer.Width1 = 0.1
            Tracer.Attachment0 = lplr.Character.HumanoidRootPart.RootAttachment
            Tracer.Attachment1 = Player.Character.HumanoidRootPart.RootAttachment
            Tracer.Parent = Player.Character.Head
        end) 
    end 

    if CANESP == true then
        local Highlight = Instance.new("Highlight")
        Highlight.FillColor = Color3.fromRGB(255,255,255)
        Highlight.OutlineColor = Color3.fromRGB(255,255,255)
        Highlight.FillTransparency = 0.3
        Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        Highlight.Enabled = true
        Highlight.Parent = Player.Character
    end 

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
        ["Placeholder"] = "speed 0.5",
        ["Value"] = 0.5,
    },
}
local CANSPEED = false
local Speed = Core.UIlib:CreateButton(Movement, "Speed",SPEEDSettings,function(NewStatus)
    CANSPEED = NewStatus
end)

local CANINFINTEJUMP = false
local InfiniteJump = Core.UIlib:CreateButton(Movement, "Infinite Jump",{},function(NewStatus)
    CANINFINTEJUMP = NewStatus
end)

local CanFly = false
local Y = 0
local Flight = Core.UIlib:CreateButton(Movement, "Flight",{},function(NewStatus)
    CanFly = NewStatus
    Y = lplr.Character.HumanoidRootPart.Position.Y
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
        ["Placeholder"] = "Attack Range (20)",
        ["Value"] = 20,
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

local VoidPart = Instance.new("Part")
VoidPart.Name = "Void"
VoidPart.Parent = workspace
VoidPart.Transparency = 1   
VoidPart.CanCollide = false
VoidPart.Size = Vector3.new(1000, 1, 1000)
VoidPart.Color = Color3.fromRGB(255, 123, 123)
VoidPart.Material = Enum.Material.Neon
VoidPart.Anchored = true

local ANTIVOID = Core.UIlib:CreateButton(Utility, "Anti Void",{},function(NewStatus)
    if NewStatus == true then
        VoidPart.CanCollide = true
        VoidPart.Transparency = 0.5
        VoidPart.Position = Vector3.new(lplr.Character.HumanoidRootPart.Position.X, lplr.Character.HumanoidRootPart.Position.Y - 5, lplr.Character.HumanoidRootPart.Position.Z)
    else
        VoidPart.CanCollide = false 
        VoidPart.Transparency = 1
    end
end)

local function GetNearestPlayer(range)
    local closestPlayer = nil
    local closestDistance = range

    for i, v in pairs(game:GetService("Players"):GetPlayers()) do
        if v ~= lplr then
            pcall(function()
                if v.Team.Name ~= "Lobby" then
                    local distance = (v.Character.PrimaryPart.Position - lplr.Character.PrimaryPart.Position).magnitude

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = v
                    end
                end
            end)
        end
    end

    return closestPlayer
end

UserInputService.JumpRequest:Connect(function()
    if CANINFINTEJUMP == true then
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

UserInputService.InputBegan:Connect(function(input) 
    if input.KeyCode == Enum.KeyCode.E then
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        Y += 5
    elseif input.KeyCode == Enum.KeyCode.Q then
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        Y -= 5
    end     
end)

coroutine.wrap(function()
    while task.wait(0) do
        local s,e = pcall(function()
            if CANTPAURA == true then
                local TargetPlayer = GetNearestPlayer(tonumber(TPAURASettings["Range"]["Value"]))

                if TargetPlayer then
                    if TPAURASettings["Anti Death"]["Value"] == true then
                        if lplr.Character.Humanoid.Health <= tonumber(TPAURASettings["Anti Death Health Threshold"]["Value"]) then
                            lplr.Character.HumanoidRootPart.CFrame = TargetPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,20,0)
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
            if CanFly == true then
                lplr.Character.HumanoidRootPart.CFrame = CFrame.new(lplr.Character.HumanoidRootPart.CFrame.X,Y,lplr.Character.HumanoidRootPart.CFrame.Z) 
                lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end

            if CANSPEED == true then
                lplr.Character.HumanoidRootPart.CFrame += lplr.Character.Humanoid.MoveDirection * tonumber(SPEEDSettings["Speed"]["Value"])
            end
        end)

        if s == false then
            print(e)
        end
    end
end)()

