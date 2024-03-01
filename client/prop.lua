-- client.lua

ESX = exports.es_extended:getSharedObject()

function SpawnPropAtCoords(model, x, y, z, w, rotate, rotateSpeed, rotateDistance)
    RequestModel(model)

    while not HasModelLoaded(model) do
        Wait(500)
    end

    local prop = CreateObject(model, x, y, z, true, false, false)
    SetEntityHeading(prop, w)

    FreezeEntityPosition(prop, true)

    if rotate then
        Citizen.CreateThread(function()
            while true do
                Wait(1)
                local playerPed = GetPlayerPed(-1)
                local propCoords = GetEntityCoords(prop)
                local playerCoords = GetEntityCoords(playerPed)
                local distance = #(propCoords - playerCoords)
                local currentHeading = GetEntityHeading(prop)

                if distance <= rotateDistance then
                    SetEntityHeading(prop, currentHeading + rotateSpeed)
                end
            end
        end)
    end
end

Citizen.CreateThread(function()
    for _, propData in ipairs(DRZ.Prop.Settings) do
        if propData.spawnProp then

            local model = propData.model
            local coords = propData.coords
            local rotate = propData.rotate or false
            local rotateSpeed = propData.rotateSpeed or 0.0
            local rotateDistance = propData.rotateDistance or 0

                SpawnPropAtCoords(model, coords.x, coords.y, coords.z, coords.w, rotate, rotateSpeed, rotateDistance)
        elseif propData.spawnProp == false then
            local coords = propData.coords
            ClearAreaOfObjects(coords.x, coords.y, coords.z, 0.1, 0)
        end
    end
end)


