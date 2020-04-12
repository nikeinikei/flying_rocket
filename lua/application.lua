local Stack = require "util.stack"

local LOVE_CALLBACKS = {
    "directorydropped",
    "draw",
    "errhand",
    "errorhandler",
    "filedropped",
    "focus",
    "keypressed",
    "keyreleased",
    "lowmemory",
    "mousefocus",
    "mousemoved",
    "mousepressed",
    "mousereleased",
    "resize",
    "textedited",
    "textinput",
    "threaderror",
    "touchmoved",
    "touchpressed",
    "touchreleased",
    "update",
    "visible",
    "wheelmoved"
}


local states = Stack()
local usedCallbacks = {}


local function resetCallbacks()
    
end

local function makeActive()

end

local function makeInactive()

end

---the global application table
---this will handle all the löve specific callbacks
---for each state
Application = {
    ---@param state Gamestate
    pushState = function(state)
        assertTable(state)

        if state.enter ~= nil then
            state:enter()
        end

        local top = states:peek()
        if top ~= nil and top.leave ~= nil then
            top:leave()
        end

        --reset all callbacks that are currently in use
        for _, callback in ipairs(usedCallbacks) do
            love[callback] = nil
        end
        usedCallbacks = {}

        --set the new callbacks
        for _, loveCallback in ipairs(LOVE_CALLBACKS) do
            if state[loveCallback] then
                --we don't know the arguments for each function so just forward them
                love[loveCallback] = function(...)
                    state[loveCallback](state, ...)
                end
                table.insert(usedCallbacks, loveCallback)
            end
        end

        --push onto the stack
        states:push(state)
    end,
    popState = function()
        for _, callback in ipairs(usedCallbacks) do
            love[callback] = nil
        end
        usedCallbacks = {}

        local s = states:pop()
        if s.leave ~= nil then
            s:leave()
        end

        local top = states:peek()
        if top ~= nil then
            if top.enter ~= nil then
                top:enter()
            end

            for _, loveCallback in ipairs(LOVE_CALLBACKS) do
                if top[loveCallback] then
                    love[loveCallback] = function(...)
                        top[loveCallback](top, ...)
                    end
                    table.insert(usedCallbacks, loveCallback)
                end
            end
        else
            love.event.quit()
        end
    end
}
