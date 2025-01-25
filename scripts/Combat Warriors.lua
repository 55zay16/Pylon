local bui = loadstring(game:HttpGet("https://raw.githubusercontent.com/55zay16/Pylon/refs/heads/main/modules/builib"))()

local Pylon = bui:InitWindow()
local lplr = game:GetService("Players").LocalPlayer

CombatTabData = {
    ["Kill Aura"] = {
        ["Name"] = "Kill Aura",
        ["Enabled"] = false,
        ["Settings"] = {
            ["Range"] = {
                ["Name"] = "Range",
                ["Type"] = "textbox",
                ["Value"] = 20,
            },
        }
    },

    ["TP Aura"] = {
        ["Name"] = "Tp Aura",
        ["Enabled"] = false,
        ["Settings"] = {

            ["Range"] = {
                ["Name"] = "Range (any higher then 10 might anticheat)",
                ["Type"] = "textbox",
                ["Value"] = 60,
            },

            ["Lerp Amount"] = {
                ["Name"] = "Lerp Amount",
                ["Type"] = "textbox",
                ["Value"] = 0.5,
            },

            ["Use Lerping"] = {
                ["Name"] = "Use Lerping",
                ["Type"] = "button",
                ["Value"] = true
            }
        }
    },

    ["Trigger Bot"] = {
        ["Name"] = "Trigger Bot",
        ["Enabled"] = false,
        ["Settings"] = {
            ["Range"] = {
                ["Name"] = "Range",
                ["Type"] = "textbox",
                ["Value"] = 8,
            }
        }
    }
}

MovementTabData = {
    ["Speed"] = {
        ["Name"] = "Speed",
        ["Enabled"] = false,
        ["Settings"] = {
            ["Speed"] = {
                ["Name"] = "Speed",
                ["Type"] = "textbox",
                ["Value"] = 1,
            },

            ["Use Lerping"] = {
                ["Name"] = "Use Lerping",
                ["Type"] = "button",
                ["Value"] = true
            },

            ["Lerp Amount"] = {
                ["Name"] = "Lerp Amount",
                ["Type"] = "textbox",
                ["Value"] = 0.5,
            }
        }
    },
    ["Bhop"] = {
        ["Name"] = "Bhop",
        ["Enabled"] = false,
        ["Settings"] = {
            ["Delay"] = {
                ["Name"] = "Delay",
                ["Type"] = "textbox",
                ["Value"] = 2
            }
        }
    },
}

VisualsTabData = {
    ["ESP"] = {
        ["Name"] = "ESP",
        ["Enabled"] = false,
        ["Settings"] = {
            ["R"] = {
                ["Name"] = "R",
                ["Type"] = "textbox",
                ["Value"] = 255
            },
            ["G"] = {
                ["Name"] = "G",
                ["Type"] = "textbox",
                ["Value"] = 255
            },
            ["B"] = {
                ["Name"] = "B",
                ["Type"] = "textbox",
                ["Value"] = 255
            }
        }
    },

    ["Tracers"] = {
        ["Name"] = "Tracers",
        ["Enabled"] = false,
        ["Settings"] = {
            ["R"] = {
                ["Name"] = "R",
                ["Type"] = "textbox",
                ["Value"] = 255
            },
            ["G"] = {
                ["Name"] = "G",
                ["Type"] = "textbox",
                ["Value"] = 255
            },
            ["B"] = {
                ["Name"] = "B",
                ["Type"] = "textbox",
                ["Value"] = 255
            }
        }
    },

    ["Nametags"] = {
        ["Name"] = "Nametags",
        ["Enabled"] = false,
        ["Settings"] = {
            ["R"] = {
                ["Name"] = "R",
                ["Type"] = "textbox",
                ["Value"] = 255
            },
            ["G"] = {
                ["Name"] = "G",
                ["Type"] = "textbox",
                ["Value"] = 255
            },
            ["B"] = {
                ["Name"] = "B",
                ["Type"] = "textbox",
                ["Value"] = 255
            }
        }
    }
}

