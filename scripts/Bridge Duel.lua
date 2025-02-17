local bui = loadstring(game:HttpGet("https://raw.githubusercontent.com/55zay16/Pylon/refs/heads/main/modules/builib"))()

local Pylon = bui:InitWindow()
local lplr = game:GetService("Players").LocalPlayer

CombatTabData = {
    ["TP Aura"] = {
        ["Name"] = "Tp Aura",
        ["Enabled"] = false,
        ["Settings"] = {

            ["Range"] = {
                ["Name"] = "Range (any higher then 10 might anticheat)",
                ["Type"] = "textbox",
                ["Value"] = 10,
            },
        }
    },

    ["Anti Death"] = {
        ["Name"] = "Anti Death",
        ["Enabled"] = false,
        ["Settings"] = {
            ["Anti Death Health Threshold"] = {
                ["Name"] = "Anti Death Health Threshold",
                ["Type"] = "textbox",
                ["Value"] = 45,
            }
        }
    },

    ["Orbit Aura"]  = {
        ["Name"] = "Orbit Aura",
        ["Enabled"] = false,
        ["Angle"] = 0,
        ["Settings"] = {
            ["Range"] = {
                ["Name"] = "Range",
                ["Type"] = "textbox",
                ["Value"] = 20,
            },

            ["Rotation Speed"] = {
                ["Name"] = "Rotation Speed",
                ["Type"] = "textbox",
                ["Value"] = 5,
            }
        }
    },
}

MovementTabData = {
    ["Speed"] = {
        ["Name"] = "Speed",
        ["Enabled"] = false,
        ["Settings"] = {
            ["Speed"] = {
                ["Name"] = "Speed",
                ["Type"] = "textbox",
                ["Value"] = 0.09,
            },
        }
    },

    ["Infinite Jump"] = {
        ["Name"] = "Infinite Jump",
        ["Enabled"] = false,
        ["Settings"] = {}
    },

    ["bhop"] = {
        ["Name"] = "Bhop",
        ["Enabled"] = false,
        ["Settings"] = {}
    },

    ["Spider"] = {
        ["Name"] = "Spider",
        ["Enabled"] = false,
        ["Settings"] = {}
    },

    ["Float"] = {
        ["Name"] = "Float",
        ["Enabled"] = false,
        ["Settings"] = {}
    }
} 

VisualsTabData = {
    ["Nametags"] = {
        ["Name"] = "Nametags",
        ["Enabled"] = false,
        ["Settings"] = {
            ["R"] = {
                ["Name"] = "R",
                ["Type"] = "textbox",
                ["Value"] = 255,
            },
            ["G"] = {
                ["Name"] = "G",
                ["Type"] = "textbox",
                ["Value"] = 255,
            },
            ["B"] = {
                ["Name"] = "B",
                ["Type"] = "textbox",
                ["Value"] = 255,
            }
        }
    },

    ["ESP"] = {
        ["Name"] = "ESP",
        ["Enabled"] = false,
        ["Settings"] = {
            ["R"] = {
                ["Name"] = "R",
                ["Type"] = "textbox",
                ["Value"] = 255,
            },
            ["G"] = {
                ["Name"] = "G",
                ["Type"] = "textbox",
                ["Value"] = 255,
            },
            ["B"] = {
                ["Name"] = "B",
                ["Type"] = "textbox",
                ["Value"] = 255,
            }
        }
    },

}

UtilityTabData = {}

bui:AttachTab(Pylon, "Combat", CombatTabData)
bui:AttachTab(Pylon, "Movement", MovementTabData)
bui:AttachTab(Pylon, "Visuals", VisualsTabData)
bui:AttachTab(Pylon, "Utility", UtilityTabData)

function AttachESP(v)
    if v.Character:FindFirstChild("HIGHLIGHT") then
        return
    end

    local ESP = Instance.new("Highlight")
    ESP.OutlineColor = Color3.fromRGB(VisualsTabData["ESP"]["Settings"]["R"]["Value"],VisualsTabData["ESP"]["Settings"]["G"]["Value"],VisualsTabData["ESP"]["Settings"]["B"]["Value"])
    ESP.FillTransparency = 1
    ESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    ESP.Parent = v.Character
end

function DetachESP(v)
    if v.Character:FindFirstChild("HIGHLIGHT") then
        v.Character.HIGHLIGHT:Destroy()
    end
end


game.Players.PlayerAdded:Connect(function(Player)
    if VisualsTabData["ESP"]["Enabled"] == true then
        AttachESP(Player)
    end

    Player.CharacterAdded:Connect(function(Character)

        if VisualsTabData["ESP"]["Enabled"] == true then
            AttachESP(Player)
        end
    end)
end)


game:GetService("RunService").RenderStepped:Connect(function()
    if MovementTabData["bhop"]["Enabled"] == true then
        if lplr.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
            lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)



function GetNearestPlayer(Range)
    local Distance = math.huge
    local Player = nil

    for _,v in pairs(game:GetService("Players"):GetPlayers()) do
        if v ~= lplr then
            if game.PlaceId == 11630038968 then 
                -- Lobby so no checks
            else
                if v.Team == lplr.Team then
                    continue
                end
            end

            local Magnitude = (v.Character.PrimaryPart.Position - lplr.Character.PrimaryPart.Position).magnitude
        
            if Magnitude < Distance and Magnitude <= Range then
                Distance = Magnitude
                Player = v
            end
        end
    end

    return Player
end

function GetWeapon()
    for _,v in pairs(lplr.Character:GetChildren()) do
        if v:IsA("Tool") and v.Name:match("Sword") then
            return v
        end
    end
end

