local DebugUtil = {}

function DebugUtil.getTableString(o, depth)
    local pad = function(str, msg, depth)
        local padding = string.rep(str, depth)
        return padding..msg
    end
    
    depth  = depth or 0
    local tabLen = (depth + 1) * 4
    local displayStr = ""
    
    displayStr = displayStr..pad(" ", "{", 0).."\n"
    for k,v in pairs(o) do
        displayStr = displayStr..pad(" ", k.." = ", tabLen)
        
        if type(v) == "table" then
            displayStr = displayStr..DebugUtil.getTableString(v, depth+1)
        else
            displayStr = displayStr..tostring(v)
        end
        
        displayStr = displayStr.."\n"
    end
    displayStr = displayStr..pad(" ", "}", depth * 4).."\n"
    
    return displayStr
end

return DebugUtil
