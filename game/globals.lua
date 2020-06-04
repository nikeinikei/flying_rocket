require "util.asserts"
require "application"

if not table.unpack then
    table.unpack = unpack
end
dbg = require "util.dbg"