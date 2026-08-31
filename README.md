# randomencounters

Repository created to host small, safe example scripts you can load via raw.githubusercontent.com.

Usage (example):

- Raw URL for the main example script:
  https://raw.githubusercontent.com/peristefedits-max/randomencounters/main/scripts/randomencounter.lua

- Example loader (Roblox) using loadstring and game:HttpGet:

  local url = "https://raw.githubusercontent.com/peristefedits-max/randomencounters/main/scripts/randomencounter.lua"
  local chunk = game:HttpGet(url)
  local ok, module = pcall(loadstring, chunk)
  if not ok then error("Failed to load: "..tostring(module)) end
  if type(module) == "table" and module.run then module.run() elseif type(module) == "function" then module() end

Files added:
- scripts/randomencounter.lua
- scripts/loader_example.lua
- README.md
