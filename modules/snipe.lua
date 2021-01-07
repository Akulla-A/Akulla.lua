local m = {}
m.type = "messageCreate"

function m:Func(msg)
    if string.StartWith(msg.content, "a!snipe ") then
        local newmsg = string.Replace(msg.content, "a!snipe ", "")

        if not tonumber(newmsg) then return end
        
        local target_msg = msg.channel:getMessage(newmsg)

        if not target_msg then return end

        msg.channel:send({
            embed = {
                title = target_msg.content,
                description = "Par "..target_msg.member.user.username,
                type = "rich",
                color = msg.member.highestRole.color,
            },
        })
    end
end

return m