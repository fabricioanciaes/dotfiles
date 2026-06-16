local config_dir = os.getenv("HOME") .. "/.config/hypr"
package.path = config_dir .. "/src/?.lua;" .. package.path

require("src.core")
require("src.monitors")
require("src.appearance")
require("src.input")
require("src.binds")
require("src.rules")
