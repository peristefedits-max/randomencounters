-- loader_example.lua
-- Demonstrates loading the remote module and running it.
local url = "https://raw.githubusercontent.com/peristefedits-max/randomencounters/main/scripts/randomencounter.lua"
local ok, chunk = pcall(function() return game:HttpGet(url) end)
if not ok then error("HttpGet failed: " .. tostring(chunk)) end

local ok2, moduleOrErr = pcall(loadstring, chunk)
if not ok2 then error("loadstring failed: " .. tostring(moduleOrErr)) end

local result = moduleOrErr()
if type(result) == "table" and result.run then
  result.run()
elseif type(result) == "function" then
  result()
else
  print("Loaded module doesn't expose run() or return a callable.")
end
