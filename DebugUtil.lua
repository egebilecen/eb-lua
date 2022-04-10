local DebugUtil = {}

function DebugUtility.GetTableString(o, depth)
    if type(o) ~= "table" then
        return "Given parameter is not a table."
    end

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
            displayStr = displayStr..DebugUtility.getTableString(v, depth+1)
        else
            displayStr = displayStr..tostring(v).." ("..type(v)..")"
        end
        
        displayStr = displayStr.."\n"
    end
    displayStr = displayStr..pad(" ", "}", depth * 4).."\n"
    
    return displayStr
end

function DebugUtility.TypeAndString(o)
    return "("..type(o)..") "..tostring(o)
end

return DebugUtil
