local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local LocalPlayer = Players.LocalPlayer
local ChatChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local function hasBanHammer(player)
	local backpack = player:FindFirstChild("Backpack")
	local character = player.Character
	return (backpack and backpack:FindFirstChild("BanHammer"))
		or (character and character:FindFirstChild("BanHammer"))
end

local function report(message)
	ChatChannel:SendAsync(message)
	print(message)
end

local found = false

for _, player in ipairs(Players:GetPlayers()) do
	if player ~= LocalPlayer and hasBanHammer(player) then
		local message = string.format("%s (@%s) have ban hammer", player.DisplayName, player.Name)
		report(message)
		found = true
		wait(0.2)
	end
end

if not found then
	report("No one have ban hammer")
end
