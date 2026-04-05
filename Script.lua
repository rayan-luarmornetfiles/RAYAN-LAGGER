-- Configuration du faux ban
local Raison = "Script désactivé"
local CodeErreur = "267" -- Code typique pour une expulsion par script

-- Récupération des services
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "RobloxSystemPrompt"
gui.DisplayOrder = 999 -- S'affiche par-dessus tout
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

-- Fond sombre semi-transparent (comme le vrai menu)
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BackgroundTransparency = 0.5
background.Parent = gui

-- Fenêtre de message (Main Frame)
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 400, 0, 180)
main.Position = UDim2.new(0.5, -200, 0.5, -90)
main.BackgroundColor3 = Color3.fromRGB(57, 59, 61)
main.BorderSizePixel = 0
main.Parent = background

-- Arrondir les coins (UI Corner)
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = main

-- Titre "Déconnecté"
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "Déconnecté"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 22
title.Font = Enum.Font.SourceSansBold
title.BackgroundTransparency = 1
title.Parent = main

-- Message d'erreur
local message = Instance.new("TextLabel")
message.Size = UDim2.new(1, -40, 0, 60)
message.Position = UDim2.new(0, 20, 0, 50)
message.Text = "Vous avez été expulsé du serveur : " .. Raison .. " (Code d'erreur : " .. CodeErreur .. ")"
message.TextColor3 = Color3.fromRGB(210, 210, 210)
message.TextSize = 16
message.Font = Enum.Font.SourceSans
message.TextWrapped = true
message.BackgroundTransparency = 1
message.Parent = main

-- Bouton Quitter
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 360, 0, 40)
button.Position = UDim2.new(0.5, -180, 0.75, 0)
button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button.Text = "Quitter"
button.TextColor3 = Color3.fromRGB(57, 59, 61)
button.TextSize = 18
button.Font = Enum.Font.SourceSansBold
button.Parent = main

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 5)
btnCorner.Parent = button

-- Action du bouton (Ferme juste la blague)
button.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
