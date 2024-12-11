local Core = loadstring(game:HttpGet("https://raw.githubusercontent.com/55zay16/Pylon/refs/heads/main/modules/Core.lua"))()

local Pylon = Core.UIlib:InitWindow("Pylon")

local Combat = Core.UIlib:CreateTab(Pylon, "Combat")
local Movement = Core.UIlib:CreateTab(Pylon, "Movement")
local Visuals = Core.UIlib:CreateTab(Pylon, "Visuals")
local Utility = Core.UIlib:CreateTab(Pylon, "Utility")

local lplr = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")

local CANCOINESP = false
local COINESP = Core.UIlib:CreateButton(Visuals, "Coin ESP",{},function(NewStatus)
    CANCOINESP = NewStatus

    if CANCOINESP == true then
        for i,v in pairs(workspace:GetChildren()) do
            if v.Name:match("Coin") then
                if v:FindFirstChild("HIGH") then
                    continue 
                end

                local Highlight = Instance.new("Highlight")
                Highlight.Name = "HIGH"
                Highlight.FillColor = Color3.fromRGB(120, 255, 138)
                Highlight.OutlineColor = Color3.fromRGB(120, 255, 138)
                Highlight.FillTransparency = 0.3
                Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                Highlight.Enabled = true
                Highlight.Parent = v
            end
        end
    else 
        for i,v in pairs(workspace:GetChildren()) do
            if v.Name:match("Coin") then
                if v:FindFirstChild("HIGH") then
                    v.HIGH:Destroy()
                end
            end
        end
    end
end)

workspace.ChildAdded:Connect(function(v)
    if v.Name:match("Coin") then
        if CANCOINESP == true then
            local Highlight = Instance.new("Highlight")
            Highlight.Name = "HIGH"
            Highlight.FillColor = Color3.fromRGB(120, 255, 138)
            Highlight.OutlineColor = Color3.fromRGB(120, 255, 138)
            Highlight.FillTransparency = 0.3
            Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            Highlight.Enabled = true
            Highlight.Parent = v
        end
    end
end)

local CANEGGESP = false
local EGGESP = Core.UIlib:CreateButton(Visuals, "Egg ESP",{},function(NewStatus)
    CANEGGESP = NewStatus
end)

local CANEGGTP = false
local EggTPSettings = {
    ["Range Label"] = {
        ["Object"] = nil,
        ["Type"] = "Label",
        ["Text"] = "Range",
    },
    ["Range"] = {
        ["Object"] = nil,
        ["Type"] = "TextBox",
        ["Placeholder"] = "Egg Range (20)",
        ["Value"] = 20,
    },
}

local EggTP = Core.UIlib:CreateButton(Utility, "Egg TP",EggTPSettings,function(NewStatus)
    CANEGGTP = NewStatus
end)

