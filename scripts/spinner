-- Admin GUI System for YOUR OWN GAME
-- Place this in StarterPlayerScripts or StarterGui

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AdminGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 600)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -300)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "⭐ Universal Admin Panel"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = TitleBar

-- Tab System
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(0, 150, 1, -80)
TabFrame.Position = UDim2.new(0, 0, 0, 40)
TabFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
TabFrame.BorderSizePixel = 0
TabFrame.Parent = MainFrame

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -150, 1, -40)
ContentFrame.Position = UDim2.new(0, 150, 0, 40)
ContentFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
ContentFrame.BorderSizePixel = 0
ContentFrame.Parent = MainFrame

-- Notification System
local NotificationFrame = Instance.new("Frame")
NotificationFrame.Size = UDim2.new(0, 300, 0, 50)
NotificationFrame.Position = UDim2.new(1, -310, 0, 10)
NotificationFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
NotificationFrame.BorderSizePixel = 0
NotificationFrame.BackgroundTransparency = 1
NotificationFrame.Parent = ScreenGui

local function Notify(message, color)
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(1, 0, 0, 40)
    notif.Position = UDim2.new(0, 0, 0, 0)
    notif.BackgroundColor3 = color or Color3.fromRGB(50, 200, 50)
    notif.BorderSizePixel = 0
    notif.Parent = NotificationFrame
    
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, -10, 1, 0)
    text.Position = UDim2.new(0, 5, 0, 0)
    text.BackgroundTransparency = 1
    text.Text = message
    text.TextColor3 = Color3.fromRGB(255, 255, 255)
    text.TextSize = 14
    text.Font = Enum.Font.Gotham
    text.TextXAlignment = Enum.TextXAlignment.Left
    text.Parent = notif
    
    local tween = TweenService:Create(notif, TweenInfo.new(0.5), {BackgroundTransparency = 0})
    tween:Play()
    
    wait(2)
    local tweenOut = TweenService:Create(notif, TweenInfo.new(0.5), {BackgroundTransparency = 1, Position = UDim2.new(0, 0, 0, -50)})
    tweenOut:Play()
    tweenOut.Completed:Wait()
    notif:Destroy()
end

-- ESP System (Highlights players)
local ESPEnabled = false
local ESPConnections = {}

local function ToggleESP(enabled)
    ESPEnabled = enabled
    if enabled then
        local function AddESP(player)
            if player == LocalPlayer then return end
            
            local function SetupESP(character)
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.Parent = character
                
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "ESP_Label"
                billboard.Size = UDim2.new(0, 100, 0, 30)
                billboard.StudsOffset = Vector3.new(0, 3, 0)
                billboard.AlwaysOnTop = true
                billboard.Parent = character:WaitForChild("Head")
                
                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 1, 0)
                label.BackgroundTransparency = 0.7
                label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                label.Text = player.Name
                label.TextColor3 = Color3.fromRGB(255, 255, 255)
                label.TextSize = 12
                label.Font = Enum.Font.GothamBold
                label.Parent = billboard
            end
            
            if player.Character then
                SetupESP(player.Character)
            end
            
            local charConn = player.CharacterAdded:Connect(SetupESP)
            table.insert(ESPConnections, charConn)
        end
        
        for _, player in pairs(Players:GetPlayers()) do
            AddESP(player)
        end
        
        local playerAdded = Players.PlayerAdded:Connect(AddESP)
        table.insert(ESPConnections, playerAdded)
        
        Notify("ESP Enabled", Color3.fromRGB(50, 200, 50))
    else
        for _, conn in pairs(ESPConnections) do
            conn:Disconnect()
        end
        ESPConnections = {}
        
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then
                local highlight = player.Character:FindFirstChild("ESP_Highlight")
                if highlight then highlight:Destroy() end
                local head = player.Character:FindFirstChild("Head")
                if head then
                    local billboard = head:FindFirstChild("ESP_Label")
                    if billboard then billboard:Destroy() end
                end
            end
        end
        
        Notify("ESP Disabled", Color3.fromRGB(200, 50, 50))
    end
