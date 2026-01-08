-- Cart Ride TP'sher made by 3dsj2

if not game:IsLoaded() then
    game.Loaded:Wait()
end

game.StarterGui:SetCore("SendNotification", {Title = "Cart Ride TP", Text = "Made by 3dsj2", Duration = 2})

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local guiName = "cartridess"
local windowTitle = "Cart Ride Funcs"
local spawnCFrame = CFrame.new(44, 0.049999997, -76, 1, 0, 0, 0, 1, 0, 0, 0, 1)
local endCFrame = CFrame.new(310.683014, 849.75, 332.389221, 1, 0, 0, 0, 1, 0, 0, 0, 1)

if LocalPlayer.PlayerGui:FindFirstChild(guiName) then
    LocalPlayer.PlayerGui:FindFirstChild(guiName):Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = guiName
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer.PlayerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 350, 0, 200)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
mainFrame.BorderSizePixel = 1
mainFrame.Active = true
mainFrame.Draggable = true

local mainFrameCorner = Instance.new("UICorner")
mainFrameCorner.CornerRadius = UDim.new(0, 8)
mainFrameCorner.Parent = mainFrame

local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.Parent = mainFrame
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://10389868777"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.7
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(20, 20, 280, 280)
shadow.ZIndex = -1
shadow.Size = UDim2.new(1, 12, 1, 12)
shadow.Position = UDim2.new(0, -6, 0, -6)

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Parent = mainFrame
titleBar.Size = UDim2.new(1, 0, 0, 35)
titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
titleBar.BorderSizePixel = 0

local titleBarCorner = Instance.new("UICorner")
titleBarCorner.CornerRadius = UDim.new(0, 8)
titleBarCorner.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Parent = titleBar
titleLabel.Size = UDim2.new(1, -100, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.SourceSans
titleLabel.Text = windowTitle
titleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
titleLabel.TextSize = 16
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Parent = titleBar
closeButton.Size = UDim2.new(0, 35, 0, 35)
closeButton.Position = UDim2.new(1, -35, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
closeButton.BackgroundTransparency = 1
closeButton.Font = Enum.Font.SourceSans
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(220, 220, 220)
closeButton.TextSize = 18

local foldButton = Instance.new("TextButton")
foldButton.Name = "FoldButton"
foldButton.Parent = titleBar
foldButton.Size = UDim2.new(0, 35, 0, 35)
foldButton.Position = UDim2.new(1, -70, 0, 0)
foldButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
foldButton.BackgroundTransparency = 1
foldButton.Font = Enum.Font.SourceSans
foldButton.Text = "_"
foldButton.TextColor3 = Color3.fromRGB(220, 220, 220)
foldButton.TextSize = 22

local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Parent = mainFrame
contentFrame.Size = UDim2.new(1, 0, 1, -35)
contentFrame.Position = UDim2.new(0, 0, 0, 35)
contentFrame.BackgroundTransparency = 1
contentFrame.BorderSizePixel = 0

local contentPadding = Instance.new("UIPadding")
contentPadding.PaddingTop = UDim.new(0, 10)
contentPadding.PaddingLeft = UDim.new(0, 10)
contentPadding.PaddingRight = UDim.new(0, 10)
contentPadding.PaddingBottom = UDim.new(0, 10)
contentPadding.Parent = contentFrame

local contentLayout = Instance.new("UIListLayout")
contentLayout.FillDirection = Enum.FillDirection.Vertical
contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
contentLayout.Padding = UDim.new(0, 10)
contentLayout.Parent = contentFrame

local spawnButton = Instance.new("TextButton")
spawnButton.Name = "SpawnButton"
spawnButton.Parent = contentFrame
spawnButton.Size = UDim2.new(1, 0, 0, 40)
spawnButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
spawnButton.Font = Enum.Font.SourceSansSemibold
spawnButton.Text = "Teleport to Spawn"
spawnButton.TextColor3 = Color3.fromRGB(240, 240, 240)
spawnButton.TextSize = 16

local spawnButtonCorner = Instance.new("UICorner")
spawnButtonCorner.CornerRadius = UDim.new(0, 6)
spawnButtonCorner.Parent = spawnButton

local spawnButtonStroke = Instance.new("UIStroke")
spawnButtonStroke.Color = Color3.fromRGB(80, 80, 80)
spawnButtonStroke.Thickness = 1
spawnButtonStroke.Parent = spawnButton

local endButton = Instance.new("TextButton")
endButton.Name = "EndButton"
endButton.Parent = contentFrame
endButton.Size = UDim2.new(1, 0, 0, 40)
endButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
endButton.Font = Enum.Font.SourceSansSemibold
endButton.Text = "Teleport to End"
endButton.TextColor3 = Color3.fromRGB(240, 240, 240)
endButton.TextSize = 16

local endButtonCorner = Instance.new("UICorner")
endButtonCorner.CornerRadius = UDim.new(0, 6)
endButtonCorner.Parent = endButton

local endButtonStroke = Instance.new("UIStroke")
endButtonStroke.Color = Color3.fromRGB(80, 80, 80)
endButtonStroke.Thickness = 1
endButtonStroke.Parent = endButton

local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragStart
local startPos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        if dragging then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end
end)

local function onHover(button)
    local originalColor = button.BackgroundColor3
    local hoverColor = originalColor:Lerp(Color3.new(1,1,1), 0.1)
    
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = originalColor}):Play()
    end)
end

onHover(spawnButton)
onHover(endButton)

local closeHoverColor = Color3.fromRGB(232, 17, 35)
closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {BackgroundColor3 = closeHoverColor, BackgroundTransparency = 0}):Play()
end)
closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.2), {BackgroundColor3 = titleBar.BackgroundColor3, BackgroundTransparency = 1}):Play()
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local isFolded = false
foldButton.MouseButton1Click:Connect(function()
    isFolded = not isFolded
    contentFrame.Visible = not isFolded
    shadow.Visible = not isFolded
    
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    if isFolded then
        TweenService:Create(mainFrame, tweenInfo, {Size = UDim2.new(0, 350, 0, 35)}):Play()
        foldButton.Text = "🗖"
    else
        TweenService:Create(mainFrame, tweenInfo, {Size = UDim2.new(0, 350, 0, 200)}):Play()
        foldButton.Text = "_"
    end
end)

local function teleportPlayer(targetCFrame)
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = targetCFrame
    else
        warn("Character or HumanoidRootPart not found!")
    end
end

spawnButton.MouseButton1Click:Connect(function()
    teleportPlayer(spawnCFrame)
end)

endButton.MouseButton1Click:Connect(function()
    teleportPlayer(endCFrame)
end)
