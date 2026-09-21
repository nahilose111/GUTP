local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Stats = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer
local IsStudio = RunService:IsStudio()

local ImGui
if IsStudio then
	ImGui = require(ReplicatedStorage.ImGui)
else
	local SourceURL = 'https://github.com/depthso/Roblox-ImGUI/raw/main/ImGui.lua'
	ImGui = loadstring(game:HttpGet(SourceURL))()
end

local Window = ImGui:CreateWindow({
	Title = "Radius Client | V1",
	Size = UDim2.new(0, 400, 0, 520),
	Position = UDim2.new(0.5, 0, 0, 70)
})
Window:Center()

local ESPTab = Window:CreateTab({
	Name = "ESP"
})

local toggles = {
	Tracer = true,
	Name = true,
	Distance = true,
	OffScreenArrows = true,
	ChamsWallCheck = false,
	TeamCheck = true,
	HealthBar = true,
	MaxDistance = 1500,
	VisibleOnly = false
}

local selectedChams = "Default"
local chamsColor = {R = 255, G = 0, B = 0}
local selectedBoxStyle = "Corner"

local standardRobloxESP = false

local radarSettings = {
	Enabled = true,
	Range = 150,
	X = 130,
	Y = 160
}

ESPTab:Checkbox({
	Label = "Team Check (ESP)",
	Value = toggles.TeamCheck,
	Callback = function(self, value)
		toggles.TeamCheck = value
	end
})

ESPTab:Checkbox({
	Label = "ESP Visible Only",
	Value = toggles.VisibleOnly,
	Callback = function(self, value)
		toggles.VisibleOnly = value
	end
})

ESPTab:Combo({
	Label = "Chams Style",
	Selected = selectedChams,
	Items = {"Off", "Default", "Neon Glow", "ForceField", "Glass", "Outline Only", "Flat Color"},
	Callback = function(self, value)
		selectedChams = value
	end
})

ESPTab:Checkbox({
	Label = "Chams Wall Check",
	Value = toggles.ChamsWallCheck,
	Callback = function(self, value)
		toggles.ChamsWallCheck = value
	end
})

ESPTab:ProgressSlider({
	Label = "Chams Color Red",
	CornerRadius = UDim.new(1, 0),
	Value = chamsColor.R,
	MinValue = 0,
	MaxValue = 255,
	Callback = function(self, value)
		chamsColor.R = value
	end
})

ESPTab:ProgressSlider({
	Label = "Chams Color Green",
	CornerRadius = UDim.new(1, 0),
	Value = chamsColor.G,
	MinValue = 0,
	MaxValue = 255,
	Callback = function(self, value)
		chamsColor.G = value
	end
})

ESPTab:ProgressSlider({
	Label = "Chams Color Blue",
	CornerRadius = UDim.new(1, 0),
	Value = chamsColor.B,
	MinValue = 0,
	MaxValue = 255,
	Callback = function(self, value)
		chamsColor.B = value
	end
})

ESPTab:Combo({
	Label = "Box Style",
	Selected = selectedBoxStyle,
	Items = {"Off", "Corner", "Full Box"},
	Callback = function(self, value)
		selectedBoxStyle = value
	end
})

ESPTab:Checkbox({
	Label = "Health Bar",
	Value = toggles.HealthBar,
	Callback = function(self, value)
		toggles.HealthBar = value
	end
})

ESPTab:Checkbox({
	Label = "Tracer",
	Value = toggles.Tracer,
	Callback = function(self, value)
		toggles.Tracer = value
	end
})

ESPTab:Checkbox({
	Label = "Name",
	Value = toggles.Name,
	Callback = function(self, value)
		toggles.Name = value
	end
})

ESPTab:Checkbox({
	Label = "Distance",
	Value = toggles.Distance,
	Callback = function(self, value)
		toggles.Distance = value
	end
})

ESPTab:ProgressSlider({
	Label = "ESP Max Distance",
	CornerRadius = UDim.new(1, 0),
	Value = toggles.MaxDistance,
	MinValue = 200,
	MaxValue = 5000,
	Callback = function(self, value)
		toggles.MaxDistance = value
	end
})

ESPTab:Checkbox({
	Label = "Arrows",
	Value = toggles.OffScreenArrows,
	Callback = function(self, value)
		toggles.OffScreenArrows = value
	end
})

ESPTab:Checkbox({
	Label = "Radar",
	Value = radarSettings.Enabled,
	Callback = function(self, value)
		radarSettings.Enabled = value
	end
})