local InfiniteJumpPart = Instance.new("Part")
InfiniteJumpPart.Anchored = true
InfiniteJumpPart.CanCollide = true
InfiniteJumpPart.Transparency = 0.5
InfiniteJumpPart.Size = Vector3.new(3, 0.5, 3)
InfiniteJumpPart.Parent = game.Workspace

local FloatPart = Instance.new("Part")
FloatPart.Anchored = true
FloatPart.CanCollide = true
FloatPart.Transparency = 0.5
FloatPart.Size = Vector3.new(3, 0.5, 3)
FloatPart.Parent = game.Workspace

local CheckPart = Instance.new("Part")
CheckPart.Anchored = true
CheckPart.Size = Vector3.new(0.1,1,0.1)
CheckPart.CanCollide = false
CheckPart.Transparency = 1
CheckPart.Parent = workspace

PastFloatStatus = false

coroutine.wrap(function()
    while task.wait() do
        local s,e = pcall(function()
            if MovementTabData["Speed"]["Enabled"] == true then
                lplr.Character.HumanoidRootPart.CFrame += lplr.Character.Humanoid.MoveDirection * tonumber(MovementTabData["Speed"]["Settings"]["Speed"]["Value"])
            end

            if MovementTabData["Infinite Jump"]["Enabled"] == true then
                InfiniteJumpPart.Transparency = 0.2
                InfiniteJumpPart.CanCollide = true

                InfiniteJumpPart.CFrame = lplr.Character.HumanoidRootPart.CFrame - Vector3.new(0, 4, 0)
            else
                InfiniteJumpPart.Transparency = 1
                InfiniteJumpPart.CanCollide = false
            end

            if MovementTabData["Float"]["Enabled"] == true then
                if PastFloatStatus == false then
                    FloatPart.CFrame = CFrame.new(lplr.Character.HumanoidRootPart.Position.X, lplr.Character.HumanoidRootPart.Position.Y - 4, lplr.Character.HumanoidRootPart.Position.Z)
                end

                PastFloatStatus = true

                FloatPart.Transparency = 0.2
                FloatPart.CanCollide = true

                FloatPart.CFrame = CFrame.new(lplr.Character.HumanoidRootPart.Position.X, FloatPart.Position.Y, lplr.Character.HumanoidRootPart.Position.Z)
            else
                PastFloatStatus = false
                
                FloatPart.Transparency = 1
                FloatPart.CanCollide = false
            end

            if MovementTabData["Spider"]["Enabled"] == true then
                if lplr.Character.Humanoid.MoveDirection.Magnitude > 0 then
                    CheckPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + lplr.Character.HumanoidRootPart.CFrame.LookVector*3 + Vector3.new(0,-1.5,0)

                    local Parts = game:GetService("Workspace"):GetPartsInPart(CheckPart)

                    for _,v in pairs(Parts) do
                        local s,e = pcall(function()
                            local NotAPlayer = true

                            for _,v2 in pairs(game:GetService("Players"):GetPlayers()) do
                                local s,e = pcall(function()
                                    if v:IsDescendantOf(v2.Character) then
                                        NotAPlayer = false
                                    end
                                end)

                                if s == false then
                                    print(e)    
                                end
                            end

                            if NotAPlayer == true then
                                lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 1, 0)
                            end
                        end)

                        if s == false then
                            print(e)
                        end
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
            if CombatTabData["TP Aura"]["Enabled"] == true then
                local Player = GetNearestPlayer(tonumber(CombatTabData["TP Aura"]["Settings"]["Range"]["Value"]))
                
                if Player then    
                    if CombatTabData["Anti Death"]["Anti Deathing"] == false then
                        lplr.Character.HumanoidRootPart.CFrame = Player.Character.PrimaryPart.CFrame - Player.Character.PrimaryPart.CFrame.LookVector * 2

                        local Weapon = GetWeapon()

                        if Weapon then
                            Weapon:Activate()
                        end
                    end
                end
            end

            if CombatTabData["Orbit Aura"]["Enabled"] == true and CombatTabData["Anti Death"]["Anti Deathing"] == false then
                local Player = GetNearestPlayer(tonumber(CombatTabData["Orbit Aura"]["Settings"]["Range"]["Value"]))

                if Player then
                    local Speed = tonumber(CombatTabData["Orbit Aura"]["Settings"]["Rotation Speed"]["Value"])
                    local Time = tick()
                    local Offset = Vector3.new(math.cos(Time * Speed) * 3, 0, math.sin(Time * Speed) * 3)
                    
                    lplr.Character.HumanoidRootPart.CFrame = CFrame.new(Player.Character.PrimaryPart.Position) * CFrame.new(Offset)

                    local Weapon = GetWeapon()

                    if Weapon then
                        Weapon:Activate()
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
    while task.wait(0.1) do
        local s,e = pcall(function()
            if CombatTabData["Anti Death"]["Enabled"] == true then
                local Player = GetNearestPlayer(20)

                if lplr.Character.Humanoid.Health <= tonumber(CombatTabData["Anti Death"]["Settings"]["Anti Death Health Threshold"]["Value"]) then
                    CombatTabData["Anti Death"]["Anti Deathing"] = true

                    lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame:Lerp(Player.Character.PrimaryPart.CFrame + Vector3.new(0,20,0), .3)
                    lplr.Character.Humanoid.Jump = true
                else
                    CombatTabData["Anti Death"]["Anti Deathing"] = false
                end
            else
                CombatTabData["Anti Death"]["Anti Deathing"] = false
            end
        end)

        if s == false then
            print(e)
        end
    end
end)()


while task.wait(0.5) do
    
    if VisualsTabData["ESP"]["Enabled"] == true then
        for _,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v ~= lplr then
                AttachESP(v)
            end
        end
    else
        for _,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v ~= lplr then
                DetachESP(v)
            end
        end
    end
end
