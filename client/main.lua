CreateThread(function()
    if(config.Framework == "esx")then
        TriggerEvent('chat:addSuggestion', '/givecash', 'Give other player your money', {
        { name="id", help="other player ID" },
        { name="amount", help="amount of money to give" }
        })

        TriggerEvent('chat:addSuggestion', '/givedirtycash', 'Give other player your dirty money', {
        { name="id", help="other player ID" },
        { name="amount", help="amount of dirty money to give" }
        })
    end
end)

CreateThread(function()
    if(config.Framework == "qbus")then
        TriggerEvent('chat:addSuggestion', '/givecash', 'Give other player your money', {
        { name="id", help="other player ID" },
        { name="amount", help="amount of money to give" }
        })

        TriggerEvent('chat:addSuggestion', '/givedirtycash', 'Give other player your dirty money', {
        { name="id", help="other player ID" },
        { name="amount", help="amount of dirty money to give" }
        })
    end
end)
