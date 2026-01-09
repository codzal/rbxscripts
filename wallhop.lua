local plr = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 150, 0, 80)
frame.Position = UDim2.new(0.5, -75, 0.5, -40)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
frame.Active = true
frame.Draggable = true
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -50, 0, 16)
title.Position = UDim2.new(0, 10, 0, 4)
title.Text = "WallHop V3"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextScaled = true

local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 18, 0, 18)
closeBtn.Position = UDim2.new(1, -22, 0, 4)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.TextScaled = true
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

local foldBtn = Instance.new("TextButton", frame)
foldBtn.Size = UDim2.new(0, 18, 0, 18)
foldBtn.Position = UDim2.new(1, -44, 0, 4)
foldBtn.Text = "-"
foldBtn.Font = Enum.Font.GothamBold
foldBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
foldBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
foldBtn.TextScaled = true
Instance.new("UICorner", foldBtn).CornerRadius = UDim.new(0, 6)

local toggleButton = Instance.new("TextButton", frame)
toggleButton.Size = UDim2.new(0, 80, 0, 22)
toggleButton.Position = UDim2.new(0.5, -40, 0, 24)
toggleButton.Text = "Enable"
toggleButton.Font = Enum.Font.Gotham
toggleButton.BackgroundColor3 = Color3.fromRGB(60, 180, 90)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextScaled = true
Instance.new("UICorner", toggleButton).CornerRadius = UDim.new(0, 6)

local statusLabel = Instance.new("TextLabel", frame)
statusLabel.Size = UDim2.new(1, 0, 0, 14)
statusLabel.Position = UDim2.new(0, 0, 1, -30)
statusLabel.Text = "Status: Off"
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextColor3 = Color3.fromRGB(255, 90, 90)
statusLabel.BackgroundTransparency = 1
statusLabel.TextScaled = true

local madeBy = Instance.new("TextLabel", frame)
madeBy.Size = UDim2.new(1, 0, 0, 13)
madeBy.Position = UDim2.new(0, 0, 1, -16)
madeBy.Text = "Made by 3dsj2"
madeBy.Font = Enum.Font.Gotham
madeBy.TextColor3 = Color3.fromRGB(200, 200, 200)
madeBy.BackgroundTransparency = 1
madeBy.TextScaled = true

local folded = false
foldBtn.MouseButton1Click:Connect(function()
    folded = not folded
    toggleButton.Visible = not folded
    statusLabel.Visible = not folded
    madeBy.Visible = not folded
    frame.Size = folded and UDim2.new(0, 150, 0, 28) or UDim2.new(0, 150, 0, 80)
    foldBtn.Text = folded and "+" or "-"
end)

local enabled, debounce = false, true
toggleButton.MouseButton1Click:Connect(function()
    enabled = not enabled
    toggleButton.Text = enabled and "Disable" or "Enable"
    toggleButton.BackgroundColor3 = enabled and Color3.fromRGB(200, 60, 60) or Color3.fromRGB(60, 180, 90)
    statusLabel.Text = "Status: " .. (enabled and "On" or "Off")
    statusLabel.TextColor3 = enabled and Color3.fromRGB(90, 255, 90) or Color3.fromRGB(255, 90, 90)
end)

closeBtn.MouseButton1Click:Connect(function()
    enabled = false
    gui.Enabled = false
end)

local uis = game:GetService("UserInputService")
local ws = workspace
local rs = game:GetService("RunService")

local function getWall()
    local char = plr.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = {char}
    local dirs = {
        hrp.CFrame.LookVector,
        -hrp.CFrame.LookVector,
        hrp.CFrame.RightVector,
        -hrp.CFrame.RightVector
    }
    local closest, minDist = nil, 3
    for _, dir in ipairs(dirs) do
        local ray = ws:Raycast(hrp.Position, dir * 2, params)
        if ray and ray.Distance < minDist then
            closest = ray
            minDist = ray.Distance
        end
    end
    return closest
end

uis.JumpRequest:Connect(function()
    if not enabled or not debounce then return end
    local char = plr.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local cam = ws.CurrentCamera
    if not (hum and root and cam) then return end
    local wall = getWall()
    if not wall then return end
    debounce = false
    local n = wall.Normal
    local dir = Vector3.new(n.X, 0, n.Z).Unit
    if dir.Magnitude < 0.1 then dir = (root.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit end
    if dir.Magnitude < 0.1 then dir = Vector3.new(0, 0, -1) end
    local camDir = Vector3.new(cam.CFrame.LookVector.X, 0, cam.CFrame.LookVector.Z).Unit
    if camDir.Magnitude < 0.1 then camDir = dir end
    local dot = math.clamp(dir:Dot(camDir), -1, 1)
    local ang = math.acos(dot)
    local cross = dir:Cross(camDir)
    local sign = math.sign(cross.Y)
    if sign == 0 then ang = 0 end
    local finalDir = (CFrame.Angles(0, math.min(ang, math.rad(40)) * sign, 0) * dir)
    root.CFrame = CFrame.lookAt(root.Position, root.Position + finalDir)
    rs.Heartbeat:Wait()
    hum:ChangeState(Enum.HumanoidStateType.Jumping)
    root.CFrame = CFrame.lookAt(root.Position, root.Position - dir)
    task.wait(0.15)
    debounce = true
end)