local AntiVoidPart = nil
local ANTIVOID = Core.UIlib:CreateButton(Utility, "Anti Void",{},function(NewStatus)
    if AntiVoidPart == nil then
        AntiVoidPart = Instance.new("Part")
    end

    if NewStatus == true then
        AntiVoidPart.Parent = game.Workspace
        AntiVoidPart.Size = Vector3.new(1000, 1, 1000)
        AntiVoidPart.Position = Vector3.new(lplr.Character.HumanoidRootPart.Position.X, lplr.Character.HumanoidRootPart.Position.Y - 20, lplr.Character.HumanoidRootPart.Position.Z)
        AntiVoidPart.CanCollide = false
        AntiVoidPart.Transparency = 0.8
        AntiVoidPart.Anchored = true
        AntiVoidPart.Color = Color3.fromRGB(255, 123, 123)
        AntiVoidPart.Material = Enum.Material.Neon

        AntiVoidPart.Touched:Connect(function(Part)
            if Part.Parent == lplr.Character then
                lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.Position + Vector3.new(0, 30, 0)
                lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                task.wait(0.5)
                lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
        AntiVoidPart:Destroy()
        AntiVoidPart = nil
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


game.Players.PlayerAdded:connect(function(Player) 
    if Player ~= lplr then
        Player.CharacterAdded:Connect(function(Character)
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
                Tracer.Parent = Character.Head
            end

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
        end)
    end
end)

for _,v in pairs(game:GetService("Players"):GetPlayers()) do
    if v ~= lplr then
        v.CharacterAdded:Connect(function(Character)
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
                Tracer.Attachment1 = v.Character.HumanoidRootPart.RootAttachment
                Tracer.TextureMode = Enum.TextureMode.Wrap
                Tracer.Texture = "rbxassetid://10205834867"
                Tracer.Parent = Character.Head
            end

            if CANNAMETAGS == true then
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
        end)
    end
end

local FlightSettings = {
    ["Speed Label"] = {
        ["Object"] = nil,
        ["Type"] = "Label",
        ["Text"] = "Flight Speed",
    },
    ["Speed"] = {
        ["Object"] = nil,
        ["Type"] = "TextBox",
        ["Placeholder"] = "speed 0.2 (any higher might anticheat)",
        ["Value"] = 0.2,
    },
}

local CanFly = false
local Y = 0
local Flight = Core.UIlib:CreateButton(Movement, "Flight",FlightSettings,function(NewStatus)
    CanFly = NewStatus
    Y = lplr.Character.HumanoidRootPart.Position.Y
end)

local SpeedSettings = {
    ["Speed Label"] = {
        ["Object"] = nil,
        ["Type"] = "Label",
        ["Text"] = "Speed",
    },
    ["Speed"] = {
        ["Object"] = nil,
        ["Type"] = "TextBox",
        ["Placeholder"] = "speed 0.2 (any higher might anticheat)",
        ["Value"] = 0.2,
    },
}

local CanSpeed = false
local Speed = Core.UIlib:CreateButton(Movement, "Speed",SpeedSettings,function(NewStatus)
    CanSpeed = NewStatus
end)

local CanInfiniteJump = false
local InfiniteJump = Core.UIlib:CreateButton(Movement, "Infinite Jump",{},function(NewStatus)
    CanInfiniteJump = NewStatus
end)
game:GetService("UserInputService").JumpRequest:connect(function()
    if CanInfiniteJump == true then
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

local TpAuraSettings = {
    ["Range Label"] = {
        ["Object"] = nil,
        ["Type"] = "Label",
        ["Text"] = "Tp Range",
    },
    ["Range"] = {
        ["Object"] = nil,
        ["Type"] = "TextBox",
        ["Placeholder"] = "Attack Range (20)",
        ["Value"] = 20,
    },
    ["Visualize Target"] = {
        ["Object"] = nil,
        ["Type"] = "ToggleButton",
        ["Text"] = "Visualize Target",
        ["Callback"] = nil,
        ["Value"] = false
    },
    ["Anti Death"] = {
        ["Object"] = nil,
        ["Type"] = "ToggleButton",
        ["Text"] = "Anti Death",
        ["Callback"] = nil,
        ["Value"] = false
    },
    ["Anti Death Health Threshold Label"] = {
        ["Object"] = nil,
        ["Type"] = "Label",
        ["Text"] = "Anti Death Health Threshold",
    },
    ["Anti Death Health Threshold"] = {
        ["Object"] = nil,
        ["Type"] = "TextBox",
        ["Placeholder"] = "Health Threshold (50)",
        ["Value"] = 50,
    },
}

TpAuraSettings["Visualize Target"]["Callback"] = function(NewStatus)
    TpAuraSettings["Visualize Target"]["Value"] = NewStatus
end

TpAuraSettings["Anti Death"]["Callback"] = function(NewStatus)
    TpAuraSettings["Anti Death"]["Value"] = NewStatus
end

local TpAuraStatus = false
local TpAura = Core.UIlib:CreateButton(Combat, "Tp Aura",TpAuraSettings,function(NewStatus)
    TpAuraStatus = NewStatus
end)

local ClickAuraSettings = {
    ["Range Label"] = {
        ["Object"] = nil,
        ["Type"] = "Label",
        ["Text"] = "Click Range",
    },
    ["Range"] = {
        ["Object"] = nil,
        ["Type"] = "TextBox",
        ["Placeholder"] = "Attack Range (20)",
        ["Value"] = 20,
    },
    ["Visualize Target"] = {
        ["Object"] = nil,
        ["Type"] = "ToggleButton",
        ["Text"] = "Visualize Target",
        ["Callback"] = nil,
        ["Value"] = false
    },
}

ClickAuraSettings["Visualize Target"]["Callback"] = function(NewStatus)
    ClickAuraSettings["Visualize Target"]["Value"] = NewStatus
end

local ClickAuraStatus = false
local ClickAura = Core.UIlib:CreateButton(Combat, "Click Aura",ClickAuraSettings,function(NewStatus)
    ClickAuraStatus = NewStatus
end)

local function GetNearestEgg(Range)
    local Distance = math.huge
    local Egg = nil

    for _,v in pairs(workspace.Eggs:GetChildren()) do
        local Magnitude = (v.RootPart.Position - lplr.Character.PrimaryPart.Position).magnitude

        if Magnitude < Distance and Magnitude <= Range then
            Distance = Magnitude
            Egg = v
        end
    end

    return Egg
end

local function GetNearestPlayer(Range)
    local Distance = math.huge
    local Player = nil

    for _,v in pairs(game:GetService("Players"):GetPlayers()) do
        if v ~= lplr then
            local Magnitude = (v.Character.PrimaryPart.Position - lplr.Character.PrimaryPart.Position).magnitude
        
            if Magnitude < Distance and Magnitude <= Range then
                Distance = Magnitude
                Player = v
            end
            
        end
    end

    return Player
end

coroutine.wrap(function()
    local TargetHighlight = Instance.new("Highlight")
    TargetHighlight.FillColor = Color3.fromRGB(255, 93, 93)
    TargetHighlight.OutlineColor = Color3.fromRGB(119, 47, 47)
    TargetHighlight.FillTransparency = 0.3
    TargetHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

    while task.wait() do
        local s,e = pcall(function()
            if ClickAuraStatus == true then
                local TargetPlayer = GetNearestPlayer(tonumber(ClickAuraSettings["Range"]["Value"]))

                if TargetPlayer then
                    if ClickAuraSettings["Visualize Target"]["Value"] == true then
                        TargetHighlight.Adornee = TargetPlayer.Character
                        TargetHighlight.Parent = game.Workspace
                    else
                        TargetHighlight.Adornee = nil
                        TargetHighlight.Parent = nil
                    end

                else
                    TargetHighlight.Adornee = nil
                    TargetHighlight.Parent = nil
                end
            end
            if TpAuraStatus == true then
                local TargetPlayer = GetNearestPlayer(tonumber(TpAuraSettings["Range"]["Value"]))

                if TargetPlayer then
                    if TpAuraSettings["Visualize Target"]["Value"] == true then
                        TargetHighlight.Adornee = TargetPlayer.Character
                        TargetHighlight.Parent = game.Workspace
                    else
                        TargetHighlight.Adornee = nil
                        TargetHighlight.Parent = nil
                    end
                    
                    if TpAuraSettings["Anti Death"]["Value"] == true then
                        if lplr.Character.Humanoid.Health <= tonumber(TpAuraSettings["Anti Death Health Threshold"]["Value"]) then
                            lplr.Character.HumanoidRootPart.CFrame = TargetPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,20,0)
                            lplr.Character.Humnaoid.Jump = true
                        else
                            lplr.Character.HumanoidRootPart.CFrame = TargetPlayer.Character.HumanoidRootPart.CFrame  - TargetPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2
                        end
                    else
                        lplr.Character.HumanoidRootPart.CFrame = TargetPlayer.Character.HumanoidRootPart.CFrame - TargetPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2
                    end
                    
                    
                else
                    TargetHighlight.Adornee = nil
                    TargetHighlight.Parent = nil
                end
            end

            if TpAuraStatus == true or ClickAuraStatus == true then
                mouse1click()
                task.wait(0.3)
            end
        end)

        if s == false then
            print(e)
        end
    end
end)()


coroutine.wrap(function()
    while task.wait() do
        local s,e = pcall(function()
            if CanSpeed == true then
                lplr.Character.HumanoidRootPart.CFrame += lplr.Character.Humanoid.MoveDirection * tonumber(SpeedSettings["Speed"]["Value"])
            end
            if CanFly == true then
                lplr.Character.HumanoidRootPart.CFrame += lplr.Character.Humanoid.MoveDirection * tonumber(FlightSettings["Speed"]["Value"]) 
                lplr.Character.HumanoidRootPart.CFrame = CFrame.new(lplr.Character.HumanoidRootPart.CFrame.X,Y,lplr.Character.HumanoidRootPart.CFrame.Z) 
                lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end

            if CANEGGTP == true then
                local TargetEgg = GetNearestEgg(tonumber(EggTPSettings["Range"]["Value"]))

                if TargetEgg then
                    lplr.Character.HumanoidRootPart.CFrame = TargetEgg.RootPart.CFrame
                end
            end
        end)

        if s == false then
            print(e)
        end
    end
end)()


coroutine.wrap(function()
    while task.wait() do
        local s,e = pcall(function()
            if CANEGGESP == true then
                for i,v in pairs(game.Workspace.Eggs:GetChildren()) do
                    if v:FindFirstChild("HIGH") then
                        continue 
                    end

                    local Highlight = Instance.new("Highlight")
                    Highlight.Name = "HIGH"
                    Highlight.FillColor = Color3.fromRGB(255, 54, 54)
                    Highlight.OutlineColor = Color3.fromRGB(255, 71, 71)
                    Highlight.FillTransparency = 0.3
                    Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    Highlight.Enabled = true
                    Highlight.Parent = v.RootPart
                end
            else 
                for i,v in pairs(game.Workspace.Eggs:GetChildren()) do
                    if v:FindFirstChild("Highlight") then
                        v.Highlight:Destroy()
                    end
                end
            end
        end)

        if s == false then
            print(e)
        end
    end
end)()