end

-- Aimbot System
local AimbotEnabled = false
local AimbotConnection

local function ToggleAimbot(enabled)
    AimbotEnabled = enabled
    if enabled then
        AimbotConnection = RunService.RenderStepped:Connect(function()
            if not AimbotEnabled then return end
            
            local mouse = LocalPlayer:GetMouse()
            local target = nil
            local shortestDistance = math.huge
            
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                    local head = player.Character:FindFirstChild("Head")
                    if head then
                        local screenPos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(head.Position)
                        if onScreen then
                            local distance = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                            if distance < shortestDistance and distance < 300 then
                                shortestDistance = distance
                                target = head
                            end
                        end
                    end
                end
            end
            
            if target then
                local targetPos = workspace.CurrentCamera:WorldToScreenPoint(target.Position)
                mousemoverel((targetPos.X - mouse.X) * 0.3, (targetPos.Y - mouse.Y) * 0.3)
            end
        end)
        Notify("Aimbot Enabled", Color3.fromRGB(50, 200, 50))
    else
        if AimbotConnection then
            AimbotConnection:Disconnect()
        end
        Notify("Aimbot Disabled", Color3.fromRGB(200, 50, 50))
    end
end

-- Command System
local Commands = {}

function Commands:fly(speed)
    local player = LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local rootPart = character:WaitForChild("HumanoidRootPart")
    
    humanoid.PlatformStand = true
    local bodyGyro = Instance.new("BodyGyro")
    bodyGyro.P = 9e4
    bodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    bodyGyro.cframe = rootPart.CFrame
    bodyGyro.Parent = rootPart
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.velocity = Vector3.new(0, 0, 0)
    bodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
    bodyVelocity.Parent = rootPart
    
    local flySpeed = tonumber(speed) or 50
    
    local flyConnection
    flyConnection = RunService.RenderStepped:Connect(function()
        if not rootPart.Parent then
            flyConnection:Disconnect()
            return
        end
        
        bodyGyro.cframe = workspace.CurrentCamera.CFrame
        
        local direction = Vector3.new()
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            direction += workspace.CurrentCamera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            direction -= workspace.CurrentCamera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            direction -= workspace.CurrentCamera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            direction += workspace.CurrentCamera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            direction += Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            direction -= Vector3.new(0, 1, 0)
        end
        
        if direction.Magnitude > 0 then
            bodyVelocity.velocity = direction.Unit * flySpeed
        else
            bodyVelocity.velocity = Vector3.new(0, 0, 0)
        end
    end)
    
    Notify("Fly enabled! Use WASD to move", Color3.fromRGB(100, 150, 255))
end

function Commands:unfly()
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoid then humanoid.PlatformStand = false end
        if rootPart then
            local bodyGyro = rootPart:FindFirstChild("BodyGyro")
            local bodyVelocity = rootPart:FindFirstChild("BodyVelocity")
            if bodyGyro then bodyGyro:Destroy() end
            if bodyVelocity then bodyVelocity:Destroy() end
        end
    end
    Notify("Fly disabled", Color3.fromRGB(200, 100, 100))
end

function Commands:speed(value)
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        local newSpeed = tonumber(value) or 16
        character.Humanoid.WalkSpeed = newSpeed
        Notify("Speed set to " .. newSpeed, Color3.fromRGB(100, 255, 100))
    end
end

function Commands:jumppower(value)
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        local newPower = tonumber(value) or 50
        character.Humanoid.JumpPower = newPower
        Notify("Jump power set to " .. newPower, Color3.fromRGB(100, 255, 100))
    end
end

function Commands:heal()
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.Health = character.Humanoid.MaxHealth
        Notify("Health restored!", Color3.fromRGB(100, 255, 100))
    end
end

function Commands:godmode()
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.MaxHealth = math.huge
        character.Humanoid.Health = math.huge
        Notify("God mode enabled!", Color3.fromRGB(255, 200, 100))
    end
