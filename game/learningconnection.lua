local socket = require "socket"

local LearningConnection = {}

function LearningConnection:new(address, port)
    print("LearningConnection, address", address, "port", port)
    self.tcp = socket.tcp()
    self.tcp.connect(address, port)
end

function LearningConnection:sendData(data)
end

function LearningConnection:close()
    print("LearningConnection#close()")
    self.tcp.close()
end

return {
    LearningConnection = function(_, ...)
        local o = setmetatable({}, {
            __index = LearningConnection
        })
        o:new(...)
        return o
    end
}