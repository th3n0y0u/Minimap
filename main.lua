local minimap = game.ReplicatedStorage.minimap:Clone()
local playerPosition = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position
minimap.Parent = workspace

local camera = Instance.new("Camera")
camera.Parent = script.Parent
camera.CameraType = Enum.CameraType.Scriptable
camera.FieldOfView = 120

script.Parent.Adornee = minimap.PrimaryPart
script.Parent.ViewportFrame.CurrentCamera = camera

workspace.Map:Clone().Parent = script.Parent.ViewportFrame

wait(0.1)

while true do
	playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
	minimap:SetPrimaryPartCFrame(workspace.CurrentCamera.CFrame*CFrame.Angles(math.rad(90),0 ,0)*CFrame.new(10,-10,4.2))
	camera.CFrame = CFrame.new(playerPosition + Vector3.new(0,50,0),playerPosition)
	game:GetService("RunService").RenderStepped:Wait()
end 