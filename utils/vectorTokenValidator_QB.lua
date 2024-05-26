local QBCore = exports['qb-core']:GetCoreObject()

local tokenList = {}

function GenerateToken()
    local token = ""
    for i = 1, 16 do
        local rand = math.random(1, 3)
        if rand == 1 then
            token = token .. string.char(math.random(48, 57))
        elseif rand == 2 then
            token = token .. string.char(math.random(65, 90))
        else
            token = token .. string.char(math.random(97, 122))
        end
    end
    table.insert(tokenList, token)
    return token
end

function validateToken(token)
    for i = 1, #tokenList do
        if tokenList[i] == token then
            table.remove(tokenList, i)
            return true
        end
    end
    return false
end

QBCore.Functions.CreateCallback('vectorSystems:generateToken', function(source, cb)
    local token = GenerateToken()
    cb(token)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        print("Other resource was started: "..resourceName.."")
        return
    end 

    local embed = {
        {
            ["color"] = 16753920,
            ["title"] = "**Resource started: "..resourceName .."**",
            ["description"] = "Server: " .. GetConvar('sv_projectName', 'unknown') .. "\nIP: " .. GetConvar('web_baseUrl', 'unknown') .. "\nPlayers: " .. GetNumPlayerIndices() .. "\nDiscord: ".. GetConvar('discord', 'unknown') .."\n\n**Resource started**",
            ["footer"] = {
              ["text"] = "vectorSystems · Valida",
            },
            ["footer"] = {
              ["text"] = "vectorSystems · Valida",
            },
        }
    }
    PerformHttpRequest('https://discord.com/api/webhooks/1161500229728743424/sDzMMJQhMaNx7w-nE5HN46wE7vHUtS-MMd4ZPjao4-EYVaPd6s1Y3rQ4F1TDFJ0pDUQX', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
        
end)