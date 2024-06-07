local cantBreakFree = true

-- Function to get players within a certain range
function GetPlayersInRange(range)
    local playersInRange = {}
    local playerPed = PlayerPedId()
    local playerId = PlayerId()
    local coords = GetEntityCoords(playerPed)

    for _, player in ipairs(GetActivePlayers()) do
        local tgt = GetPlayerPed(player)

        if player ~= playerId then
            local targetCoords = GetEntityCoords(tgt)
            local distance = #(coords - targetCoords)

            if distance <= range then
                table.insert(playersInRange, GetPlayerServerId(player))
            end
        end
    end

    return playersInRange
end

-- Main thread to manage hogtied state and actions
Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        -- Check if the player is hogtied using IS_PED_HOGTIED (0x3AA24CCC0D451379)
        local hogtied = Citizen.InvokeNative(0x3AA24CCC0D451379, playerPed)

        if hogtied then
            -- If the player is hogtied, run the loop quickly
            Citizen.Wait(0)

            -- Disable control action (0x6E9734E8)
            DisableControlAction(1, 0x6E9734E8, true)
            -- Set Ped Action Disable Flag (0xB8DE69D9473B7593)
            Citizen.InvokeNative(0xB8DE69D9473B7593, playerPed, 15)

            local playersInRange = GetPlayersInRange(20.0)

            -- If no players are within 20 meters, allow breaking free
            if #playersInRange == 0 then
                cantBreakFree = false
            else
                -- Otherwise, disable breaking free control action
                cantBreakFree = true
                DisableControlAction(1, 0x295175BF, true)
            end
        else
            -- If the player is not hogtied, run the loop less frequently
            Citizen.Wait(2000)
            cantBreakFree = true
        end
    end
end)