end

function Commands:invisible()
    local character = LocalPlayer.Character
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
        Notify("Invisible mode enabled!", Color3.fromRGB(200, 100, 255))
    end
end

function Commands:visible()
    local character = LocalPlayer.Character
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 0
            end
        end
        Notify("Visible mode enabled!", Color3.fromRGB(200, 100, 255))
    end
end

function Commands:teleport(x, y, z)
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local pos = Vector3.new(tonumber(x) or 0, tonumber(y) or 0, tonumber(z) or 0)
        character.HumanoidRootPart.CFrame = CFrame.new(pos)
        Notify("Teleported!", Color3.fromRGB(100, 200, 255))
    end
end

function Commands:respawn()
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.Health = 0
        Notify("Respawning...", Color3.fromRGB(255, 100, 100))
    end
end

function Commands:clearsky()
    game.Lighting.Skybox = nil
    game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    Notify("Sky cleared!", Color3.fromRGB(150, 200, 255))
end

function Commands:noclip()
    local character = LocalPlayer.Character
    if character then
        local function noclip()
            if character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CanCollide = false
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end
        noclip()
        Notify("Noclip enabled!", Color3.fromRGB(255, 150, 100))
    end
end

function Commands:clip()
    local character = LocalPlayer.Character
    if character then
        if character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CanCollide = true
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
        Notify("Collision enabled!", Color3.fromRGB(255, 150, 100))
    end
end

function Commands:walkspeed(value)
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        local newSpeed = tonumber(value) or 16
        character.Humanoid.WalkSpeed = newSpeed
        Notify("Walk speed set to " .. newSpeed, Color3.fromRGB(100, 255, 100))
    end
end

function Commands:gravity(value)
    local newGravity = tonumber(value) or 196.2
    workspace.Gravity = newGravity
    Notify("Gravity set to " .. newGravity, Color3.fromRGB(100, 200, 255))
end

function Commands:timespeed(value)
    local newSpeed = tonumber(value) or 1
    game.Lighting.TimeScale = newSpeed
    Notify("Time speed set to " .. newSpeed, Color3.fromRGB(255, 200, 100))
end

function Commands:fullbright()
    game.Lighting.Brightness = 3
    game.Lighting.ClockTime = 14
    game.Lighting.FogEnd = 100000
    game.Lighting.GlobalShadows = false
    game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    Notify("Fullbright enabled!", Color3.fromRGB(255, 255, 100))
end

function Commands:normalbright()
    game.Lighting.Brightness = 1
    game.Lighting.GlobalShadows = true
    game.Lighting.FogEnd = 1000
    Notify("Normal brightness restored!", Color3.fromRGB(200, 200, 200))
end

function Commands:day()
    game.Lighting.ClockTime = 14
    Notify("Time set to day!", Color3.fromRGB(255, 200, 100))
end

function Commands:night()
    game.Lighting.ClockTime = 0
    Notify("Time set to night!", Color3.fromRGB(100, 100, 200))
end

function Commands:storm()
    game.Lighting.Rain = true
    game.Lighting.FogEnd = 500
    game.Lighting.FogColor = Color3.fromRGB(100, 100, 100)
    Notify("Storm started!", Color3.fromRGB(150, 150, 200))
end

function Commands:clearweather()
    game.Lighting.Rain = false
    game.Lighting.FogEnd = 100000
    Notify("Weather cleared!", Color3.fromRGB(100, 200, 255))
end

function Commands:kick(target)
    local player = Players:FindFirstChild(target)
    if player and player ~= LocalPlayer then
        player:Kick("Kicked by admin")
        Notify("Kicked " .. target, Color3.fromRGB(255, 100, 100))
    else
        Notify("Player not found!", Color3.fromRGB(255, 100, 100))
    end
end

function Commands:kill(target)
    local player = Players:FindFirstChild(target)
    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.Health = 0
        Notify("Killed " .. target, Color3.fromRGB(255, 100, 100))
    else
        Notify("Player not found!", Color3.fromRGB(255, 100, 100))
    end
