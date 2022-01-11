ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end
    PlayerLoaded = true
    ESX.PlayerData = ESX.GetPlayerData()
end)



---------------------------------------------------- AMMUNATION --------------------------


local armeblanche = {
	Base = { Header = {"shopui_title_gunclub", "shopui_title_gunclub"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Ammunation"},
	Data = { currentMenu = "Discussion", "" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			if btn.name == "Couteau" then 
                TriggerServerEvent('nk:buy', 1, "weapon_knife", "Couteau")
            elseif btn.name == "Batte de Baseball" then 
                TriggerServerEvent('nk:buy', 1, "weapon_bat", "Batte de Baseball")
            elseif btn.name == "Couteau à cran d'arret" then 
                TriggerServerEvent('nk:buy', 1, "weapon_switchblade", "Couteau à cran d'arret")
            elseif btn.name == "Poing Américain" then 
                TriggerServerEvent('nk:buy', 1, "weapon_knuckle", "Poing Américain")
            elseif btn.name == "Je voudrais acheter des armes blanches !" then 
                OpenMenu('Arme blanche :')
            elseif btn.name == "Je voudrais acheter des armes à feux !" then 
                OpenMenu('Armes')
            elseif btn.name == "Pistolet" then 
                TriggerServerEvent('nk:buy', 1, "weapon_pistol", "Pistolet")
            elseif btn.name == "Pistolet Lourd" then 
                TriggerServerEvent('nk:buy', 1, "weapon_heavypistol", "Pistolet MK2")
            elseif btn.name == "Pétoire" then 
                 TriggerServerEvent('nk:buy', 1, "weapon_snspistol", "Pistolet MK2")
            end
        end,
    },

    Menu = {
        ["Arme blanche :"] = {
            b = {
				{name = "Couteau", ask = "~g~1$", askX = true},
                {name = "Batte de Baseball", ask = "~g~1$", askX = true},
                {name = "Couteau à cran d'arret", ask = "~g~1$", askX = true},
                {name = "Poing Américain", ask = "~g~1$", askX = true},
            }
        },
        ["Discussion"] = {
            b = {
            {name = "Je voudrais acheter des armes blanches !",  askx = true},
            {name = "Je voudrais acheter des armes à feux !", askx = true},
        }
        },
        ["Armes"] = {
            b = {
				{name = "Pistolet", ask = "~g~1$", askX = true},
                {name = "Pistolet Lourd", ask = "~g~1$", askX = true},
                {name = "Pétoire", ask = "~g~1$", askX = true},
            }
        },
    }
}




local accessoire = {
	Base = { Header = {"shopui_title_gunclub", "shopui_title_gunclub"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Ammunation"},
	Data = { currentMenu = "Discussion", "" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			if btn.name == "Lampe Torche" then 
                TriggerServerEvent('nk:buy', 1, "weapon_flashlight", "Lampe Torche")
            elseif btn.name == "Extincteur" then 
                AddAmmoToPed(GetPlayerPed(-1), 101631238,2000)
                TriggerServerEvent('nk:buy', 1, "weapon_fireextinguisher", "Extincteur")
            elseif btn.name == "Fumigène Rouge" then 
                    TriggerServerEvent('nk:buy', 1, "weapon_flare", "Fumigène Rouge")
            elseif btn.name == "Chargeur de Pistolet" then 
                TriggerServerEvent('buy', "clip", 1) 
            elseif btn.name == "Je voudrais acheter des armes" then 
                DrawSub('Allez voir mon collègue !', 2500)
            elseif btn.name == "Je voudrais voir les accessoires !" then 
               OpenMenu('Liste des accessoire :')
        end
    end,
},

    Menu = {
        ["Liste des accessoire :"] = {
            b = {

				{name = "Lampe Torche", ask = "~g~1$", askX = true},
                {name = "Extincteur", ask = "~g~1$", askX = true},
                {name = "Fumigène Rouge", ask = "~g~1$", askX = true},
                {name = "Chargeur de Pistolet", ask = "~g~1$", askX = true},
            }
        },
        ["Discussion"] = {
            b = {

				{name = "Je voudrais acheter des armes", askX = true},
                {name = "Je voudrais voir les accessoires !", askX = true},
            }
        },
    }
}

-- POS SHOP & TEXTE



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k,v in pairs(Config.Pos.ammunation1) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v.x,v.y,v.z ) <= 2 then
                DrawText3D(22.73, -1105.48, 30.79, "Parler à ~y~Gilbert")
                if IsControlJustPressed(1,38) then 
                    DrawSub('Bonjour que voulez vous ?', 2500)
                    Wait(2500)
                   CreateMenu(armeblanche)
                end
            end
        end
    end
end)
 



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k,v in pairs(Config.Pos.ammunation2) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v.x,v.y,v.z ) <= 2 then
                DrawText3D(16.452207565308,-1111.3358154297,30.797033309937, "Parler à ~p~Jean-Yves")
                if IsControlJustPressed(1,38) then 
                    DrawSub('Bonjour que voulez vous ?', 2500)
                    Wait(2500)
                    CreateMenu(accessoire)
                end
            end
        end
    end
end)
 



------------------------ TEXT EN BAS


function DrawSub(msg, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandPrint(time, 1)
end

------------------ TEXT 3D ---------------


function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.25)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end


Citizen.CreateThread(function()
    for a,b in pairs(Config.Ped) do  
        for c,d in pairs(b) do
            local blip = AddBlipForCoord(d.Position)
            SetBlipSprite (blip, d.Sprite)
            SetBlipDisplay(blip, d.Display)
            SetBlipScale  (blip, d.Scale)
            SetBlipColour (blip, d.Colour)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(d.Name)
            EndTextCommandSetBlipName(blip)
        end
    end
end)


Citizen.CreateThread(function()
    for a,b in pairs(Config.Ped) do
        for c,d in pairs(b) do
            local hash = GetHashKey(d.Ped)
            while not HasModelLoaded(hash) do
                RequestModel(hash)
                Citizen.Wait(20)
            end
            ped = CreatePed(d.PedType, d.Ped, d.Position, false, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            SetEntityInvincible(ped, true)
            FreezeEntityPosition(ped, true)
        end
    end
end)

print ('^6(Crée par ^2Kadomish^6)')
print ('^6https://discord.gg/familydev')



