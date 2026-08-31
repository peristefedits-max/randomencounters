-- randomencounter.lua
-- A harmless example module that exposes run()
local M = {}

local messages = {
  "A wandering merchant appears.",
  "You find a hidden treasure chest.",
  "A friendly NPC offers help.",
  "A mysterious riddle is whispered to you."
}

function M.run()
  math.randomseed(tick())
  local i = math.random(1, #messages)
  print("[RandomEncounter] " .. messages[i])
end

return M
