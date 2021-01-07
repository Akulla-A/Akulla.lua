local emotes_suggestions = {
    "👍", "👎",
}

local m = {}
m.type = "messageCreate"
m.e = { "👍", "👎" }

function m:Func(msg)
    if msg.channel and string.lower(msg.channel.name) == "suggestions" then
        for k,v in pairs(self.e) do
            msg:addReaction(v)
        end
    end
end

return m