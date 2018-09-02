-- E N G I N E --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/engine off" then
		CancelEvent()
		--------------
		TriggerClientEvent('engineoff', s)
	elseif message == "/engine on" then
		CancelEvent()
		--------------
		TriggerClientEvent('engineon', s)
	elseif message == "/engine" then
		CancelEvent()
		--------------
		TriggerClientEvent('engine', s)
	end
end)
-- T R U N K --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/trunk" then
		CancelEvent()
		--------------
		TriggerClientEvent('trunk', s)
	end
end)
-- L --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/ldoor" then
		CancelEvent()
		--------------
		TriggerClientEvent('ldoor', s)
	end
end)
-- R --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/rdoor" then
		CancelEvent()
		--------------
		TriggerClientEvent('rdoor', s)
	end
end)
-- LR --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/lrdoor" then
		CancelEvent()
		--------------
		TriggerClientEvent('lrdoor', s)
	end
end)
-- RR --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/rrdoor" then
		CancelEvent()
		--------------
		TriggerClientEvent('rrdoor', s)
	end
end)
-- R E A R  D O O R S --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/rdoors" then
		CancelEvent()
		--------------
		TriggerClientEvent('rdoors', s)
	end
end)
-- H O O D --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/hood" then
		CancelEvent()
		--------------
		TriggerClientEvent('hood', s)
	end
end)
