-- Configuration
local MessageBan = "Script désactivé"
local CodeErreur = "267"

-- Services
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Création de l'interface
local gui = Instance.new("ScreenGui")
gui.Name = "RobloxPromptGui"
gui.DisplayOrder = 1000
gui.IgnoreGuiInset = true

-- Protection contre la suppression simple
if getgenv then
    gui.Parent = getgenv().gethui and gethui() or CoreGui
else
    gui.Parent = player:WaitForChild("PlayerGui")
end

-- Fond d'écran flou/sombre
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BackgroundTransparency = 0.5
background.Parent = gui

-- Fenêtre principale (Dimensions exactes de la modale Roblox)
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 400, 0, 200)
main.Position = UDim2.new(0.5, -200, 0.5, -100)
main.BackgroundColor3 = Color3.fromRGB(36, 37, 39)
main.BorderSizePixel = 0
main.Parent = background

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = main

-- Titre
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.Text = "Déconnecté"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 25
title.Font = Enum.Font.SourceSansBold
title.BackgroundTransparency = 1
title.Parent = main

-- Message (Exactement comme le vrai)
local message = Instance.new("TextLabel")
message.Size = UDim2.new(1, -40, 0, 60)
message.Position = UDim2.new(0, 20, 0, 60)
message.Text = "Vous avez été expulsé du serveur : " .. MessageBan .. " (Code d'erreur : " .. CodeErreur .. ")"
message.TextColor3 = Color3.fromRGB(188, 189, 190)
message.TextSize = 18
message.Font = Enum.Font.SourceSans
message.TextWrapped = true
message.BackgroundTransparency = 1
message.Parent = main

-- Bouton Quitter (Le style blanc officiel)
local leaveBtn = Instance.new("TextButton")
leaveBtn.Size = UDim2.new(0, 350, 0, 45)
leaveBtn.Position = UDim2.new(0.5, -175, 0.72, 0)
leaveBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
leaveBtn.Text = "Quitter"
leaveBtn.TextColor3 = Color3.fromRGB(36, 37, 39)
leaveBtn.TextSize = 20
leaveBtn.Font = Enum.Font.SourceSansBold
leaveBtn.AutoButtonColor = true
leaveBtn.Parent = main

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 6)
btnCorner.Parent = leaveBtn

-- ACTION : Quitter vraiment le jeu
leaveBtn.MouseButton1Click:Connect(function()
    -- Cette commande ferme le client Roblox proprement
    game:Shutdown() 
end)

-- Optionnel : Bloquer les touches pour forcer l'usage du bouton
print("Alerte système : " .. MessageBan)
