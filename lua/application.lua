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
    --reset all callbacks that are currently in use
    for _, callback in ipairs(usedCallbacks) do
        love[callback] = nil
    end
    usedCallbacks = {}
end

local emptyTable = {}

local function makeActive(state)
    if state.enter then
        state:enter()
    end

    local objects = (state.getObjects and state:getObjects()) or emptyTable
    local objectsLen = #objects

    for _, loveCallback in ipairs(LOVE_CALLBACKS) do
        local objectsThatUseCallback = {}
        for i = 1, objectsLen do
            if objects[i][loveCallback] then
                table.insert(objectsThatUseCallback, objects[i])
            end
        end
        local objectsThatUseCallbackLen = #objectsThatUseCallback
        local hasObjectsThatUseCallback = objectsThatUseCallbackLen > 0 

        if state[loveCallback] or hasObjectsThatUseCallback then
            --we don't know the arguments for each function so just forward them
            if state[loveCallback] and not hasObjectsThatUseCallback then
                love[loveCallback] = function(...)
                    state[loveCallback](state, ...)
                end
            elseif not state[loveCallback] and hasObjectsThatUseCallback then
                love[loveCallback] = function(...)
                    for i = 1, objectsThatUseCallbackLen do
                        objectsThatUseCallback[i][loveCallback](objectsThatUseCallback[i], ...)
                    end
                end
            else
                love[loveCallback] = function(...)
                    state[loveCallback](state, ...)
                    for i = 1, objectsThatUseCallbackLen do
                        objectsThatUseCallback[i][loveCallback](objectsThatUseCallback[i], ...)
                    end
                end
            end

            table.insert(usedCallbacks, loveCallback)
        end
    end
end

local function makeInactive(state)
    if state.leave ~= nil then
        state:leave()
    end
end

---the global application table
---this will handle all the löve specific callbacks
---for each state
Application = {
    ---@param state Gamestate
    pushState = function(state)
        assertTable(state)

        local top = states:peek()
        if top ~= nil then
            makeInactive(state)
        end

        resetCallbacks()

        makeActive(state)

        --push onto the stack
        states:push(state)
    end,
    popState = function()
        resetCallbacks()

        local state = states:pop()
        makeInactive(state)

        local top = states:peek()
        if top ~= nil then
            makeActive(top)
        else
            love.event.quit()
        end
    end
}
