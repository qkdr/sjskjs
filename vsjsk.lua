local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local maxDis = 525
local clickDelay = 0.1
local scanDelay = 3
local running = true

local function clickWithClick()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("ClickDetector") and v.Parent and v.Parent:IsA("BasePart") and (maxDis == 0 or (rootPart.Position - v.Parent.Position).Magnitude <= maxDis) then
            fireclickdetector(v)
            task.wait(clickDelay)
        end
    end
end

player.Chatted:Connect(function(message)
    if message:lower() == "stop" then
        running = false
    end
end)

while running do
    clickWithClick()
    task.wait(scanDelay)
end
