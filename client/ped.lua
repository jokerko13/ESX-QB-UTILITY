-- client.lua

ESX = exports.es_extended:getSharedObject()

function CreateNPC(model, x, y, z, w, immortal, weapon, pedType, freeze, ambient, scenario)
    RequestModel(model)

    while not HasModelLoaded(model) do
        Wait(500)
    end

    local npc = CreatePed(pedType, model, x, y, z, w, false, false)
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetPedDiesWhenInjured(npc, false)
    SetEntityInvincible(npc, immortal)
    SetPedCanRagdollFromPlayerImpact(npc, true)
    SetPedCanPlayAmbientAnims(npc, ambient)
    FreezeEntityPosition(npc, freeze)





    TaskStartScenarioInPlace(npc, scenario, 0, true)

    if weapon then
        GiveWeaponToPed(npc, GetHashKey(weapon), 1000, true, true)
    end

    SetEntityCoordsNoOffset(npc, x, y, z, true, true, true)
end

Citizen.CreateThread(function()
    for _, ped in ipairs(DRZ.Peds.Settings) do
        if ped.spawnPed then
            local npcModel = ped.model
            local coords = ped.coords
            local immortal = ped.immortal or false
            local ambient = ped.ambient or false
            local weapon = ped.weapon or nil
            local pedType = ped.pedType or 1
            local scenario = ped.scenario or nil
            local freeze = ped.freeze or false

                CreateNPC(npcModel, coords.x, coords.y, coords.z, coords.w, immortal, weapon, pedType, freeze, ambient, scenario)
        elseif ped.spawnPed == false then
            local coords = ped.coords
            ClearAreaOfPeds(coords.x, coords.y, coords.z, 0.1, false)
        end
    end
end)


