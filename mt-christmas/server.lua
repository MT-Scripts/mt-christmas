local QBCore = exports[Config.QBCoreName]:GetCoreObject()

QBCore.Functions.CreateUseableItem('christmas_gift', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('mt-christmas:client:OpenGift', source)
    end
end)

RegisterNetEvent('mt-christmas:server:AddGift', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('christmas_gift', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['christmas_gift'], "add", 1)
end)

RegisterNetEvent('mt-christmas:server:OpenGift', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local chance = math.random(1, 100)
    Player.Functions.RemoveItem('christmas_gift', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['christmas_gift'], "remove", 1)
    if chance <= 30 then
        local item = math.random(1, #Config.GiftItems.Normal)
        Player.Functions.AddItem(tostring(Config.GiftItems.Normal[item]), 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[tostring(Config.GiftItems.Normal[item])], "add", 1)
    elseif chance <= 70 and chance > 30 then
        local item = math.random(1, #Config.GiftItems.Rare)
        Player.Functions.AddItem(tostring(Config.GiftItems.Rare[item]), 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[tostring(Config.GiftItems.Rare[item])], "add", 1)
    elseif chance <= 100 and chance > 70 then
        local item = math.random(1, #Config.GiftItems.RealRare)
        Player.Functions.AddItem(tostring(Config.GiftItems.RealRare[item]), 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[tostring(Config.GiftItems.RealRare[item])], "add", 1)
    end
end)