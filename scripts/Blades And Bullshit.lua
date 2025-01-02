local bui = loadstring(game:HttpGet("https://raw.githubusercontent.com/55zay16/Pylon/refs/heads/main/modules/builib"))()

local Pylon = bui:InitWindow()
local lplr = game:GetService("Players").LocalPlayer

CombatTabData = {
    ["TP Aura"] = {
        ["Name"] = "Tp Aura",
        ["Enabled"] = false,
        ["Settings"] = {
            ["Range"] = {
                ["Name"] = "Range (any higher then 20 might anticheat)",
                ["Type"] = "textbox",
                ["Value"] = 20,
            },
            ["Anti Death"] = {
                ["Name"] = "Anti Death",
                ["Type"] = "button",
                ["Value"] = false
            },
            ["Anti Death Health Threshold"] = {
                ["Name"] = "Anti Death Health Threshold",
                ["Type"] = "textbox",
                ["Value"] = 30,
            }
        }
    },

    ["Kill Aura"] = {
        ["Name"] = "Kill Aura",
        ["Enabled"] = false,
        ["Settings"] = {
            ["Range"] = {
                ["Name"] = "Range",
                ["Type"] = "textbox",
                ["Value"] = 20,
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
                ["Value"] = 100,
            },
            ["Use WalkSpeed"] = {
                ["Name"] = "Use WalkSpeed",
                ["Type"] = "button",
                ["Value"] = true
            }
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
    }
}

VisualsTabData = {
    ["ESP"] = {
        ["Name"] = "ESP",
        ["Enabled"] = false,
        ["Settings"] = {
            ["G"] = {
                ["Name"] = "G",
                ["Type"] = "textbox",
                ["Value"] = "",
            },
            ["B"] = {
                ["Name"] = "B",
                ["Type"] = "textbox",
                ["Value"] = "",
            },
            ["R"] = {
                ["Name"] = "R",
                ["Type"] = "textbox",
                ["Value"] = "",
            }
        }
    },
    ["Tracers"] = {
        ["Name"] = "Tracers",
        ["Enabled"] = false,
        ["Settings"] = {
            ["G"] = {
                ["Name"] = "G",
                ["Type"] = "textbox",
                ["Value"] = "",
            },
            ["B"] = {
                ["Name"] = "B",
                ["Type"] = "textbox",
                ["Value"] = "",
            },
            ["R"] = {
                ["Name"] = "R",
                ["Type"] = "textbox",
                ["Value"] = "",
            }
        }
    },
    ["Nametags"] = {
        ["Name"] = "Nametags",
        ["Enabled"] = false,
        ["Settings"] = {
            ["G"] = {
                ["Name"] = "G",
                ["Type"] = "textbox",
                ["Value"] = "",
            },
            ["B"] = {
                ["Name"] = "B",
                ["Type"] = "textbox",
                ["Value"] = "",
            },
            ["R"] = {
                ["Name"] = "R",
                ["Type"] = "textbox",
                ["Value"] = "",
            }
        }
    }
}

UtilityTabData = {
    ["Anti Void"] = {
        ["Name"] = "Anti Void",
        ["VoidPart"] = nil,
        ["Enabled"] = false,
        ["Settings"] = {}
    },
    ["Box Aura"] = {
        ["Name"] = "Box Aura",
        ["Enabled"] = false,
        ["Settings"] = {
            ["Range"] = {
                ["Name"] = "Range",
                ["Type"] = "textbox",
                ["Value"] = 20,
            }
        }
    },
}

coroutine.wrap(function()
    while task.wait(0) do
        local s,e = pcall(function()
            for _,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v ~= lplr then
                    if v.Character:FindFirstChild("HIGHLIGHT") then 
                        if VisualsTabData["ESP"]["Enabled"] == false then
                            v.Character.HIGHLIGHT:Destroy()
                        else
                            v.Character:FindFirstChild("HIGHLIGHT").FillColor = Color3.fromRGB(VisualsTabData["ESP"]["Settings"]["R"]["Value"],VisualsTabData["ESP"]["Settings"]["G"]["Value"],VisualsTabData["ESP"]["Settings"]["B"]["Value"])
                        end
                    else
                        if VisualsTabData["ESP"]["Enabled"] == true then
                            local Highlight = Instance.new("Highlight")
                            Highlight.FillColor = Color3.fromRGB(VisualsTabData["ESP"]["Settings"]["R"]["Value"],VisualsTabData["ESP"]["Settings"]["G"]["Value"],VisualsTabData["ESP"]["Settings"]["B"]["Value"])
                            Highlight.OutlineColor = Color3.fromRGB(255,255,255)
                            Highlight.FillTransparency = 0.3
                            Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            Highlight.Enabled = true
                            Highlight.Name = "HIGHLIGHT"
                            Highlight.Parent = v.Character
                        end
                    end

                    if v.Character:FindFirstChild("TRACER") then 
                        if VisualsTabData["Tracers"]["Enabled"] == false then
                            v.Character.TRACER:Destroy()
                        else
                            v.Character:FindFirstChild("TRACER").Color = ColorSequence.new(Color3.fromRGB(VisualsTabData["Tracers"]["Settings"]["R"]["Value"],VisualsTabData["Tracers"]["Settings"]["G"]["Value"],VisualsTabData["Tracers"]["Settings"]["B"]["Value"]))
                        end
                    else
                        if VisualsTabData["Tracers"]["Enabled"] == true then
                            local Tracer = Instance.new("Beam")
                            Tracer.Color = ColorSequence.new(Color3.fromRGB(VisualsTabData["Tracers"]["Settings"]["R"]["Value"],VisualsTabData["Tracers"]["Settings"]["G"]["Value"],VisualsTabData["Tracers"]["Settings"]["B"]["Value"]))
                            Tracer.Width0 = 0.1
                            Tracer.Width1 = 0.1
                            Tracer.Name = "TRACER"
                            Tracer.Attachment0 = lplr.Character.HumanoidRootPart.RootAttachment
                            Tracer.Attachment1 = v.Character.HumanoidRootPart.RootAttachment
                            Tracer.Parent = v.Character
                        end
                    end 

                    if v.Character:FindFirstChild("NAMETAG") then 
                        if VisualsTabData["Nametags"]["Enabled"] == false then
                            v.Character.NAMETAG:Destroy()
                        else 
                            v.Character:FindFirstChild("NAMETAG").TextLabel.TextColor3 = Color3.fromRGB(VisualsTabData["Nametags"]["Settings"]["R"]["Value"],VisualsTabData["Nametags"]["Settings"]["G"]["Value"],VisualsTabData["Nametags"]["Settings"]["B"]["Value"])
                        end
                    else
                        if VisualsTabData["Nametags"]["Enabled"] == true then
                            local Nametag = Instance.new("BillboardGui")
                            Nametag.Name = "NAMETAG"
                            Nametag.Size = UDim2.new(0, 50, 0, 20)
                            Nametag.AlwaysOnTop = true
                            Nametag.StudsOffset = Vector3.new(0, 2, 0)
                            Nametag.Adornee = v.Character.Head
                            Nametag.Parent = v.Character
                            local TextLabel = Instance.new("TextLabel")
                            TextLabel.BackgroundTransparency = 1
                            TextLabel.Size = UDim2.new(1, 0, 1, 0)
                            TextLabel.Text = v.Name 
                            TextLabel.TextColor3 = Color3.fromRGB(VisualsTabData["Nametags"]["Settings"]["R"]["Value"],VisualsTabData["Nametags"]["Settings"]["G"]["Value"],VisualsTabData["Nametags"]["Settings"]["B"]["Value"])
                            TextLabel.TextSize = 14.000
                            TextLabel.Parent = Nametag
                            TextLabel.Font = Enum.Font.Nunito
                        end
                    end
                end
            end
        end)
    end
end)()

bui:AttachTab(Pylon, "Combat", CombatTabData)
bui:AttachTab(Pylon, "Movement", MovementTabData)
bui:AttachTab(Pylon, "Visuals", VisualsTabData)
bui:AttachTab(Pylon, "Utility", UtilityTabData)

game.UserInputService.JumpRequest:Connect(function()
    if MovementTabData["Infinite Jump"]["Enabled"] == true then
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

local MovementDirection = 0

game:GetService("RunService").RenderStepped:Connect(function()
    if MovementTabData["bhop"]["Enabled"] == true then
        if lplr.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
            lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)


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
    while task.wait(0) and Pylon do
        local s,e = pcall(function()
            if CombatTabData["TP Aura"]["Enabled"] == true then
                local Player = GetNearestPlayer(tonumber(CombatTabData["TP Aura"]["Settings"]["Range"]["Value"]))

                if Player then
                    lplr.Character.HumanoidRootPart.CFrame = Player.Character.PrimaryPart.CFrame - Player.Character.PrimaryPart.CFrame.LookVector * 2

                    if CombatTabData["TP Aura"]["Settings"]["Anti Death"]["Value"] == true then
                        if lplr.Character.Humanoid.Health <= tonumber(CombatTabData["TP Aura"]["Settings"]["Anti Death Health Threshold"]["Value"]) then
                            lplr.Character.HumanoidRootPart.CFrame = Player.Character.PrimaryPart.CFrame + Vector3.new(0,100,0)
                            lplr.Character.Humanoid.Jump = true
                        else
                            lplr.Character.HumanoidRootPart.CFrame = Player.Character.PrimaryPart.CFrame - Player.Character.PrimaryPart.CFrame.LookVector * 2
                        end
                    else
                        lplr.Character.HumanoidRootPart.CFrame = Player.Character.PrimaryPart.CFrame - Player.Character.PrimaryPart.CFrame.LookVector * 2
                    end
                end
            end
            
            if CombatTabData["Kill Aura"]["Enabled"] == true then
                local Player = GetNearestPlayer(tonumber(CombatTabData["Kill Aura"]["Settings"]["Range"]["Value"]))

                if Player then
                    local LookVector = Vector3.new(
                        Player.Character.PrimaryPart.Position.X - lplr.Character.PrimaryPart.Position.X,
                        0,
                        Player.Character.PrimaryPart.Position.Z - lplr.Character.PrimaryPart.Position.Z
                    ).Unit
                    
                    lplr.Character.HumanoidRootPart.CFrame = CFrame.new(
                        lplr.Character.PrimaryPart.Position,
                        lplr.Character.PrimaryPart.Position + Vector3.new(LookVector.X, 0, LookVector.Z)
                    )
                    
                end     
            end
            
            if UtilityTabData["Box Aura"]["Enabled"] == true then
                local dis = math.huge 
                local box = nil
                for _,v in pairs(game.Workspace.BoxPositions:GetChildren()) do
                    if (v.Position - lplr.Character.PrimaryPart.Position).magnitude < dis and (v.Position - lplr.Character.PrimaryPart.Position).magnitude < tonumber(UtilityTabData["Box Aura"]["Settings"]["Range"]["Value"]) then
                        dis = (v.Position - lplr.Character.PrimaryPart.Position).magnitude
                        box = v
                    end
                end

                if box and #box:GetChildren() > 0 then
                    lplr.Character.HumanoidRootPart.CFrame = box.CFrame
                end
            end

            if MovementTabData["Speed"]["Enabled"] == true then
                if MovementTabData["Speed"]["Settings"]["Use WalkSpeed"]["Value"] == true then
                    lplr.Character.Humanoid.WalkSpeed = tonumber(MovementTabData["Speed"]["Settings"]["Speed"]["Value"])
                else
                    lplr.Character.HumanoidRootPart.CFrame += lplr.Character.Humanoid.MoveDirection * tonumber(MovementTabData["Speed"]["Settings"]["Speed"]["Value"])
                end
            end

            if UtilityTabData["Anti Void"]["Enabled"] == true then
                if UtilityTabData["Anti Void"]["VoidPart"] == nil then
                    local VoidPart = Instance.new("Part")
                    VoidPart.Anchored = true
                    VoidPart.Size = Vector3.new(1000, 1, 1000)
                    VoidPart.Position = Vector3.new(lplr.Character.HumanoidRootPart.Position.X, lplr.Character.HumanoidRootPart.Position.Y - 20, lplr.Character.HumanoidRootPart.Position.Z)
                    
                    VoidPart.CanCollide = true
                    VoidPart.Transparency = 0.5
                    VoidPart.Color = Color3.fromRGB(255, 123, 123)
                    VoidPart.Material = Enum.Material.Neon
                    VoidPart.Parent = game.Workspace 
                    UtilityTabData["Anti Void"]["VoidPart"] = VoidPart

                    VoidPart.Touched:Connect(function(hit)
                        if hit.Parent == lplr.Character then
                            lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                    end)
                end
            else
                if UtilityTabData["Anti Void"]["VoidPart"] == nil then else
                    UtilityTabData["Anti Void"]["VoidPart"]:Destroy()
                    UtilityTabData["Anti Void"]["VoidPart"] = nil  
                end
            end
        end)

        if s == false then
            print(e)
        end
    end
end)()
