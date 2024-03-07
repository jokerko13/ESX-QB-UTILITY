function CreateBlip(name, x, y, z, sprite, scale, color, display, shortRange)
    local blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, sprite)
    SetBlipDisplay(blip, display)
    SetBlipScale(blip, scale)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, shortRange)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(name)
    EndTextCommandSetBlipName(blip)
end


Citizen.CreateThread(function()
    for _, blipData in ipairs(DRZ.Blip.Settings) do
        if blipData.spawnBlip then
            local name = blipData.name
            local coords = blipData.coords
            local sprite = blipData.sprite or 0
            local scale = blipData.scale or 0.0
            local color = blipData.color or 0
            local display = blipData.display or 0
            local shortRange = blipData.shortRange or false

            CreateBlip(name, coords.x, coords.y, coords.z, sprite, scale, color, display, shortRange)
        end
    end
end)
