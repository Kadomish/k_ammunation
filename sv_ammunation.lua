ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


--------------------------------- AMMUNATION



RegisterServerEvent('nk:buy')
AddEventHandler('nk:buy', function(price, weapon, label)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()
    if xMoney >= price then
    xPlayer.removeMoney(price)
    xPlayer.addWeapon(weapon, 200)
         TriggerClientEvent('esx:showNotification', source, "~g~Merci de votre achat de ~g~$"..price.." !")
    else
         TriggerClientEvent('esx:showNotification', source, "Paiement ~r~refusé", "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end                                                      
end)

RegisterNetEvent('buy')
AddEventHandler('buy', function(item, prix)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = prix
    local xMoney = xPlayer.getMoney()
    if xMoney >= price then
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem(item, 1)
	
    	TriggerClientEvent('esx:showNotification', source, "~g~Vous avez~w~ récupéré ~b~1x" .. label .. " ~w~ !")
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!")
    end
end)


