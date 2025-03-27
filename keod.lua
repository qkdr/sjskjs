local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera
local createdEsp = {}

local function Esp_Parts()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v:FindFirstChildOfClass("SurfaceGui") and not createdEsp[v] then
            local billboard = Instance.new("BillboardGui")
            billboard.Adornee = v
            billboard.Size = UDim2.new(0, v.Size.X * 3, 0, v.Size.Y * 3)
            billboard.StudsOffset = Vector3.new(0, 5, 0)
            billboard.Parent = v
            billboard.AlwaysOnTop = true
            billboard.MaxDistance = 1000
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            frame.BackgroundTransparency = 0.5
            frame.BorderSizePixel = 0
            frame.Parent = billboard
            createdEsp[v] = true
        end
    end
end

while true do
    Esp_Parts()
    task.wait(12)
end