ESPTab:ProgressSlider({
	Label = "Radar Range",
	CornerRadius = UDim.new(1, 0),
	Value = radarSettings.Range,
	MinValue = 50,
	MaxValue = 400,
	Callback = function(self, value)
		radarSettings.Range = value
	end
})

ESPTab:ProgressSlider({
	Label = "Radar X Position",
	CornerRadius = UDim.new(1, 0),
	Value = radarSettings.X,
	MinValue = 50,
	MaxValue = 1200,
	Callback = function(self, value)
		radarSettings.X = value
	end
})

ESPTab:ProgressSlider({
	Label = "Radar Y Position",
	CornerRadius = UDim.new(1, 0),
	Value = radarSettings.Y,
	MinValue = 50,
	MaxValue = 900,
	Callback = function(self, value)
		radarSettings.Y = value
	end
})

local AimbotTab = Window:CreateTab({
	Name = "Aimbot"
})

local aimbotSettings = {
	Enabled = false,
	TargetPart = "Head",
	Smoothness = 5,
	ShowFOV = true,
	FOVRadius = 150,
	FOVFilled = false,
	AimCondition = "Always",
	AimLine = false,
	WallCheck = true,
	TeamCheck = true,
	AutoFire = false,
	AimMethod = "MouseMovement",
	Prediction = 0.1
}

AimbotTab:Checkbox({
	Label = "Enable Aimbot",
	Value = aimbotSettings.Enabled,
	Callback = function(self, value)
		aimbotSettings.Enabled = value
	end
})

AimbotTab:Checkbox({
	Label = "Team Check (Aimbot)",
	Value = aimbotSettings.TeamCheck,
	Callback = function(self, value)
		aimbotSettings.TeamCheck = value
	end
})

AimbotTab:Checkbox({
	Label = "Aim Line",
	Value = aimbotSettings.AimLine,
	Callback = function(self, value)
		aimbotSettings.AimLine = value
	end
})

AimbotTab:Checkbox({
	Label = "Wall Check",
	Value = aimbotSettings.WallCheck,
	Callback = function(self, value)
		aimbotSettings.WallCheck = value
	end
})

AimbotTab:Checkbox({
	Label = "Auto Fire",
	Value = aimbotSettings.AutoFire,
	Callback = function(self, value)
		aimbotSettings.AutoFire = value
	end
})

AimbotTab:Combo({
	Label = "Target Part",
	Selected = aimbotSettings.TargetPart,
	Items = {"Head", "RootPart"},
	Callback = function(self, value)
		aimbotSettings.TargetPart = value
	end
})

AimbotTab:ProgressSlider({
	Label = "Smoothness",
	CornerRadius = UDim.new(1, 0),
	Value = aimbotSettings.Smoothness,
	MinValue = 1,
	MaxValue = 20,
	Callback = function(self, value)
		aimbotSettings.Smoothness = value
	end
})

AimbotTab:ProgressSlider({
	Label = "Aim Prediction",
	CornerRadius = UDim.new(1, 0),
	Value = aimbotSettings.Prediction * 10,
	MinValue = 0,
	MaxValue = 50,
	Callback = function(self, value)
		aimbotSettings.Prediction = value / 10
	end
})

AimbotTab:Checkbox({
	Label = "Show FOV",
	Value = aimbotSettings.ShowFOV,
	Callback = function(self, value)
		aimbotSettings.ShowFOV = value
	end
})

AimbotTab:Checkbox({
	Label = "Filled FOV",
	Value = aimbotSettings.FOVFilled,
	Callback = function(self, value)
		aimbotSettings.FOVFilled = value
	end
})

AimbotTab:ProgressSlider({
	Label = "FOV Radius",
	CornerRadius = UDim.new(1, 0),
	Value = aimbotSettings.FOVRadius,
	MinValue = 50,
	MaxValue = 500,
	Callback = function(self, value)
		aimbotSettings.FOVRadius = value
	end
})

AimbotTab:Combo({
	Label = "Aim Condition",
	Selected = aimbotSettings.AimCondition,
	Items = {"Always", "Fire", "ADS"},
	Callback = function(self, value)
		aimbotSettings.AimCondition = value
	end
})

local MiscTab = Window:CreateTab({
	Name = "Misc"
})

local miscSettings = {
	Crosshair = false,
	CameraFOV = 70,
	Watermark = true
}

MiscTab:Checkbox({
	Label = "Watermark",
	Value = miscSettings.Watermark,
	Callback = function(self, value)
		miscSettings.Watermark = value
	end
})

