local char_to_emote = {
    ["a"] = "🇦",
    ["b"] = "🇧",
    ["c"] = "🇨",
    ["d"] = "🇩",
    ["e"] = "🇪",
    ["f"] = "🇫",
    ["g"] = "🇬",
    ["h"] = "🇭",
    ["i"] = "🇮",
    ["j"] = "🇯",
    ["k"] = "🇰",
    ["l"] = "󠁌󠁌🇱",
    ["m"] = "🇲",
    ["n"] = "🇳",
    ["o"] = "🇴",
    ["p"] = "🇵",
    ["q"] = "🇶",
    ["r"] = "🇷",
    ["s"] = "🇸",
    ["t"] = "🇹",
    ["u"] = "🇺",
    ["v"] = "🇻",
    ["w"] = "🇼",
    ["x"] = "🇽",
    ["y"] = "🇾",
    ["z"] = "🇿",

    ["0"] = "0️⃣",
    ["1"] = "1️⃣",
    ["2"] = "2️⃣",
    ["3"] = "3️⃣",
    ["4"] = "4️⃣",
    ["5"] = "5️⃣",
    ["6"] = "6️⃣",
    ["7"] = "7️⃣",
    ["8"] = "8️⃣",
    ["9"] = "9️⃣",
}

local m = {}
m.type = "messageCreate"
m.emotes = {}
m.enable = false
m.channel = ""
m.emotetxt = char_to_emote

function m:Func(msg)
    if string.StartWith(msg.content, "a!reaction_spam") then
        local newmsg = string.lower(string.Replace(msg.content, "a!reaction_spam ", ""))

        if msg.content == "+reaction_spam" then 
            self.emotes = {}
            self.enable = false
        else
            if newmsg and string.len(newmsg) ~= 0 then
                for i = 1, string.len( newmsg ) do
                    local char_emote = self.emotetxt[string.sub( newmsg, i, i )]

                    if char_emote then
                        table.insert(self.emotes, char_emote)
                    end
                end
                self.enable = true
                self.channel = msg.channel.id
            end
        end
    end

    if self.enable and msg.channel.id == self.channel then
        for k,v in pairs(self.emotes) do
            msg:addReaction(v)
        end
    end
end

return m