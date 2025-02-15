-- No Recoil
-- made by kadencodes!

local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Function to cancel recoil effect
local function removeRecoil()
    while true do
        wait()
        if camera then
            camera.CFrame = camera.CFrame -- Keeps the camera steady, removing recoil effects
        end
    end
end

-- Run the function in a separate thread
task.spawn(removeRecoil)
