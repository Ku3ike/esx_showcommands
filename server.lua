ESX = nil
local RegisteredSocieties = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

local function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

local function getBlackMoneyFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('black_money')
	return account.money

end

local function getBankFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('bank')
	return account.money

end
	
TriggerEvent('es:addCommand', 'showjob', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.label
    local jobgrade = xPlayer.job.grade_label

--TriggerClientEvent('esx:showNotification', _source, 'Pracujes jako: ~g~' .. job .. ' ~s~-~g~ ' .. jobgrade)
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Pracujea jako: ' .. job .. ' - ' .. jobgrade})  
end, {help = "Check what job you have"})

TriggerEvent('es:addCommand', 'showcash', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local wallet 		= getMoneyFromUser(_source)

--TriggerClientEvent('esx:showNotification', _source, 'Prave mas ~g~$~g~' .. wallet .. ' ~s~v penezence~g~ ')
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Prave mas $' .. wallet .. ' v penezence'})
end, {help = "Check how much is in your wallet"})

TriggerEvent('es:addCommand', 'showbank', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local bank 			= getBankFromUser(_source)

--TriggerClientEvent('esx:showNotification', _source, 'Prave mas ~g~$~g~' .. bank .. ' ~s~v bance~g~ ')
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Prave mas $' .. bank .. ' v bance'})
end, {help = "Check how much is in your bank"})

TriggerEvent('es:addCommand', 'showdirty', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local black_money 	= getBlackMoneyFromUser(_source)

--TriggerClientEvent('esx:showNotification', _source, 'Prave mas ~g~$~g~' .. black_money .. ' ~s~spinavych penez v kapse~g~ ')
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Prave mas $' .. black_money .. ' spinavych penez v kapse'})
end, {help = "Check how much dirty money you have"})

TriggerEvent('es:addCommand', 'showinfo', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.label
    local jobgrade = xPlayer.job.grade_label
    local wallet 		= getMoneyFromUser(_source)
    local bank 			= getBankFromUser(_source)
    local black_money 	= getBlackMoneyFromUser(_source)
    if xPlayer.job.grade_name == 'boss' then
		local society = GetSociety(xPlayer.job.name)

		if society ~= nil then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				money = account.money
			end)
		else
			money = 0
		end

                TriggerClientEvent('esx:showNotification', _source, 'Pracujes jako: ~g~' .. job .. ' ~s~-~g~ ' .. jobgrade)	         
                --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Pracujes jako: ' .. job .. ' - ' .. jobgrade})
                Citizen.Wait(1500)
                TriggerClientEvent('esx:showNotification', _source, 'Prave mas ~g~$~g~' .. wallet .. ' ~s~v penezence~g~ ')
                --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Prave mas $' .. wallet .. ' v penezence'})
                Citizen.Wait(1500)
                TriggerClientEvent('esx:showNotification', _source, 'Prave mas ~g~$~g~' .. bank .. ' ~s~v bance~g~ ')
                --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Prave mas $' .. bank .. ' v bance'})
                Citizen.Wait(1500)
                TriggerClientEvent('esx:showNotification', _source, 'Prave mas ~g~$~g~' .. black_money .. ' ~s~spinavych penez v kapse~g~ ')
                --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Prave mas $' .. black_money .. ' spinavych penez v kapse'})
                Citizen.Wait(1500)
                TriggerClientEvent('esx:showNotification', _source, 'Prave mas ~g~$~g~' .. money .. ' ~s~ve firme~g~ ')
                --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Prave mas $' .. money .. ' ve firme'})
																	
	else

                TriggerClientEvent('esx:showNotification', _source, 'Pracujes jako:: ~g~' .. job .. ' ~s~-~g~ ' .. jobgrade)	         
                --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Pracujes jako: ' .. job .. ' - ' .. jobgrade})
                Citizen.Wait(1500)
                TriggerClientEvent('esx:showNotification', _source, 'Prave mas ~g~$~g~' .. wallet .. ' ~s~v penezence~g~ ')
                --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Prave mas $' .. wallet .. ' v penezence'})
                Citizen.Wait(1500)
                TriggerClientEvent('esx:showNotification', _source, 'Prave mas ~g~$~g~' .. bank .. ' ~s~v bance~g~ ')
                --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Prave mas $' .. bank .. ' v bance'})
                Citizen.Wait(1500)
                TriggerClientEvent('esx:showNotification', _source, 'Prave mas ~g~$~g~' .. black_money .. ' ~s~spinavych penez v kapse~g~ ')
                --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Prave mas $' .. black_money .. ' spinavych penez v kapse'})
                Citizen.Wait(1500)
	        TriggerClientEvent('esx:showNotification', _source, '~r~Nemas pristup!')
                --TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Nemas pristup!'})
																	
	end
end, {help = "Check your society's balance"})

TriggerEvent('es:addCommand', 'showsociety', function(source)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.job.grade_name == 'boss' then
		local society = GetSociety(xPlayer.job.name)

		if society ~= nil then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				money = account.money
			end)
		else
			money = 0
		end
		
                --TriggerClientEvent('esx:showNotification', _source, 'Prave mas ~g~$~g~' .. money .. ' ~s~ve firme~g~ ')
	        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Prave mas $' .. money .. ' ve firme'})
																	
	else

	        --TriggerClientEvent('esx:showNotification', _source, '~r~Nemas pristup!')
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Nemas pristup!'})
																			
	end
end, {help = "Check your society's balance"})

TriggerEvent('esx_society:getSocieties', function(societies) 
	RegisteredSocieties = societies
end)

function GetSociety(name)
  for i=1, #RegisteredSocieties, 1 do
    if RegisteredSocieties[i].name == name then
      return RegisteredSocieties[i]
    end
  end
end
