local random = Random.new()

return function(Table : {{percentage: number, callback: any}})
    local maxPercentage = 0
    for i, value in Table do
        maxPercentage += value.percentage
    end
    
    for i, value in Table do
        local percentage = value.percentage
        local callback = value.callback
        
        local randomNumber = random:NextNumber(0, maxPercentage)
        if randomNumber >= percentage then continue end
        if type(callback) == "function" then callback() return end
        return callback
    end
    
    if typeof(Table[1].callback) == "function" then Table[1].callback() return end
    return Table[1].callback
end
