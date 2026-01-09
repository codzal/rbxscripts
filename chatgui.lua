local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local ChatChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local gui = Instance.new("ScreenGui")
gui.Name = "ChatUI"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 260, 0, 118)
frame.Position = UDim2.new(1, -270, 1, -180)
frame.BackgroundColor3 = Color3.fromRGB(26, 26, 28)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 26)
topBar.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
topBar.BorderSizePixel = 0
topBar.Parent = frame
Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 6)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 8, 0, 0)
title.Text = "Chat GUI"
title.TextSize = 13
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

task.spawn(function()
	while title and title.Parent do
		local h = tick() * 0.5 % 1
		title.TextColor3 = Color3.fromHSV(h, 0.7, 0.9):Lerp(Color3.fromRGB(30, 30, 30), 0.3)
		RunService.RenderStepped:Wait()
	end
end)

local fold = Instance.new("TextButton")
fold.Size = UDim2.new(0, 26, 1, 0)
fold.Position = UDim2.new(1, -52, 0, 0)
fold.BackgroundTransparency = 1
fold.Text = "🔵"
fold.TextSize = 14
fold.Font = Enum.Font.Gotham
fold.TextColor3 = Color3.fromRGB(100, 180, 255)
fold.Parent = topBar

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 26, 1, 0)
close.Position = UDim2.new(1, -26, 0, 0)
close.BackgroundTransparency = 1
close.Text = "🔴"
close.TextSize = 14
close.Font = Enum.Font.Gotham
close.TextColor3 = Color3.fromRGB(255, 100, 100)
close.Parent = topBar

local input = Instance.new("TextBox")
input.Size = UDim2.new(1, -132, 0, 24)
input.Position = UDim2.new(0, 8, 0, 28)
input.PlaceholderText = "Type..."
input.Text = ""
input.TextSize = 13
input.Font = Enum.Font.Gotham
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.PlaceholderColor3 = Color3.fromRGB(140, 140, 140)
input.BackgroundColor3 = Color3.fromRGB(34, 34, 36)
input.BorderSizePixel = 0
input.ClearTextOnFocus = false
input.Parent = frame
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 5)

local clear = Instance.new("TextButton")
clear.Size = UDim2.new(0, 60, 0, 24)
clear.Position = UDim2.new(1, -68, 0, 28)
clear.Text = "Clear"
clear.TextSize = 13
clear.Font = Enum.Font.Gotham
clear.TextColor3 = Color3.fromRGB(230, 230, 230)
clear.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
clear.BorderSizePixel = 0
clear.Parent = frame
Instance.new("UICorner", clear).CornerRadius = UDim.new(0, 5)

local send = Instance.new("TextButton")
send.Size = UDim2.new(0, 60, 0, 24)
send.Position = UDim2.new(1, -136, 0, 28)
send.Text = "Send"
send.TextSize = 13
send.Font = Enum.Font.GothamMedium
send.TextColor3 = Color3.fromRGB(255, 255, 255)
send.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
send.BorderSizePixel = 0
send.Parent = frame
Instance.new("UICorner", send).CornerRadius = UDim.new(0, 5)

local spam = Instance.new("TextButton")
spam.Size = UDim2.new(0, 120, 0, 24)
spam.Position = UDim2.new(0, 8, 0, 58)
spam.Text = "Start Spam"
spam.TextSize = 13
spam.Font = Enum.Font.GothamBold
spam.TextColor3 = Color3.fromRGB(40, 220, 40)
spam.BackgroundColor3 = Color3.fromRGB(20, 80, 20)
spam.BorderSizePixel = 0
spam.Parent = frame
Instance.new("UICorner", spam).CornerRadius = UDim.new(0, 6)

local delayInput = Instance.new("TextBox")
delayInput.Size = UDim2.new(0, 120, 0, 24)
delayInput.Position = UDim2.new(0, 136, 0, 58)
delayInput.PlaceholderText = "Delay (seconds)"
delayInput.Text = "1"
delayInput.TextSize = 13
delayInput.Font = Enum.Font.Gotham
delayInput.TextColor3 = Color3.fromRGB(255, 255, 255)
delayInput.PlaceholderColor3 = Color3.fromRGB(140, 140, 140)
delayInput.BackgroundColor3 = Color3.fromRGB(34, 34, 36)
delayInput.BorderSizePixel = 0
delayInput.ClearTextOnFocus = false
delayInput.Parent = frame
Instance.new("UICorner", delayInput).CornerRadius = UDim.new(0, 5)

local credit = Instance.new("TextLabel")
credit.Size = UDim2.new(1, -8, 0, 18)
credit.Position = UDim2.new(0, 4, 0, 86)
credit.Text = "Made by 3dsj2"
credit.TextSize = 12
credit.Font = Enum.Font.Gotham
credit.TextColor3 = Color3.fromRGB(200, 200, 200)
credit.BackgroundTransparency = 1
credit.Parent = frame

local folded = false
local spamming = false
local spamTask

fold.MouseButton1Click:Connect(function()
	folded = not folded
	if folded then
		frame.Size = UDim2.new(0, 260, 0, 26)
		input.Visible = false
		send.Visible = false
		clear.Visible = false
		spam.Visible = false
		delayInput.Visible = false
		credit.Visible = false
	else
		frame.Size = UDim2.new(0, 260, 0, 118)
		input.Visible = true
		send.Visible = true
		clear.Visible = true
		spam.Visible = true
		delayInput.Visible = true
		credit.Visible = true
	end
end)

close.MouseButton1Click:Connect(function()
	spamming = false
	gui:Destroy()
end)

send.MouseButton1Click:Connect(function()
	local msg = input.Text
	ChatChannel:SendAsync(msg)
end)

clear.MouseButton1Click:Connect(function()
	input.Text = ""
end)

spam.MouseButton1Click:Connect(function()
	if not spamming then
		local delay = tonumber(delayInput.Text)
		if not delay or delay <= 0 then delay = 1 end
		spamming = true
		spam.Text = "Stop Spam"
		spam.TextColor3 = Color3.fromRGB(220, 40, 40)
		spam.BackgroundColor3 = Color3.fromRGB(80, 20, 20)

		spamTask = task.spawn(function()
			while spamming and gui and gui.Parent do
				local msg = input.Text
				if msg ~= "" then
					ChatChannel:SendAsync(msg)
				end
				task.wait(delay)
			end
		end)
	else
		spamming = false
		spam.Text = "Start Spam"
		spam.TextColor3 = Color3.fromRGB(40, 220, 40)
		spam.BackgroundColor3 = Color3.fromRGB(20, 80, 20)
	end
end)
