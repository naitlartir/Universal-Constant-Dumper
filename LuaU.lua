local old_env = getfenv()
local bkey = {
-- Blacklisted constants, if you want you could edit them.
  "getfenv",
    "bit32",
    "pairs",
    "select",
    "math",
    "rawset",
    "unpack",
    "setmetatable",
    "tonumber",
    "math",
    "type",
    "bit32",
    "table",
    "tostring",
    "bit"
}
getfenv = function()
    local new_env = {["old_env"]=old_env,["bkey"]=bkey}
    old_env["setmetatable"](new_env,{
    __index = function(t,i)
        local isfound = false
        for _,v in old_env["pairs"](bkey) do
            if v == i then isfound = true end
        end
        if not isfound then 
        old_env["print"](i)
        end
        return old_env[i]
    end,

    })
    return new_env
end

old_env['pcall'](function()
    --script
end)