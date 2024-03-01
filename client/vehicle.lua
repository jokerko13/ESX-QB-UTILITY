ESX = exports.es_extended:getSharedObject()

-- Funkce pro vytváření vozidel
function CreateVehiclesF(model, x, y, z, w, plateText, dirtLevel, lights, locked, indicators, windows, rotate, rotateSpeed, rotateDistance, primaryColor, secondaryColor) 
    RequestModel(model)

    while not HasModelLoaded(model) do
        Wait(500)
    end

    local vehicle = CreateVehicle(model, x, y, z, w, true, false)
    SetVehicleNumberPlateText(vehicle, plateText)
    FreezeEntityPosition(vehicle, true)

    SetVehicleDirtLevel(vehicle, dirtLevel)

    if lights then
        SetVehicleLights(vehicle, 2)
        SetVehicleEngineOn(vehicle, true, true, false)
    else
        SetVehicleLights(vehicle, 1)
    end

    if locked then
        SetVehicleDoorsLocked(vehicle, 2)
    else
        SetVehicleDoorsLocked(vehicle, 0)
    end

    if indicators then
        SetVehicleIndicatorLights(vehicle, 0, true)
        SetVehicleIndicatorLights(vehicle, 1, true)
        SetVehicleEngineOn(vehicle, true, true, false)
    end

    if primaryColor then
        SetVehicleCustomPrimaryColour(vehicle, primaryColor[1], primaryColor[2], primaryColor[3])
    end
    
    if secondaryColor then
        SetVehicleCustomPrimaryColour(vehicle, secondaryColor[1], secondaryColor[2], secondaryColor[3])
    end

    if windows then
        RollDownWindows(vehicle)
    else
        RollUpWindow(vehicle, 0)
        RollUpWindow(vehicle, 1)
        RollUpWindow(vehicle, 2)
        RollUpWindow(vehicle, 3)
    end

    -- Otáčení vozidla
    if rotate then
        Citizen.CreateThread(function()
            while true do
                Wait(1)

                local playerPed = GetPlayerPed(-1)
                local vehicleCoords = GetEntityCoords(vehicle)
                local playerCoords = GetEntityCoords(playerPed)
                local distance = #(vehicleCoords - playerCoords)
                local currentHeading = GetEntityHeading(vehicle)

                if distance <= rotateDistance then
                    SetEntityHeading(vehicle, currentHeading + rotateSpeed)
                elseif distance >= rotateDistance then
                    Wait(2500)
                end
            end
        end)
    end
end

-- Hlavní vlákno pro spawn vozidel
Citizen.CreateThread(function()
    for _, vehicleData in ipairs(DRZ.Vehicle.Settings) do
        if vehicleData.spawnModel then
            local model = vehicleData.model
            local coords = vehicleData.coords
            local plateText = vehicleData.plateText or ""
            local dirtLevel = vehicleData.dirtLevel or 0.0
            local lights = vehicleData.lights or false
            local locked = vehicleData.locked or false
            local indicators = vehicleData.indicators or false
            local rotate = vehicleData.rotate or false
            local rotateSpeed = vehicleData.rotateSpeed or 0.0
            local windows = vehicleData.windows or false
            local rotateDistance = vehicleData.rotateDistance or 0
            local primaryColor = vehicleData.primaryColor or {0, 0, 0}
            local secondaryColor = vehicleData.secondaryColor

            CreateVehiclesF(model, coords.x, coords.y, coords.z - 1, coords.w, plateText, dirtLevel, lights, locked, indicators, windows, rotate, rotateSpeed, rotateDistance, primaryColor, secondaryColor)
        end
    end
end)