MiscTab:Checkbox({
	Label = "Crosshair",
	Value = miscSettings.Crosshair,
	Callback = function(self, value)
		miscSettings.Crosshair = value
	end
})

MiscTab:ProgressSlider({
	Label = "Camera FOV",
	CornerRadius = UDim.new(1, 0),
	Value = miscSettings.CameraFOV,
	MinValue = 50,
	MaxValue = 120,
	Callback = function(self, value)
		miscSettings.CameraFOV = value
	end
})

local SettingsTab = Window:CreateTab({
	Name = "Settings"
})

local Camera = workspace.CurrentCamera

local fovCircle = Drawing.new("Circle")
fovCircle.Visible = false
fovCircle.Color = Color3.fromRGB(255, 255, 255)
fovCircle.Thickness = 1
fovCircle.Filled = false
fovCircle.NumSides = 64

local aimLine = Drawing.new("Line")
aimLine.Visible = false
aimLine.Color = Color3.fromRGB(255, 255, 255)
aimLine.Thickness = 1

local crosshairH = Drawing.new("Line")
crosshairH.Visible = false
crosshairH.Color = Color3.fromRGB(0, 255, 0)
crosshairH.Thickness = 1

local crosshairV = Drawing.new("Line")
crosshairV.Visible = false
crosshairV.Color = Color3.fromRGB(0, 255, 0)
crosshairV.Thickness = 1

local espCountText = Drawing.new("Text")
espCountText.Visible = true
espCountText.Center = true
espCountText.Outline = true
espCountText.Color = Color3.fromRGB(255, 255, 255)
espCountText.Size = 15

local watermarkGui = Instance.new("ScreenGui")
watermarkGui.Name = "RadiusWatermark"
watermarkGui.ResetOnSpawn = false
pcall(function()
	watermarkGui.Parent = CoreGui
end)
if not watermarkGui.Parent then
	watermarkGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

local glowFrame = Instance.new("Frame")
glowFrame.Name = "Glow"
glowFrame.Size = UDim2.new(0, 260, 0, 46)
glowFrame.Position = UDim2.new(1, -275, 0, 15)
glowFrame.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
glowFrame.BackgroundTransparency = 0.8
glowFrame.BorderSizePixel = 0
glowFrame.Parent = watermarkGui

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 12)
glowCorner.Parent = glowFrame

local watermarkBg = Instance.new("Frame")
watermarkBg.Name = "MainFrame"
watermarkBg.Size = UDim2.new(0, 250, 0, 38)
watermarkBg.Position = UDim2.new(1, -270, 0, 19)
watermarkBg.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
watermarkBg.BackgroundTransparency = 0.2
watermarkBg.BorderSizePixel = 0
watermarkBg.Parent = watermarkGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 8)
mainCorner.Parent = watermarkBg

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(0, 170, 255)
mainStroke.Transparency = 0.3
mainStroke.Thickness = 1.5
mainStroke.Parent = watermarkBg

local avatarImage = Instance.new("ImageLabel")
avatarImage.Name = "Avatar"
avatarImage.Size = UDim2.new(0, 26, 0, 26)
avatarImage.Position = UDim2.new(0, 6, 0, 6)
avatarImage.BackgroundTransparency = 1
avatarImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=420&height=420&format=png"
avatarImage.Parent = watermarkBg

local avatarCorner = Instance.new("UICorner")
avatarCorner.CornerRadius = UDim.new(1, 0)
avatarCorner.Parent = avatarImage

local watermarkText = Instance.new("TextLabel")
watermarkText.Name = "Text"
watermarkText.Size = UDim2.new(1, -40, 1, 0)
watermarkText.Position = UDim2.new(0, 38, 0, 0)
watermarkText.BackgroundTransparency = 1
watermarkText.Font = Enum.Font.GothamSemibold
watermarkText.TextColor3 = Color3.fromRGB(255, 255, 255)
watermarkText.TextSize = 12
watermarkText.TextXAlignment = Enum.TextXAlignment.Left
watermarkText.Text = "Radius Client | FPS: 60 | 0ms"
watermarkText.Parent = watermarkBg

local radarSize = 100

local radarBg = Drawing.new("Circle")
radarBg.Visible = false
radarBg.Radius = radarSize
radarBg.Color = Color3.fromRGB(20, 20, 20)
radarBg.Filled = true
radarBg.Transparency = 0.7

local radarOutline = Drawing.new("Circle")
radarOutline.Visible = false
radarOutline.Radius = radarSize
radarOutline.Color = Color3.fromRGB(255, 255, 255)
radarOutline.Thickness = 1
radarOutline.Filled = false