end

-- Create Tabs
local Tabs = {
    {Name = "🏠 Home", Content = "Home"},
    {Name = "👁️ ESP", Content = "ESP"},
    {Name = "🎯 Combat", Content = "Combat"},
    {Name = "⚡ Commands", Content = "Commands"},
    {Name = "🌍 World", Content = "World"},
    {Name = "⚙️ Settings", Content = "Settings"}
}

local CurrentTab = nil

local function CreateTab(tabData, index)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 40)
    button.Position = UDim2.new(0, 0, 0, index * 40)
    button.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    button.Text = tabData.Name
    button.TextColor3 = Color3.fromRGB(200, 200, 200)
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    button.Parent = TabFrame
    
    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, 0, 1, 0)
    content.BackgroundTransparency = 1
    content.Visible = false
    content.Parent = ContentFrame
    
    button.MouseButton1Click:Connect(function()
        if CurrentTab then
            CurrentTab.Visible = false
        end
        content.Visible = true
        CurrentTab = content
        
        for _, btn in pairs(TabFrame:GetChildren()) do
            if btn:IsA("TextButton") then
                btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            end
        end
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    end)
    
    return content
end

-- Create all tabs
local HomeTab = CreateTab(Tabs[1], 0)
local ESPTab = CreateTab(Tabs[2], 1)
local CombatTab = CreateTab(Tabs[3], 2)
local CommandsTab = CreateTab(Tabs[4], 3)
local WorldTab = CreateTab(Tabs[5], 4)
local SettingsTab = CreateTab(Tabs[6], 5)

-- Home Tab Content
local HomeTitle = Instance.new("TextLabel")
HomeTitle.Size = UDim2.new(1, -20, 0, 30)
HomeTitle.Position = UDim2.new(0, 10, 0, 10)
HomeTitle.BackgroundTransparency = 1
HomeTitle.Text = "Welcome to Universal Admin Panel"
HomeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
HomeTitle.TextSize = 18
HomeTitle.Font = Enum.Font.GothamBold
HomeTitle.Parent = HomeTab

local HomeInfo = Instance.new("TextLabel")
HomeInfo.Size = UDim2.new(1, -20, 0, 100)
HomeInfo.Position = UDim2.new(0, 10, 0, 50)
HomeInfo.BackgroundTransparency = 1
HomeInfo.Text = "This is a legitimate admin panel for your own game.\n\nFeatures:\n• ESP System\n• Aimbot\n• 20+ Commands\n• World Controls\n• Settings"
HomeInfo.TextColor3 = Color3.fromRGB(200, 200, 200)
HomeInfo.TextSize = 14
HomeInfo.Font = Enum.Font.Gotham
HomeInfo.TextXAlignment = Enum.TextXAlignment.Left
HomeInfo.Parent = HomeTab

-- ESP Tab
local ESPButton = Instance.new("TextButton")
ESPButton.Size = UDim2.new(1, -20, 0, 40)
ESPButton.Position = UDim2.new(0, 10, 0, 10)
ESPButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
ESPButton.Text = "Toggle ESP"
ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPButton.Font = Enum.Font.GothamBold
ESPButton.Parent = ESPTab

ESPButton.MouseButton1Click:Connect(function()
    ToggleESP(not ESPEnabled)
    ESPButton.Text = ESPEnabled and "ESP: ON" or "ESP: OFF"
    ESPButton.BackgroundColor3 = ESPEnabled and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(150, 50, 50)
end)

-- Combat Tab
local AimbotButton = Instance.new("TextButton")
AimbotButton.Size = UDim2.new(1, -20, 0, 40)
AimbotButton.Position = UDim2.new(0, 10, 0, 10)
AimbotButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
AimbotButton.Text = "Toggle Aimbot"
AimbotButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotButton.Font = Enum.Font.GothamBold
AimbotButton.Parent = CombatTab

