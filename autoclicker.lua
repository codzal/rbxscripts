-- Auto clickdetector clicker made by 3dsj2

if not game:IsLoaded() then
    game.Loaded:Wait()
end

game.StarterGui:SetCore("SendNotification", {Title = "Auto Clicker", Text = "Made by 3dsj2", Duration = 2})

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local isEnabled = false
local clickDelay = 0.5
local mainLoopThread = nil

local screenGui = gethui()

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 200, 0, 130)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -65)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
mainFrame.BorderColor3 = Color3.fromRGB(85, 85, 125)
mainFrame.BorderSizePixel = 2
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(1, 0, 0, 25)
titleLabel.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
titleLabel.BorderColor3 = Color3.fromRGB(85, 85, 125)
titleLabel.BorderSizePixel = 2
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Text = "Auto Clicker"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 16
titleLabel.Parent = mainFrame

local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 180, 0, 25)
toggleButton.Position = UDim2.new(0.5, -90, 0, 35)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
toggleButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 16
toggleButton.Text = "Toggle (Disabled)"
toggleButton.Parent = mainFrame

local delayInput = Instance.new("TextBox")
delayInput.Name = "DelayInput"
delayInput.Size = UDim2.new(0, 180, 0, 25)
delayInput.Position = UDim2.new(0.5, -90, 0, 65)
delayInput.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
delayInput.BorderColor3 = Color3.fromRGB(255, 255, 255)
delayInput.TextColor3 = Color3.fromRGB(255, 255, 255)
delayInput.Text = tostring(clickDelay)
delayInput.Font = Enum.Font.SourceSans
delayInput.TextSize = 14
delayInput.ClearTextOnFocus = false
delayInput.Parent = mainFrame

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 180, 0, 25)
closeButton.Position = UDim2.new(0.5, -90, 0, 95)
closeButton.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
closeButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 16
closeButton.Text = "Close & Disable"
closeButton.Parent = mainFrame

local function autoClickLoop()
    while isEnabled do
        pcall(function()
            for _, descendant in ipairs(workspace:GetDescendants()) do
                if not isEnabled then break end
                if descendant:IsA("ClickDetector") then
                    fireclickdetector(descendant)
                    task.wait(clickDelay)
                end
            end
        end)
        task.wait(1) 
    end
end

local function stopLoop()
    isEnabled = false
    if mainLoopThread then
        task.cancel(mainLoopThread)
        mainLoopThread = nil
    end
    toggleButton.Text = "Toggle (Disabled)"
    toggleButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
end

local function startLoop()
    isEnabled = true
    toggleButton.Text = "Toggle (Enabled)"
    toggleButton.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
    mainLoopThread = task.spawn(autoClickLoop)
end

toggleButton.MouseButton1Click:Connect(function()
    if isEnabled then
        stopLoop()
    else
        startLoop()
    end
end)

closeButton.MouseButton1Click:Connect(function()
    stopLoop()
    mainFrame:Destroy()
end)

delayInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local newDelay = tonumber(delayInput.Text)
        if newDelay and newDelay >= 0 then
            clickDelay = newDelay
        end
    end
    delayInput.Text = tostring(clickDelay)
end)