local function AttachNametag(Player)
    if Player.Character:FindFirstChild("NAMETAG") then
        return
    end

    local Nametag = Instance.new("BillboardGui")
    Nametag.Name = "NAMETAG"
    Nametag.Size = UDim2.new(0, 50, 0, 20)
    Nametag.AlwaysOnTop = true
    Nametag.StudsOffset = Vector3.new(0, 2, 0)
    Nametag.Adornee = Player.Character.Head
    Nametag.Parent = Player.Character

    local TextLabel = Instance.new("TextLabel")
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Text = Player.Name    
    TextLabel.TextColor3 = Color3.fromRGB(VisualsTabData["Nametags"]["Settings"]["R"]["Value"],VisualsTabData["Nametags"]["Settings"]["G"]["Value"],VisualsTabData["Nametags"]["Settings"]["B"]["Value"])
    TextLabel.TextSize = 14.000
    TextLabel.Parent = Nametag
    TextLabel.Font = Enum.Font.RobotoMono
end

local function DetachNametag(Player)
    if Player.Character:FindFirstChild("NAMETAG") then
        Player.Character.NAMETAG:Destroy()
    end
end

local function AttachTracer(Player)
    if Player.Character:FindFirstChild("TRACER") then
        return
    end

    local Tracer = Instance.new("Beam")
    Tracer.Color = ColorSequence.new(Color3.fromRGB(VisualsTabData["Tracers"]["Settings"]["R"]["Value"],VisualsTabData["Tracers"]["Settings"]["G"]["Value"],VisualsTabData["Tracers"]["Settings"]["B"]["Value"]))
    Tracer.Width0 = 0.1
    Tracer.Name = "TRACER"
    Tracer.Width1 = 0.1
    Tracer.Attachment0 = lplr.Character.HumanoidRootPart.RootAttachment
    Tracer.Attachment1 = Player.Character.HumanoidRootPart.RootAttachment
    Tracer.Parent = Player.Character 
end

local function DetachTracer(Player) 
    if Player.Character:FindFirstChild("TRACER") then
        Player.Character.TRACER:Destroy()
    end
end

local function AttachESP(Player)
    if Player.Character:FindFirstChild("HIGHLIGHT") then
        return
    end

    local ESP = Instance.new("Highlight")
    ESP.OutlineColor = Color3.fromRGB(VisualsTabData["ESP"]["Settings"]["R"]["Value"],VisualsTabData["ESP"]["Settings"]["G"]["Value"],VisualsTabData["ESP"]["Settings"]["B"]["Value"])
    ESP.FillTransparency = 1
    ESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    ESP.FillColor = Color3.fromRGB(VisualsTabData["ESP"]["Settings"]["R"]["Value"],VisualsTabData["ESP"]["Settings"]["G"]["Value"],VisualsTabData["ESP"]["Settings"]["B"]["Value"])
    ESP.Enabled = true
    ESP.Name = "HIGHLIGHT"
    ESP.Parent = Player.Character
end

local function DetachESP(Player)
    if Player.Character:FindFirstChild("HIGHLIGHT") then
        Player.Character.HIGHLIGHT:Destroy()
    end
end

game.Players.PlayerAdded:Connect(function(Player)
    if Player ~= lplr then
        Player.CharacterAdded:Connect(function(Character)
            if VisualsTabData["Nametags"]["Enabled"] == true then
                AttachNametag(Player)
            end

            if VisualsTabData["Tracers"]["Enabled"] == true then
                AttachTracer(Player)
            end

            if VisualsTabData["ESP"]["Enabled"] == true then
                AttachESP(Player)
            end
        end)
    end
end)

UtilityTabData = {

}

local CanBhop = true

game:GetService("RunService").RenderStepped:Connect(function()
    if MovementTabData["Bhop"]["Enabled"] == true and CanBhop == true then
        if lplr.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
            lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

            CanBhop = false
            task.wait(tonumber(MovementTabData["Bhop"]["Settings"]["Delay"]["Value"]))
            CanBhop = true
        end
    end
end)


