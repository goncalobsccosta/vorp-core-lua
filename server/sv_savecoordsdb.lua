local LastCoordsInCache = {}
        
RegisterNetEvent('vorp:saveLastCoords', function(lastCoords, lastHeading)
    local source = source
    local identifier = GetSteamID(source)

    LastCoordsInCache[source] = {lastCoords, lastHeading}
    
    local characterCoords = json.encode({x = round(lastCoords.x, 2), y = round(lastCoords.y, 2), z = round(lastCoords.z, 2), heading = round(lastHeading, 2)})

    _users[identifier].GetUsedCharacter().Coords(characterCoords)
end)

RegisterNetEvent('vorp:ImDead', function(isDead)
    local source = source
    local identifier = GetSteamID(source)

    if _users[identifier] then
        _users[identifier].GetUsedCharacter().setDead(isDead)
    end
end)

function round(number, decimals)
    local power = 10^decimals
    return math.floor(number * power) / power
end
