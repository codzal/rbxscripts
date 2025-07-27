local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CollectionService = game:GetService("CollectionService")
local LocalPlayer = Players.LocalPlayer

local hue = 0
local rainbowEnabled = false
local folded = false

local TITLE_H = 24
local SPEED_H = 22
local BRIGHT_H = 22
local TOGGLE_H = 22
local CREDIT_H = 18

local totalHeight = TITLE_H + SPEED_H + BRIGHT_H + TOGGLE_H + CREDIT_H

local gui = Instance.new("ScreenGui")
gui.Name = "7hvHtD4s"
gui.ResetOnSpawn = false
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 240, 0, totalHeight)
mainFrame.Position = UDim2.new(0.5, -120, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ClipsDescendants = true
mainFrame.Parent = gui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel")
title.Text = "TOH Rainbow kill parts"
title.Size = UDim2.new(1, -64, 0, TITLE_H)
title.Position = UDim2.new(0, 8, 0, 0)
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainFrame

local foldBtn = Instance.new("TextButton")
foldBtn.Text = "-"
foldBtn.Size = UDim2.new(0, 24, 0, TITLE_H)
foldBtn.Position = UDim2.new(1, -56, 0, 0)
foldBtn.TextColor3 = Color3.new(1, 1, 1)
foldBtn.BackgroundTransparency = 1
foldBtn.Font = Enum.Font.GothamBold
foldBtn.TextSize = 18
foldBtn.Parent = mainFrame

local closeBtn = Instance.new("TextButton")
closeBtn.Text = "X"
closeBtn.Size = UDim2.new(0, 24, 0, TITLE_H)
closeBtn.Position = UDim2.new(1, -28, 0, 0)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.Parent = mainFrame
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 4)

local speedBox = Instance.new("TextBox")
speedBox.PlaceholderText = "Speed (default 0.08)"
speedBox.Text = "0.08"
speedBox.Size = UDim2.new(1, -16, 0, SPEED_H)
speedBox.Position = UDim2.new(0, 8, 0, TITLE_H)
speedBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
speedBox.TextColor3 = Color3.new(1, 1, 1)
speedBox.Font = Enum.Font.Gotham
speedBox.TextSize = 14
speedBox.ClearTextOnFocus = false
speedBox.Parent = mainFrame
Instance.new("UICorner", speedBox).CornerRadius = UDim.new(0, 4)

local brightnessBox = Instance.new("TextBox")
brightnessBox.PlaceholderText = "Brightness (default 1)"
brightnessBox.Text = "1"
brightnessBox.Size = UDim2.new(1, -16, 0, BRIGHT_H)
brightnessBox.Position = UDim2.new(0, 8, 0, TITLE_H + SPEED_H)
brightnessBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
brightnessBox.TextColor3 = Color3.new(1, 1, 1)
brightnessBox.Font = Enum.Font.Gotham
brightnessBox.TextSize = 14
brightnessBox.ClearTextOnFocus = false
brightnessBox.Parent = mainFrame
Instance.new("UICorner", brightnessBox).CornerRadius = UDim.new(0, 4)

local toggleBtn = Instance.new("TextButton")
toggleBtn.Text = "Enable Rainbow"
toggleBtn.Size = UDim2.new(1, -16, 0, TOGGLE_H)
toggleBtn.Position = UDim2.new(0, 8, 0, TITLE_H + SPEED_H + BRIGHT_H)
toggleBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 14
toggleBtn.Parent = mainFrame
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 4)

local credit = Instance.new("TextLabel")
credit.Text = "Made by 3dsj2"
credit.Size = UDim2.new(1, -16, 0, CREDIT_H)
credit.Position = UDim2.new(0, 8, 0, TITLE_H + SPEED_H + BRIGHT_H + TOGGLE_H)
credit.TextColor3 = Color3.fromRGB(160, 160, 160)
credit.BackgroundTransparency = 1
credit.Font = Enum.Font.Gotham
credit.TextSize = 12
credit.TextXAlignment = Enum.TextXAlignment.Left
credit.Parent = mainFrame

local speedValue = 0.08
local brightnessValue = 1
local rainbowActive = false

toggleBtn.MouseButton1Click:Connect(function()
	rainbowActive = not rainbowActive
	toggleBtn.Text = rainbowActive and "Disable Rainbow" or "Enable Rainbow"
end)

speedBox.FocusLost:Connect(function()
	local val = tonumber(speedBox.Text)
	if val then
		speedValue = val
	end
end)

brightnessBox.FocusLost:Connect(function()
	local val = tonumber(brightnessBox.Text)
	if val then
		brightnessValue = val
	end
end)

closeBtn.MouseButton1Click:Connect(function()
	rainbowActive = false
	gui:Destroy()
end)

foldBtn.MouseButton1Click:Connect(function()
	folded = not folded
	if folded then
		mainFrame:TweenSize(UDim2.new(0, 240, 0, TITLE_H), "Out", "Quart", 0.25, true)
		foldBtn.Text = "+"
	else
		mainFrame:TweenSize(UDim2.new(0, 240, 0, totalHeight), "Out", "Quart", 0.25, true)
		foldBtn.Text = "-"
	end
	speedBox.Visible = not folded
	brightnessBox.Visible = not folded
	toggleBtn.Visible = not folded
	credit.Visible = not folded
end)

RunService.RenderStepped:Connect(function(dt)
	if not rainbowActive then return end
	hue = (hue + dt * speedValue) % 1
	local color = Color3.fromHSV(hue, 1, brightnessValue)
	for _, part in pairs(CollectionService:GetTagged("KillBrick")) do
		if part:IsA("BasePart") then
			part.Color = color
		end
	end
end)
