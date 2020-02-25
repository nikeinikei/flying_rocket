--test file
--used testing framework: busted
--http://olivinelabs.com/busted/

local Vec = require "vec"

describe("math tests", function()
    describe("vec tests", function()
        it("+ with 2 vectors", function()
            local a = Vec(1, 2)
            local b = Vec(2, 3)
            local c = a + b
            assert(c.x == 3)
            assert(c.y == 5)
        end)

        it("+ with number at the first place", function()
            local a = 5
            local b = Vec(1, 2)
            local c = a + b
            assert(c.x == 6)
            assert(c.y == 7)
        end)

        it("+ with number at the second place", function()
            local a = 5
            local b = Vec(1, 2)
            local c = b + a
            assert(c.x == 6)
            assert(c.y == 7)
        end)
    end)
end)
