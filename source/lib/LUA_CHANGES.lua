-- Tiny snippet to bring a sort-of `require` functionality,
-- where return values of a module (or pdz files in this case)
-- will be cached, and the file only be run once.
-- After `import`ing this file in your main file, you can use `require` similar to how you would in basic Lua.
-- This also adds convenience wrappers around `playdate.file.load()` and `playdate.file.run()`,
-- to pose as `loadfile()` and `dofile()` respectively.

local pd <const> = playdate

local seen <const> = {}
local cache <const> = {}

function loadfile(pdzFile, ...)
  return pd.file.load(pdzFile, ...)
end

local loadfile <const> = loadfile
local assert <const> = assert

function dofile (filename)
  local f = assert(loadfile(filename))
  return f()
end

local dofile <const> = dofile

function require(pdzFile)
  print("Require: " .. pdzFile)
  if seen[pdzFile] then
    return cache[pdzFile]
  end
  local value = dofile(pdzFile)
  seen[pdzFile] = true
  cache[pdzFile] = value
  return value
end