bui:AttachTab(Pylon, "Combat", CombatTabData)
bui:AttachTab(Pylon, "Movement", MovementTabData)
bui:AttachTab(Pylon, "Visuals", VisualsTabData)
bui:AttachTab(Pylon, "Utility", UtilityTabData)

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
    while task.wait(0.3) do
        local s,e = pcall(function()
            if VisualsTabData["Nametags"]["Enabled"] == true then
                for _,v in pairs(game:GetService("Players"):GetPlayers()) do
                    if v ~= lplr then
                        AttachNametag(v)
                    end
                end
            else
                for _,v in pairs(game:GetService("Players"):GetPlayers()) do
                    if v ~= lplr then
                        DetachNametag(v)
                    end
                end
            end

            if VisualsTabData["Tracers"]["Enabled"] == true then
                for _,v in pairs(game:GetService("Players"):GetPlayers()) do
                    if v ~= lplr then
                        AttachTracer(v)
                    end
                end
            else
                for _,v in pairs(game:GetService("Players"):GetPlayers()) do
                    if v ~= lplr then
                        DetachTracer(v)
                    end
                end
            end 

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
        end)

        if s == false then
            print(e)
        end
    end
end)()

coroutine.wrap(function()
    while task.wait(0.3) do
        local s,e = pcall(function()
            if CombatTabData["Trigger Bot"]["Enabled"] == true then
                local Player = GetNearestPlayer(tonumber(CombatTabData["Trigger Bot"]["Settings"]["Range"]["Value"]))

                if Player then
                    mouse1click()
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
            if CombatTabData["Kill Aura"]["Enabled"] == true then
                local Player = GetNearestPlayer(tonumber(CombatTabData["Kill Aura"]["Settings"]["Range"]["Value"]))

                if Player then
                    lplr.Character.HumanoidRootPart.CFrame = CFrame.new(
                        Vector3.new(lplr.Character.PrimaryPart.Position.X, lplr.Character.PrimaryPart.Position.Y, lplr.Character.PrimaryPart.Position.Z),
                        Vector3.new(Player.Character.PrimaryPart.Position.X, lplr.Character.PrimaryPart.Position.Y, Player.Character.PrimaryPart.Position.Z)
                    )
                end
            end

            if CombatTabData["TP Aura"]["Enabled"] == true then
                local Player = GetNearestPlayer(tonumber(CombatTabData["TP Aura"]["Settings"]["Range"]["Value"]))

                if Player then
                    if CombatTabData["Anti Death"]["Anti Deathing"] == false then
                        if CombatTabData["TP Aura"]["Settings"]["Use Lerping"]["Value"] == true then
                            lplr.Character.HumanoidRootPart.CFrame = lplr.Character.PrimaryPart.CFrame:Lerp(Player.Character.HumanoidRootPart.CFrame - Player.Character.HumanoidRootPart.CFrame.LookVector * 2, tonumber(CombatTabData["TP Aura"]["Settings"]["Lerp Amount"]["Value"]))
                        else
                            lplr.Character.HumanoidRootPart.CFrame = Player.Character.PrimaryPart.CFrame - Player.Character.PrimaryPart.CFrame.LookVector * 2
                        end
                    end
                end
            end

            if MovementTabData["Speed"]["Enabled"] == true then
                if MovementTabData["Speed"]["Settings"]["Use Lerping"]["Value"] == true then
                    lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame:Lerp(lplr.Character.HumanoidRootPart.CFrame + (lplr.Character.Humanoid.MoveDirection * tonumber(MovementTabData["Speed"]["Settings"]["Speed"]["Value"])), tonumber(MovementTabData["Speed"]["Settings"]["Lerp Amount"]["Value"]))
                else
                    lplr.Character.HumanoidRootPart.CFrame += lplr.Character.Humanoid.MoveDirection * tonumber(MovementTabData["Speed"]["Settings"]["Speed"]["Value"])
                end
            end
        end)

        if s == false then
            print(e)
        end
    end
end)()
