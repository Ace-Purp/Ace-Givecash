if config.Framework == "esx" then
    RegisterCommand('givecash', function(source, args, rawCommand)
        ESX = nil TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        local xPlayer = ESX.GetPlayerFromId(source)
        local target = ESX.GetPlayerFromId(tonumber(args[1]))
        
        if target ~= nil then
            local amount = tonumber(args[2])
            if amount ~= nil then
                local playerPed = GetPlayerPed(source)
                local targetPed = GetPlayerPed(tonumber(args[1]))
                
                local playerMoney = xPlayer.getMoney()

                if playerMoney >= amount then
                    local playerCoords = GetEntityCoords(playerPed)
                    local targetCoords = GetEntityCoords(targetPed)
                    
                    if #(playerCoords - targetCoords) < config.range then
                        xPlayer.removeMoney(amount)
                        TriggerClientEvent('esx:showNotification', source, 'You gave $' .. amount .. ' to ' .. GetPlayerName(target.source))
                        target.addMoney(amount)
                        TriggerClientEvent('esx:showNotification', target.source, 'You received $' .. amount .. ' from ' .. GetPlayerName(source))
                    else
                        TriggerClientEvent('esx:showNotification', source, 'You are too far away from ' .. GetPlayerName(target.source))
                    end
                else
                    TriggerClientEvent('esx:showNotification', source, 'You do not have enough money')
                end
            else
                TriggerClientEvent('esx:showNotification', source, 'Invalid amount')
            end
        else
            TriggerClientEvent('esx:showNotification', source, 'Invalid player id')
        end
    end, false)

    RegisterCommand('givedirtycash', function(source, args, rawCommand)
        local xPlayer = ESX.GetPlayerFromId(source)
        local target = ESX.GetPlayerFromId(tonumber(args[1]))
        
        local account = config.dirtyMoneyAccount

        if target ~= nil then
            local amount = tonumber(args[2])
            if amount ~= nil then
                local playerPed = GetPlayerPed(source)
                local targetPed = GetPlayerPed(tonumber(args[1]))
                
                local playerDarkMoney = xPlayer.getAccount(account).money

                if playerDarkMoney >= amount then
                    local playerCoords = GetEntityCoords(playerPed)
                    local targetCoords = GetEntityCoords(targetPed)
                    
                    if #(playerCoords - targetCoords) < config.range then
                        xPlayer.removeAccountMoney(account, amount)
                        TriggerClientEvent('esx:showNotification', source, 'You gave $' .. amount .. ' of dirty money to ' .. GetPlayerName(target.source))
                        target.addAccountMoney(account, amount)
                        TriggerClientEvent('esx:showNotification', target.source, 'You received $' .. amount .. ' of dirty money from ' .. GetPlayerName(source))
                    else
                        TriggerClientEvent('esx:showNotification', source, 'You are too far away from ' .. GetPlayerName(target.source))
                    end
                else
                    TriggerClientEvent('esx:showNotification', source, 'You do not have enough dirty money')
                end
            else
                TriggerClientEvent('esx:showNotification', source, 'Invalid amount')
            end
        else
            TriggerClientEvent('esx:showNotification', source, 'Invalid player id')
        end
    end, false)
elseif(config.Framework == "qbus")then
    RegisterCommand('givecash', function(source, args, rawCommand)
        QBCore = nil TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        local target = QBCore.Functions.GetPlayer(tonumber(args[1]))
        
        if target ~= nil then
            local amount = tonumber(args[2])
            if amount ~= nil then
                local playerPed = GetPlayerPed(source)
                local targetPed = GetPlayerPed(tonumber(args[1]))
                
                local playerMoney = xPlayer.getMoney()

                if playerMoney >= amount then
                    local playerCoords = GetEntityCoords(playerPed)
                    local targetCoords = GetEntityCoords(targetPed)
                    
                    if #(playerCoords - targetCoords) < config.range then
                        xPlayer.removeMoney(amount)
                        TriggerClientEvent('QBCore:Notify', source, 'You gave $' .. amount .. ' to ' .. GetPlayerName(target.source))
                        target.addMoney(amount)
                        TriggerClientEvent('QBCore:Notify', target.source, 'You received $' .. amount .. ' from ' .. GetPlayerName(source))
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'You are too far away from ' .. GetPlayerName(target.source))
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You do not have enough money')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Invalid amount')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'Invalid player id')
        end
    end, false)

    RegisterCommand('givedirtycash', function(source, args, rawCommand)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        local target = QBCore.Functions.GetPlayer(tonumber(args[1]))
        
        local account = config.dirtyMoneyAccount

        if target ~= nil then
            local amount = tonumber(args[2])
            if amount ~= nil then
                local playerPed = GetPlayerPed(source)
                local targetPed = GetPlayerPed(tonumber(args[1]))
                
                local playerDarkMoney = xPlayer.getAccount(account).money

                if playerDarkMoney >= amount then
                    local playerCoords = GetEntityCoords(playerPed)
                    local targetCoords = GetEntityCoords(targetPed)
                    
                    if #(playerCoords - targetCoords) < config.range then
                        xPlayer.removeAccountMoney(account, amount)
                        TriggerClientEvent('QBCore:Notify', source, 'You gave $' .. amount .. ' of dirty money to ' .. GetPlayerName(target.source))
                        target.addAccountMoney(account, amount)
                        TriggerClientEvent('QBCore:Notify', target.source, 'You received $' .. amount .. ' of dirty money from ' .. GetPlayerName(source))
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'You are too far away from ' .. GetPlayerName(target.source))
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You do not have enough dirty money')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Invalid amount')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'Invalid player id')
        end
    end, false)
end