local radarCrossH = Drawing.new("Line")
radarCrossH.Visible = false
radarCrossH.Color = Color3.fromRGB(60, 60, 60)
radarCrossH.Thickness = 1

local radarCrossV = Drawing.new("Line")
radarCrossV.Visible = false
radarCrossV.Color = Color3.fromRGB(60, 60, 60)
radarCrossV.Thickness = 1

local function rotatePoint(point, center, angle)
	local s = math.sin(angle)
	local c = math.cos(angle)
	local x = point.X - center.X
	local y = point.Y - center.Y
	return Vector2.new(x * c - y * s + center.X, x * s + y * c + center.Y)
end

local function checkWallVisibility(targetPos, targetModel)
	if not aimbotSettings.WallCheck and not toggles.VisibleOnly then return true end
	local origin = Camera.CFrame.Position
	local result = workspace:Raycast(origin, targetPos - origin)
	return result == nil or result.Instance:IsDescendantOf(targetModel)
end

local Client = nil
for _, v in pairs(getgc(true)) do
	if type(v) == "table" then
		local successUpvalue, players = pcall(function()
			return debug.getupvalue(rawget(v, 'new'), 9)
		end)
		if successUpvalue and players then
			Client = { Players = players }
			break
		end
	end
end

local espObjects = {}
local connections = {}
local lastFPSUpdate = 0
local frameCount = 0
local currentFPS = 60
local lastAutoFireTick = 0

