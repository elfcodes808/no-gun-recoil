-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local Window = Rayfield:CreateWindow({
    Name = "Combat & Utility Hub",
    LoadingTitle = "Loading UI...",
    LoadingSubtitle = "by Kadencodes & Salty",
    ConfigurationSaving = {
        Enabled = false
    },
    KeySystem = false
})

-- Combat Tab
local CombatTab = Window:CreateTab("Combat", 4483362458)

-- No Recoil Toggle
local NoRecoilToggle = CombatTab:CreateToggle({
    Name = "No Recoil",
    CurrentValue = false,
    Callback = function(state)
        getgenv().NoRecoil = state
        while getgenv().NoRecoil do
            wait()
            if game.Players.LocalPlayer and workspace.CurrentCamera then
                workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame
            end
        end
    end
})

-- Steady Gun Toggle
local SteadyGunToggle = CombatTab:CreateToggle({
    Name = "Steady Gun",
    CurrentValue = false,
    Callback = function(state)
        getgenv().SteadyGun = state
        while getgenv().SteadyGun do
            wait()
            for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("Handle") then
                    v.Handle.Velocity = Vector3.new(0, 0, 0)
                    v.Handle.RotVelocity = Vector3.new(0, 0, 0)
                end
            end
        end
    end
})

-- Silent Aim (Placeholder)
local SilentAimToggle = CombatTab:CreateToggle({
    Name = "Silent Aim (Optional)",
    CurrentValue = false,
    Callback = function(state)
        getgenv().SilentAim = state
        if state then
            -- Silent Aim Logic (Needs custom implementation)
        end
    end
})

-- Misc Tab
local MiscTab = Window:CreateTab("Misc", 4483362458)

-- No Clip Toggle
local NoClipToggle = MiscTab:CreateToggle({
    Name = "No Clip",
    CurrentValue = false,
    Callback = function(state)
        getgenv().NoClip = state
        local plr = game.Players.LocalPlayer
        while getgenv().NoClip do
            for _, part in pairs(plr.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
            wait()
        end
    end
})

-- FPS Boost Toggle
local FPSBoostToggle = MiscTab:CreateToggle({
    Name = "FPS Boost",
    CurrentValue = false,
    Callback = function(state)
        getgenv().FPSBoost = state
        if state then
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("BasePart") and not v:IsDescendantOf(game.Players.LocalPlayer.Character) then
                    v.Material = Enum.Material.SmoothPlastic
                    v.CastShadow = false
                elseif v:IsA("Texture") or v:IsA("Decal") then
                    v.Transparency = 1
                elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Enabled = false
                end
            end
            setfpscap(300)
            Rayfield:Notify({
                Title = "FPS Boost Activated",
                Content = "Game optimized for better FPS!",
                Duration = 3
            })
        else
            setfpscap(60)
            Rayfield:Notify({
                Title = "FPS Boost Disabled",
                Content = "Game settings reverted to normal.",
                Duration = 3
            })
        end
    end
})

-- Support Server Button
local SupportServerButton = MiscTab:CreateButton({
    Name = "Support Server",
    Callback = function()
        setclipboard("https://discord.gg/YOURSERVERLINK")
        Rayfield:Notify({
            Title = "Copied!",
            Content = "Support server invite link copied to clipboard.",
            Duration = 3
        })
    end
})

-- Credits Tab
local CreditsTab = Window:CreateTab("Credits", 4483362458)

CreditsTab:CreateParagraph({Title = "Special Thanks", Content = "Kadencodes & Salty for developing this script."})

Rayfield:Notify({
    Title = "UI Loaded",
    Content = "Enjoy your script!",
    Duration = 3
})
