local m = {}
m.type = "messageCreate"

function m:Func(msg)
    if string.StartWith(msg.content, "a!fancy_text ") then
        local newmsg = string.Replace(msg.content, "a!fancy_text ", "")

        msg:delete()

        msg.channel:send({
            embed = {
                title = newmsg,
                description = "Par "..msg.member.user.username,
                type = "rich",
                color = msg.member.highestRole.color,
            },
        })
    end
end

return m