AimbotButton.MouseButton1Click:Connect(function()
    ToggleAimbot(not AimbotEnabled)
    AimbotButton.Text = AimbotEnabled and "Aimbot: ON" or "Aimbot: OFF"
    AimbotButton.BackgroundColor3 = AimbotEnabled and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(150, 50, 50)
end)

-- Commands Tab with Scrollable List
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, -10, 1, -10)
ScrollingFrame.Position = UDim2.new(0, 5, 0, 5)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 1000)
ScrollingFrame.ScrollBarThickness = 5
ScrollingFrame.Parent = CommandsTab

local CommandList = {
    {"fly [speed]", "Enable flying", "fly"},
    {"unfly", "Disable flying", "unfly"},
    {"speed [value]", "Set walk speed", "speed"},
    {"jumppower [value]", "Set jump power", "jumppower"},
    {"heal", "Restore health", "heal"},
    {"godmode", "Enable god mode", "godmode"},
    {"invisible", "Become invisible", "invisible"},
    {"visible", "Become visible", "visible"},
    {"teleport [x y z]", "Teleport to position", "teleport"},
    {"respawn", "Respawn character", "respawn"},
    {"noclip", "Enable noclip", "noclip"},
    {"clip", "Disable noclip", "clip"},
    {"gravity [value]", "Set gravity", "gravity"},
    {"timespeed [value]", "Set time speed", "timespeed"},
    {"fullbright", "Enable fullbright", "fullbright"},
    {"normalbright", "Disable fullbright", "normalbright"},
    {"day", "Set time to day", "day"},
    {"night", "Set time to night", "night"},
    {"storm", "Start storm", "storm"},
    {"clearweather", "Clear weather", "clearweather"},
    {"kill [player]", "Kill player", "kill"},
    {"kick [player]", "Kick player", "kick"}
}

for i, cmd in ipairs(CommandList) do
    local cmdButton = Instance.new("TextButton")
    cmdButton.Size = UDim2.new(1, -10, 0, 35)
    cmdButton.Position = UDim2.new(0, 5, 0, (i - 1) * 40)
    cmdButton.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    cmdButton.Text = cmd[1] .. " - " .. cmd[2]
    cmdButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    cmdButton.Font = Enum.Font.Gotham
    cmdButton.TextSize = 12
    cmdButton.Parent = ScrollingFrame
    
    cmdButton.MouseButton1Click:Connect(function()
        local commandName = cmd[3]
        if commandName == "fly" then
            Commands:fly(50)
        elseif commandName == "unfly" then
            Commands:unfly()
        elseif commandName == "speed" then
            Commands:speed(50)
        elseif commandName == "jumppower" then
            Commands:jumppower(100)
        elseif commandName == "heal" then
            Commands:heal()
        elseif commandName == "godmode" then
            Commands:godmode()
        elseif commandName == "invisible" then
            Commands:invisible()
        elseif commandName == "visible" then
            Commands:visible()
        elseif commandName == "teleport" then
            Commands:teleport(0, 50, 0)
        elseif commandName == "respawn" then
            Commands:respawn()
        elseif commandName == "noclip" then
            Commands:noclip()
        elseif commandName == "clip" then
            Commands:clip()
        elseif commandName == "gravity" then
            Commands:gravity(50)
        elseif commandName == "timespeed" then
            Commands:timespeed(2)
        elseif commandName == "fullbright" then
            Commands:fullbright()
        elseif commandName == "normalbright" then
            Commands:normalbright()
        elseif commandName == "day" then
            Commands:day()
        elseif commandName == "night" then
            Commands:night()
        elseif commandName == "storm" then
            Commands:storm()
        elseif commandName == "clearweather" then
            Commands:clearweather()
        elseif commandName == "kill" then
            Notify("Enter player name in chat: !kill [name]", Color3.fromRGB(255, 200, 100))
        elseif commandName == "kick" then
            Notify("Enter player name in chat: !kick [name]", Color3.fromRGB(255, 200, 100))
        end
    end)
end

