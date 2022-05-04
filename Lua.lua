
local old_env = _ENV
local bkey = {
-- Blacklisted constants, if you want you could edit them.
}
_ENV = {["old_env"]=old_env,["bkey"]=bkey}

old_env["setmetatable"](_ENV,{
    __index = function(t,i)
        local isfound = false
        for _,v in old_env["pairs"](bkey) do
            if v == i then isfound = true end
        end
        if not isfound then 
        old_env["print"](i)
        end
        return old_env[i]
    end
})

old_env['pcall'](function()
-- Script here
end)