table.insert(connections, RunService.RenderStepped:Connect(function(dt)
	frameCount = frameCount + 1
	if tick() - lastFPSUpdate >= 1 then
		currentFPS = frameCount
		frameCount = 0
		lastFPSUpdate = tick()
	end
	
	watermarkGui.Enabled = miscSettings.Watermark
	fovCircle.Filled = aimbotSettings.FOVFilled
	
	local ping = 0
	pcall(function() ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) end)
	watermarkText.Text = string.format("Radius Client | FPS: %d | %dms", currentFPS, ping)

	pcall(function()
		local mouseCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
		
		Camera.FieldOfView = miscSettings.CameraFOV

		if miscSettings.Crosshair then
			crosshairH.From = Vector2.new(mouseCenter.X - 6, mouseCenter.Y)
			crosshairH.To = Vector2.new(mouseCenter.X + 6, mouseCenter.Y)
			crosshairH.Visible = true

			crosshairV.From = Vector2.new(mouseCenter.X, mouseCenter.Y - 6)
			crosshairV.To = Vector2.new(mouseCenter.X, mouseCenter.Y + 6)
			crosshairV.Visible = true
		else
			crosshairH.Visible = false
			crosshairV.Visible = false
		end

		if aimbotSettings.Enabled and aimbotSettings.ShowFOV then
			fovCircle.Visible = true
			fovCircle.Radius = aimbotSettings.FOVRadius
			fovCircle.Position = mouseCenter
		else
			fovCircle.Visible = false
		end

		local radarCenter = Vector2.new(radarSettings.X, radarSettings.Y)
		if radarSettings.Enabled then
			radarBg.Visible = true
			radarOutline.Visible = true
			radarCrossH.Visible = true
			radarCrossV.Visible = true

			radarBg.Position = radarCenter
			radarOutline.Position = radarCenter
			radarBg.Radius = radarSize
			radarOutline.Radius = radarSize

			radarCrossH.From = Vector2.new(radarCenter.X - radarSize, radarCenter.Y)
			radarCrossH.To = Vector2.new(radarCenter.X + radarSize, radarCenter.Y)
			radarCrossV.From = Vector2.new(radarCenter.X, radarCenter.Y - radarSize)
			radarCrossV.To = Vector2.new(radarCenter.X, radarCenter.Y + radarSize)
		else
			radarBg.Visible = false
			radarOutline.Visible = false
			radarCrossH.Visible = false
			radarCrossV.Visible = false
		end

		local canAim = false
		if aimbotSettings.AimCondition == "Always" then
			canAim = true
		elseif aimbotSettings.AimCondition == "Fire" then
			canAim = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
		elseif aimbotSettings.AimCondition == "Hold RMB" then
			canAim = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
		end

		local activeEspCount = 0
		local targetList = {}

		if standardRobloxESP then
			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Head") then
					if not (toggles.TeamCheck and player.Team and player.Team == LocalPlayer.Team) then
						local hum = player.Character:FindFirstChildOfClass("Humanoid")
						if hum and hum.Health > 0 then
							local char = player.Character
							local rootPart = char.HumanoidRootPart
							local headPart = char.Head
							table.insert(targetList, {
								Key = player,
								Name = player.Name,
								Model = char,
								RootPos = rootPart.Position,
								HeadPos = headPart.Position + Vector3.new(0, 0.6, 0),
								LegPos = rootPart.Position - Vector3.new(0, 2.5, 0),
								SpecificHeadPos = headPart.Position,
								SpecificRootPos = rootPart.Position,
								Velocity = rootPart.AssemblyLinearVelocity or rootPart.Velocity,
								Dead = false
							})
						end
					end
				end
			end
		else
			if Client and Client.Players then
				for _, player in pairs(Client.Players) do
					local model = player.PlayerModel and player.PlayerModel.Model
					if model and not player.Dead and player.Position and player.Position.Magnitude > 5 then
						local rootPos = player.Position
						local headOffsetMultiplier = 5.5
						local legOffsetMultiplier = -1.0
						local headP = rootPos + Vector3.new(0, headOffsetMultiplier, 0)

						table.insert(targetList, {
							Key = player,
							Name = player.Name or "Player",
							Model = model,
							RootPos = rootPos,
							HeadPos = headP,
							LegPos = rootPos + Vector3.new(0, legOffsetMultiplier, 0),
							SpecificHeadPos = headP - Vector3.new(0, 0.8, 0),
							SpecificRootPos = rootPos + Vector3.new(0, 3.0, 0),
							Velocity = player.Velocity or Vector3.new(),
							Dead = player.Dead
						})
					end
				end
			end
		end

		local closestPlayerPart = nil
		local closestTargetWorldPos = nil
		local shortestDist = math.huge
		local localChar = LocalPlayer.Character
		local localPos = localChar and localChar:FindFirstChild("HumanoidRootPart") and localChar.HumanoidRootPart.Position or Camera.CFrame.Position

		for _, data in ipairs(targetList) do
			local playerKey = data.Key
			local model = data.Model
			
			local targetPosWorld = (aimbotSettings.TargetPart == "Head") and data.SpecificHeadPos or data.SpecificRootPos
			if data.Velocity then
				targetPosWorld = targetPosWorld + (data.Velocity * aimbotSettings.Prediction)
			end

			local proceed = true
			if toggles.VisibleOnly and not checkWallVisibility(targetPosWorld, model) then
				proceed = false
			end

			if proceed then
				local distToLocal = (data.RootPos - localPos).Magnitude
				if distToLocal <= toggles.MaxDistance then
					activeEspCount = activeEspCount + 1

					if not espObjects[playerKey] then
						local highlight = Instance.new("Highlight")
						highlight.Parent = model
						highlight.FillColor = Color3.fromRGB(chamsColor.R, chamsColor.G, chamsColor.B)
						highlight.FillTransparency = 0.3
						highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
						highlight.OutlineTransparency = 0

						local lines = {}
						for i = 1, 8 do
							local l = Drawing.new("Line")
							l.Visible = false
							l.Color = Color3.fromRGB(255, 255, 255)
							l.Thickness = 1.5
							table.insert(lines, l)
						end

						local fullBox = Drawing.new("Square")
						fullBox.Visible = false
						fullBox.Color = Color3.fromRGB(255, 255, 255)
						fullBox.Thickness = 1
						fullBox.Filled = false

						local tracer = Drawing.new("Line")
						tracer.Visible = false
						tracer.Color = Color3.fromRGB(255, 255, 255)
						tracer.Thickness = 1

						local nameText = Drawing.new("Text")
						nameText.Visible = false
						nameText.Center = true
						nameText.Outline = true
						nameText.Color = Color3.fromRGB(255, 255, 255)
						nameText.Size = 14

						local distText = Drawing.new("Text")
						distText.Visible = false
						distText.Center = true
						distText.Outline = true
						distText.Color = Color3.fromRGB(255, 255, 255)
						distText.Size = 13

						local radarDot = Drawing.new("Circle")
						radarDot.Visible = false
						radarDot.Radius = 3
						radarDot.Filled = true
						radarDot.Color = Color3.fromRGB(255, 50, 50)

						local offScreenArrow = Drawing.new("Triangle")
						offScreenArrow.Visible = false
						offScreenArrow.Color = Color3.fromRGB(255, 50, 50)
						offScreenArrow.Filled = true

						local offScreenDistText = Drawing.new("Text")
						offScreenDistText.Visible = false
						offScreenDistText.Center = true
						offScreenDistText.Outline = true
						offScreenDistText.Color = Color3.fromRGB(255, 255, 255)
						offScreenDistText.Size = 12

						espObjects[playerKey] = {
							Highlight = highlight, 
							Lines = lines, 
							FullBox = fullBox,
							Tracer = tracer,
							NameText = nameText,
							DistText = distText,
							RadarDot = radarDot,
							OffScreenArrow = offScreenArrow,
							OffScreenDistText = offScreenDistText
						}
					end

					if espObjects[playerKey].Highlight then
						if selectedChams == "Off" then
							espObjects[playerKey].Highlight.Enabled = false
						else
							espObjects[playerKey].Highlight.Enabled = true
							espObjects[playerKey].Highlight.FillColor = Color3.fromRGB(chamsColor.R, chamsColor.G, chamsColor.B)
							espObjects[playerKey].Highlight.DepthMode = toggles.ChamsWallCheck and Enum.HighlightDepthMode.Occluded or Enum.HighlightDepthMode.AlwaysOnTop
							if selectedChams == "Default" then
								espObjects[playerKey].Highlight.FillTransparency = 0.3
								espObjects[playerKey].Highlight.OutlineTransparency = 0
							elseif selectedChams == "Neon Glow" then
								espObjects[playerKey].Highlight.FillTransparency = 0.1
								espObjects[playerKey].Highlight.OutlineTransparency = 0
							elseif selectedChams == "ForceField" then
								espObjects[playerKey].Highlight.FillTransparency = 0.5
								espObjects[playerKey].Highlight.OutlineTransparency = 0.5
							elseif selectedChams == "Glass" then
								espObjects[playerKey].Highlight.FillTransparency = 0.7
								espObjects[playerKey].Highlight.OutlineTransparency = 0.2
							elseif selectedChams == "Outline Only" then
								espObjects[playerKey].Highlight.FillTransparency = 1
								espObjects[playerKey].Highlight.OutlineTransparency = 0
							elseif selectedChams == "Flat Color" then
								espObjects[playerKey].Highlight.FillTransparency = 0
								espObjects[playerKey].Highlight.OutlineTransparency = 1
							end
						end
					end

					local rootPos = data.RootPos
					local headPos = data.HeadPos
					local legPos = data.LegPos

					local headScreen, headOnScreen = Camera:WorldToViewportPoint(headPos)
					local legScreen, legOnScreen = Camera:WorldToViewportPoint(legPos)
					local rootScreen, rootOnScreen = Camera:WorldToViewportPoint(rootPos)

					local screenP, onScr = Camera:WorldToViewportPoint(targetPosWorld)
					if onScr then
						local screenPos2D = Vector2.new(screenP.X, screenP.Y)
						local dist = (screenPos2D - mouseCenter).Magnitude
						
						if aimbotSettings.Enabled then
							local passTeamCheckAimbot = true
							if aimbotSettings.TeamCheck and typeof(playerKey) == "Instance" and playerKey:IsA("Player") then
								if playerKey.Team and playerKey.Team == LocalPlayer.Team then
									passTeamCheckAimbot = false
								end
							end

							if passTeamCheckAimbot and dist <= aimbotSettings.FOVRadius and dist < shortestDist then
								if checkWallVisibility(targetPosWorld, model) then
									shortestDist = dist
									closestPlayerPart = screenPos2D
									closestTargetWorldPos = targetPosWorld
								end
							end
						end
					end

					if headOnScreen or legOnScreen then
						local height = math.abs(headScreen.Y - legScreen.Y)
						local width = height / 2
						local x = headScreen.X - width / 2
						local y = headScreen.Y
						local lineLen = width / 3

						if selectedBoxStyle == "Corner" then
							local lines = espObjects[playerKey].Lines

							lines[1].From = Vector2.new(x, y)
							lines[1].To = Vector2.new(x + lineLen, y)
							lines[2].From = Vector2.new(x, y)
							lines[2].To = Vector2.new(x, y + lineLen)

							lines[3].From = Vector2.new(x + width, y)
							lines[3].To = Vector2.new(x + width - lineLen, y)
							lines[4].From = Vector2.new(x + width, y)
							lines[4].To = Vector2.new(x + width, y + lineLen)

							lines[5].From = Vector2.new(x, y + height)
							lines[5].To = Vector2.new(x + lineLen, y + height)
							lines[6].From = Vector2.new(x, y + height)
							lines[6].To = Vector2.new(x, y + height - lineLen)

							lines[7].From = Vector2.new(x + width, y + height)
							lines[7].To = Vector2.new(x + width - lineLen, y + height)
							lines[8].From = Vector2.new(x + width, y + height)
							lines[8].To = Vector2.new(x + width, y + height - lineLen)

							for _, l in ipairs(lines) do
								l.Visible = true
							end
							espObjects[playerKey].FullBox.Visible = false
						elseif selectedBoxStyle == "Full Box" then
							for _, l in ipairs(espObjects[playerKey].Lines) do
								l.Visible = false
							end
							local fb = espObjects[playerKey].FullBox
							fb.Position = Vector2.new(x, y)
							fb.Size = Vector2.new(width, height)
							fb.Visible = true
						else
							for _, l in ipairs(espObjects[playerKey].Lines) do
								l.Visible = false
							end
							espObjects[playerKey].FullBox.Visible = false
						end

						if toggles.Name then
							espObjects[playerKey].NameText.Text = data.Name
							espObjects[playerKey].NameText.Position = Vector2.new(headScreen.X, y - 16)
							espObjects[playerKey].NameText.Visible = true
						else
							espObjects[playerKey].NameText.Visible = false
						end

						local bottomOffset = y + height + 2
						if toggles.Distance then
							local distVal = math.floor((rootPos - Camera.CFrame.Position).Magnitude)
							espObjects[playerKey].DistText.Text = tostring(distVal) .. "m"
							espObjects[playerKey].DistText.Position = Vector2.new(headScreen.X, bottomOffset)
							espObjects[playerKey].DistText.Visible = true
						else
							espObjects[playerKey].DistText.Visible = false
						end
					else
						for _, l in ipairs(espObjects[playerKey].Lines) do
							l.Visible = false
						end
						espObjects[playerKey].FullBox.Visible = false
						espObjects[playerKey].NameText.Visible = false
						espObjects[playerKey].DistText.Visible = false
					end

					if toggles.OffScreenArrows and not rootOnScreen then
						local screenPos, onScreen = Camera:WorldToViewportPoint(rootPos)
						local diff = Vector2.new(screenPos.X, screenPos.Y) - mouseCenter
						if screenPos.Z < 0 then
							diff = -diff
						end
						local angle = math.atan2(diff.Y, diff.X)
						local radius = 180
						local arrowPos = mouseCenter + Vector2.new(math.cos(angle), math.sin(angle)) * radius
						
						local arrow = espObjects[playerKey].OffScreenArrow
						local size = 7
						local p1 = arrowPos + Vector2.new(size * 1.5, 0)
						local p2 = arrowPos + Vector2.new(-size, size)
						local p3 = arrowPos + Vector2.new(-size, -size)
						
						arrow.PointA = rotatePoint(p1, arrowPos, angle)
						arrow.PointB = rotatePoint(p2, arrowPos, angle)
						arrow.PointC = rotatePoint(p3, arrowPos, angle)
						
						if aimbotSettings.WallCheck then
							if checkWallVisibility(targetPosWorld, model) then
								arrow.Color = Color3.fromRGB(0, 255, 0)
							else
								arrow.Color = Color3.fromRGB(255, 0, 0)
							end
						else
							arrow.Color = Color3.fromRGB(255, 50, 50)
						end
						
						arrow.Visible = true

						local distVal = math.floor((rootPos - Camera.CFrame.Position).Magnitude)
						local distTextObj = espObjects[playerKey].OffScreenDistText
						distTextObj.Text = tostring(distVal) .. "m"
						distTextObj.Position = arrowPos + Vector2.new(0, 12)
						distTextObj.Visible = true
					else
						espObjects[playerKey].OffScreenArrow.Visible = false
						espObjects[playerKey].OffScreenDistText.Visible = false
					end

					if radarSettings.Enabled then
						local camCF = Camera.CFrame
						local playerPos = rootPos
						local relPos = camCF:PointToObjectSpace(playerPos)
						local radarRange = radarSettings.Range
						
						local distance2D = Vector2.new(relPos.X, relPos.Z)
						if distance2D.Magnitude < radarRange then
							local drawX = radarCenter.X + (relPos.X / radarRange) * radarSize
							local drawY = radarCenter.Y + (relPos.Z / radarRange) * radarSize
							
							local dot = espObjects[playerKey].RadarDot
							dot.Position = Vector2.new(drawX, drawY)
							
							if aimbotSettings.WallCheck then
								if checkWallVisibility(targetPosWorld, model) then
									dot.Color = Color3.fromRGB(0, 255, 0)
								else
									dot.Color = Color3.fromRGB(255, 0, 0)
								end
							else
								dot.Color = Color3.fromRGB(255, 50, 50)
							end
							
							dot.Visible = true
						else
							espObjects[playerKey].RadarDot.Visible = false
						end
					else
						espObjects[playerKey].RadarDot.Visible = false
					end

					if toggles.Tracer and headOnScreen then
						local tracer = espObjects[playerKey].Tracer
						tracer.From = Vector2.new(Camera.ViewportSize.X / 2, 0)
						tracer.To = Vector2.new(headScreen.X, headScreen.Y)
						
						if aimbotSettings.WallCheck then
							if checkWallVisibility(targetPosWorld, model) then
								tracer.Color = Color3.fromRGB(0, 255, 0)
							else
								tracer.Color = Color3.fromRGB(255, 0, 0)
							end
						else
							tracer.Color = Color3.fromRGB(255, 255, 255)
						end
						
						tracer.Visible = true
					else
						espObjects[playerKey].Tracer.Visible = false
					end
				end
			end
		end

		for playerKey, obj in pairs(espObjects) do
			local found = false
			for _, data in ipairs(targetList) do
				if data.Key == playerKey then
					found = true
					break
				end
			end
			if not found then
				if obj.Highlight then obj.Highlight:Destroy() end
				if obj.Lines then for _, l in pairs(obj.Lines) do l:Remove() end end
				if obj.FullBox then obj.FullBox:Remove() end
				if obj.Tracer then obj.Tracer:Remove() end
				if obj.NameText then obj.NameText:Remove() end
				if obj.DistText then obj.DistText:Remove() end
				if obj.RadarDot then obj.RadarDot:Remove() end
				if obj.OffScreenArrow then obj.OffScreenArrow:Remove() end
				if obj.OffScreenDistText then obj.OffScreenDistText:Remove() end
				espObjects[playerKey] = nil
			end
		end

		espCountText.Text = "ESP Count: " .. tostring(activeEspCount)
		espCountText.Position = Vector2.new(Camera.ViewportSize.X / 2, 15)
		espCountText.Visible = true

		if aimbotSettings.Enabled and aimbotSettings.AimLine then
			if closestPlayerPart then
				aimLine.From = mouseCenter
				aimLine.To = closestPlayerPart
				aimLine.Visible = true
			else
				aimLine.From = mouseCenter
				aimLine.To = UserInputService:GetMouseLocation()
				aimLine.Visible = true
			end
		else
			aimLine.Visible = false
		end

		if aimbotSettings.Enabled and canAim and closestPlayerPart then
			if aimbotSettings.AimMethod == "MouseMovement" and mousemoverel then
				local moveDelta = (closestPlayerPart - mouseCenter) / aimbotSettings.Smoothness
				mousemoverel(math.round(moveDelta.X), math.round(moveDelta.Y))
			end

			if aimbotSettings.AutoFire and mouse1click then
				if tick() - lastAutoFireTick >= 0.15 then
					lastAutoFireTick = tick()
					pcall(function()
						mouse1click()
					end)
				end
			end
		end
	end)
end))