-- World Tab
local WorldButtons = {
    {Name = "Clear Sky", Func = Commands.clearsky},
    {Name = "Day Time", Func = Commands.day},
    {Name = "Night Time", Func = Commands.night},
    {Name = "Start Storm", Func = Commands.storm},
    {Name = "Clear Weather", Func = Commands.clearweather},
    {Name = "Fullbright", Func = Commands.fullbright},
    {Name = "Normal Brightness", Func = Commands.normalbright}
}

for i, btn in ipairs(WorldButtons) do
    local worldBtn = Instance.new("TextButton")
    worldBtn.Size = UDim2.new(1, -20, 0, 40)
    worldBtn.Position = UDim2.new(0, 10, 0, (i - 1) * 45 + 10)
    worldBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    worldBtn.Text = btn.Name
    worldBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    worldBtn.Font = Enum.Font.Gotham
    worldBtn.Parent = WorldTab
    
    worldBtn.MouseButton1Click:Connect(function()
        btn.Func(Commands)
    end)
end

-- Settings Tab
local SettingsLabel = Instance.new("TextLabel")
SettingsLabel.Size = UDim2.new(1, -20, 0, 30)
SettingsLabel.Position = UDim2.new(0, 10, 0, 10)
SettingsLabel.BackgroundTransparency = 1
SettingsLabel.Text = "Settings"
SettingsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingsLabel.TextSize = 18
SettingsLabel.Font = Enum.Font.GothamBold
SettingsLabel.Parent = SettingsTab

-- Chat Command Handler
LocalPlayer.Chatted:Connect(function(message)
    if message:sub(1, 1) == "!" then
        local parts = message:sub(2):split(" ")
        local cmd = parts[1]:lower()
        
        if cmd == "fly" then
            Commands:fly(parts[2])
        elseif cmd == "unfly" then
            Commands:unfly()
        elseif cmd == "speed" then
            Commands:speed(parts[2])
        elseif cmd == "jumppower" then
            Commands:jumppower(parts[2])
        elseif cmd == "heal" then
            Commands:heal()
        elseif cmd == "godmode" then
            Commands:godmode()
        elseif cmd == "invisible" then
            Commands:invisible()
        elseif cmd == "visible" then
            Commands:visible()
        elseif cmd == "teleport" then
            Commands:teleport(parts[2], parts[3], parts[4])
        elseif cmd == "respawn" then
            Commands:respawn()
        elseif cmd == "noclip" then
            Commands:noclip()
        elseif cmd == "clip" then
            Commands:clip()
        elseif cmd == "gravity" then
            Commands:gravity(parts[2])
        elseif cmd == "timespeed" then
            Commands:timespeed(parts[2])
        elseif cmd == "fullbright" then
            Commands:fullbright()
        elseif cmd == "normalbright" then
            Commands:normalbright()
        elseif cmd == "day" then
            Commands:day()
        elseif cmd == "night" then
            Commands:night()
        elseif cmd == "storm" then
            Commands:storm()
        elseif cmd == "clearweather" then
            Commands:clearweather()
        elseif cmd == "kill" then
            Commands:kill(parts[2])
        elseif cmd == "kick" then
            Commands:kick(parts[2])
        elseif cmd == "esp" then
            ToggleESP(not ESPEnabled)
        elseif cmd == "aimbot" then
            ToggleAimbot(not AimbotEnabled)
        elseif cmd == "help" then
            Notify("Type !help for commands list", Color3.fromRGB(100, 200, 255))
        end
    end
end)

-- Close Button
CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    Notify("GUI hidden! Press 'M' to show", Color3.fromRGB(200, 200, 200))
end)

-- Toggle GUI with M key
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.M then
        MainFrame.Visible = not MainFrame.Visible
        if MainFrame.Visible then
            Notify("GUI shown!", Color3.fromRGB(100, 200, 100))
        end
    end
end)

-- Initialize
Notify("⭐ Universal Admin Panel loaded!", Color3.fromRGB(100, 200, 255))
Notify("Press 'M' to toggle GUI", Color3.fromRGB(200, 200,
