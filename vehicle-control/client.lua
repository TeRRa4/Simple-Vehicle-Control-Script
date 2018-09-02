-- C O N F I G --
interactionDistance = 0.1 --The radius you have to be in to interact with the vehicle.

--  V A R I A B L E S --
engineoff = false
saved = false
controlsave_bool = false

-- CHAT COMMAND REGISTRATION --
Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/engine',  "toggle vehicle engine", , } } )
	TriggerEvent('chat:addSuggestion', '/ldoor',  "open/close left door", , } } )
	TriggerEvent('chat:addSuggestion', '/rdoor',   "open/close right door", , } } )
	TriggerEvent('chat:addSuggestion', '/lrdoor', "open/close left-rear door", , } } )
	TriggerEvent('chat:addSuggestion', '/rrdoor', "open/close right-rear door", , } } )
	TriggerEvent('chat:addSuggestion', '/rdoors', "open/close both rear doors", , } } )
	TriggerEvent('chat:addSuggestion', '/trunk', "open/close trunk", , } } )
	TriggerEvent('chat:addSuggestion', '/hood', "open/close hood", , } } )
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/engine')
		TriggerEvent('chat:removeSuggestion', '/ldoor')
		TriggerEvent('chat:removeSuggestion', '/rdoor')
		TriggerEvent('chat:removeSuggestion', '/lrdoor')
		TriggerEvent('chat:removeSuggestion', '/rrdoor')
		TriggerEvent('chat:removeSuggestion', '/rdoors')
		TriggerEvent('chat:removeSuggestion', '/trunk')
		TriggerEvent('chat:removeSuggestion', '/hood')
	end
end)

-- E N G I N E --
IsEngineOn = true
RegisterNetEvent('engine')
AddEventHandler('engine',function() 
	local player = GetPlayerPed(-1)
	
	if (IsPedSittingInAnyVehicle(player)) then 
		local vehicle = GetVehiclePedIsIn(player,false)
		
		if IsEngineOn == true then
			IsEngineOn = false
			SetVehicleEngineOn(vehicle,false,false,false)
			TriggerClientEvent('esx:showNotification', _source, "You turned the engine on.")
		else
			IsEngineOn = true
			SetVehicleUndriveable(vehicle,false)
			SetVehicleEngineOn(vehicle,true,false,false)
			TriggerClientEvent('esx:showNotification', _source, "You turned the engine off.")
		end
		
		while (IsEngineOn == false) do
			SetVehicleUndriveable(vehicle,true)
			Citizen.Wait(0)
		end
	end
end)

RegisterNetEvent('engineoff')
AddEventHandler('engineoff',function() 
		local player = GetPlayerPed(-1)

        if (IsPedSittingInAnyVehicle(player)) then 
            local vehicle = GetVehiclePedIsIn(player,false)
			engineoff = true
			--ShowNotification("Engine ~r~off~s~.")
			TriggerClientEvent('esx:showNotification', _source, "Your turned the engine off.")
			while (engineoff) do
			SetVehicleEngineOn(vehicle,false,false,false)
			SetVehicleUndriveable(vehicle,true)
			Citizen.Wait(0)
			end
		end
end)
RegisterNetEvent('engineon')
AddEventHandler('engineon',function() 
    local player = GetPlayerPed(-1)

        if (IsPedSittingInAnyVehicle(player)) then 
            local vehicle = GetVehiclePedIsIn(player,false)
			engineoff = false
			SetVehicleUndriveable(vehicle,false)
			SetVehicleEngineOn(vehicle,true,false,false)
			--ShowNotification("Engine ~g~on~s~.")
			TriggerClientEvent('esx:showNotification', _source, "You turned the engine on.")
	end
end)
-- T R U N K --
RegisterNetEvent('trunk')
AddEventHandler('trunk',function() 
	local player = GetPlayerPed(-1)
			if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,5)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,5,0,0)
				else
				SetVehicleDoorShut(vehicle,5,0)
				end
			else
				TriggerClientEvent('esx:showNotification', _source, "You must be in your vehicle to do that.")
			end
end)
-- LEFT DOOR --
RegisterNetEvent('ldoor')
AddEventHandler('ldoor',function() 
	local player = GetPlayerPed(-1)
			if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,1)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,1,0,0)
				else
				SetVehicleDoorShut(vehicle,1,0)
				end
			else
				--ShowNotification("~r~You must be near your vehicle to do that.")
				TriggerClientEvent('esx:showNotification', _source, "You must be in your vehicle to do that.")
			end
end)
-- RIGHT DOOR --
RegisterNetEvent('rdoor')
AddEventHandler('rdoor',function() 
	local player = GetPlayerPed(-1)
			if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,2)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,2,0,0)
				else
				SetVehicleDoorShut(vehicle,2,0)
				end
			else
				--ShowNotification("~r~You must be near your vehicle to do that.")
				TriggerClientEvent('esx:showNotification', _source, "You must be in your vehicle to do that.")
			end
end)
-- LEFT-REAR DOOR --
RegisterNetEvent('lrdoor')
AddEventHandler('lrdoor',function() 
	local player = GetPlayerPed(-1)
			if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,3)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,3,0,0)
				else
				SetVehicleDoorShut(vehicle,3,0)
				end
			else
				--ShowNotification("~r~You must be near your vehicle to do that.")
				TriggerClientEvent('esx:showNotification', _source, "You must be in your vehicle to do that.")
			end
end)
-- RIGHT-REAR DOOR --
RegisterNetEvent('rrdoor')
AddEventHandler('rrdoor',function() 
	local player = GetPlayerPed(-1)
			if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,4)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,4,0,0)
				else
				SetVehicleDoorShut(vehicle,4,0)
				end
			else
				--ShowNotification("~r~You must be near your vehicle to do that.")
				TriggerClientEvent('esx:showNotification', _source, "You must be in your vehicle to do that.")
			end
end)
-- R E A R  D O O R S --
RegisterNetEvent('rdoors')
AddEventHandler('rdoors',function() 
	local player = GetPlayerPed(-1)
    		if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			local isopen = GetVehicleDoorAngleRatio(vehicle,2) and GetVehicleDoorAngleRatio(vehicle,3)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,2,0,0)
				SetVehicleDoorOpen(vehicle,3,0,0)
				else
				SetVehicleDoorShut(vehicle,2,0)
				SetVehicleDoorShut(vehicle,3,0)
				end
			else
				--ShowNotification("~r~You must be near your vehicle to do that.")
				TriggerClientEvent('esx:showNotification', _source, "You must be in your vehicle to do that.")
			end
end)		

-- H O O D --
RegisterNetEvent('hood')
AddEventHandler('hood',function() 
	local player = GetPlayerPed(-1)
    	if controlsave_bool == true then
			vehicle = saveVehicle
		else
			vehicle = GetVehiclePedIsIn(player,true)
		end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,4)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,4,0,0)
				else
				SetVehicleDoorShut(vehicle,4,0)
				end
			else
				--ShowNotification("~r~You must be near your vehicle to do that.")
				TriggerClientEvent('esx:showNotification', _source, "You must be in your vehicle to do that.")
			end
end)
