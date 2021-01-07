local m = {}
m.type = "messageCreate"

function m:Func(msg)
    if string.StartWith(msg.content, "a!write ") then
        local newmsg = string.Replace(msg.content, "a!write ", "")

        if string.len(newmsg) ~= 0 then
            msg.channel:send(newmsg)
            msg:delete()
        end
    end
end

return m