SettingsTab:Button({
	Label = "Unload Script",
	Callback = function()
		for _, conn in ipairs(connections) do
			conn:Disconnect()
		end

		pcall(function() fovCircle:Remove() end)
		pcall(function() aimLine:Remove() end)
		pcall(function() crosshairH:Remove() end)
		pcall(function() crosshairV:Remove() end)
		pcall(function() espCountText:Remove() end)
		pcall(function() watermarkGui:Destroy() end)
		pcall(function() radarBg:Remove() end)
		pcall(function() radarOutline:Remove() end)
		pcall(function() radarCrossH:Remove() end)
		pcall(function() radarCrossV:Remove() end)

		for player, obj in pairs(espObjects) do
			if obj.Highlight then obj.Highlight:Destroy() end
			if obj.Lines then for _, l in pairs(obj.Lines) do l:Remove() end end
			if obj.FullBox then obj.FullBox:Remove() end
			if obj.Tracer then obj.Tracer:Remove() end
			if obj.NameText then obj.NameText:Remove() end
			if obj.DistText then obj.DistText:Remove() end
			if obj.RadarDot then obj.RadarDot:Remove() end
			if obj.OffScreenArrow then obj.OffScreenArrow:Remove() end
			if obj.OffScreenDistText then obj.OffScreenDistText:Remove() end
		end

		pcall(function()
			Window:Close()
		end)
	end
})
