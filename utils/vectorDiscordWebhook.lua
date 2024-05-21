function sendToDiscord(color, name, message)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                ["text"] = "vectorSystems · Token Validator",
              },
          }
      }
  
    PerformHttpRequest(Config.discordWebhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end