local m = {}
m.type = "messageCreate"

function m:Func(msg)
    if string.StartWith(msg.content, "a!slowdown ") then
        local newmsg = tonumber(string.Replace(msg.content, "a!slowdown ", ""))

        if newmsg then
            msg.channel:setRateLimit(newmsg)
            msg:delete()
            local txt = (newmsg == 0 and "Slowdown retiré" or "Slowdown ajouté ("..newmsg.."s)")

            msg.channel:send({
                embed = {
                    title = txt,
                    description = "Par "..msg.member.user.username,
                    type = "rich",
                    color = msg.member.highestRole.color,
                },
            })
        end
    end
end

return m