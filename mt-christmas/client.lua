local QBCore = exports[Config.QBCoreName]:GetCoreObject()

---------------------
-- Christmas Gifts --
---------------------

local time = 1000
function loadModel(model) 
    if not HasModelLoaded(model) then
        while not HasModelLoaded(model) do
            if time > 0 then time = time - 1 RequestModel(model)
            else time = 1000 break
            end
            Wait(10)
        end
    end 
end

function makeProp(data, freeze, synced)
    loadModel(data.prop)
    local prop = CreateObject(data.prop, data.coords.x, data.coords.y, data.coords.z, synced or 0, synced or 0, 0)
    FreezeEntityPosition(prop, freeze or 0)
    return prop
end

local function PickGift(entity)
    QBCore.Functions.Progressbar('pick_gift', Lang.PickingGift, Config.PickGiftTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'amb@medic@standing@tendtodead@base',
        anim = 'base',
    }, {}, {}, function()
        DeleteEntity(entity)
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('mt-christmas:server:AddGift')
    end, function()
        ClearPedTasks(PlayerPedId())
    end)
end

CreateThread(function()
    Wait(500)
    for k, v in pairs(Config.GiftsLocations) do
        local present = makeProp({ prop = `vms_gift`, coords = v.Coords}, 0, 1)
    end
    exports[Config.QBTargetName]:AddTargetModel(
        `vms_gift`, 
        {
            options = {
                {
                    targeticon = 'fas fa-gift',
                    icon = 'fas fa-hand-paper',
                    type = "client",
                    action = function(entity)
                        PickGift(entity)
                    end,
                    label = Lang.PickGift,
                }
            },
            distance = Config.boxDistance,
        }
    )
end)

RegisterNetEvent('mt-christmas:client:OpenGift', function()
    RequestModel(`vms_gift`)
    while (not HasModelLoaded(`vms_gift`)) do
        Wait(1)
    end
    local gift = makeProp({ prop = `vms_gift`, coords = vector3(GetPedBoneCoords(PlayerPedId()).x-0.5, GetPedBoneCoords(PlayerPedId()).y, GetPedBoneCoords(PlayerPedId()).z-1.0)}, 0, 1)
    QBCore.Functions.Progressbar('open_gift', Lang.OpeningGift, Config.OpenGiftTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'amb@medic@standing@tendtodead@base',
        anim = 'base',
    }, {}, {}, function()
        DeleteEntity(gift)
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('mt-christmas:server:OpenGift')
    end, function()
        DeleteEntity(gift)
        ClearPedTasks(PlayerPedId())
    end)
end)

------------------------------------
-- Christmas SnowMans & SnowBalls --
------------------------------------

local function SnowMenu()
    if IsNextWeatherType('XMAS') and not IsPedInAnyVehicle(PlayerPedId(), true) and not IsPlayerFreeAiming(PlayerId()) and not IsPedSwimming(PlayerPedId()) and not IsPedSwimmingUnderWater(PlayerPedId()) and not IsPedRagdoll(PlayerPedId()) and not IsPedFalling(PlayerPedId()) and not IsPedRunning(PlayerPedId()) and not IsPedSprinting(PlayerPedId()) and GetInteriorFromEntity(PlayerPedId()) == 0 and not IsPedShooting(PlayerPedId()) and not IsPedUsingAnyScenario(PlayerPedId()) and not IsPedInCover(PlayerPedId(), 0) then
        exports[Config.QBMenuName]:openMenu({
            {
                header = Lang.PickSnowBall,
                icon = 'fa fa-snowflake-o',
                params = {
                    event = 'mt-christmas:client:PickSnowBall',
                }
            },
            {
                header = Lang.MakeSnowMan,
                icon = 'fas fa-snowman',
                params = {
                    event = 'mt-christmas:client:MakeSnowMan',
                }
            },
        })
    end
end

CreateThread(function()
    while true do
        if IsControlJustReleased(0, Config.SnowKey) then
            SnowMenu()
        end
        Wait(0)
    end
end)

RegisterNetEvent('mt-christmas:client:PickSnowBall', function()
    QBCore.Functions.Progressbar('open_gift', Lang.PickingSnowBalls, Config.PickSnowBallsTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@mp_snowball',
        anim = 'pickup_snowball',
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        Wait(500)
        GiveWeaponToPed(PlayerPedId(), GetHashKey('WEAPON_SNOWBALL'), Config.SnowBallsAmount, false, true)
    end, function()
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('mt-christmas:client:MakeSnowMan', function()
    QBCore.Functions.Progressbar('open_gift', Lang.MakingSnowMan, Config.MakeSnowManTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'amb@medic@standing@tendtodead@base',
        anim = 'base',
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        local snowman = makeProp({ prop = `prop_prlg_snowpile`, coords = vector3(GetPedBoneCoords(PlayerPedId()).x-0.5, GetPedBoneCoords(PlayerPedId()).y, GetPedBoneCoords(PlayerPedId()).z-0.6)}, 0, 1)
    end, function()
        DeleteEntity(gift)
        ClearPedTasks(PlayerPedId())
    end)
end)