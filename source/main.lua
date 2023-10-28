import "lib/SDK_PATCHES"
import "lib/LUA_CHANGES"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/graphics"

local Wrench = require("classes/wrench")
local Nut = require("classes/nut")

local pd <const> = playdate
local gfx <const> = pd.graphics

-- unlock refresh rate
pd.display.setRefreshRate(0)

-- test if wrench position and rotation works by placing it at the center
local wrench = Wrench(200, 120)
wrench:add()

local nut = Nut(200,120)
nut:add()

function playdate.update()
  wrench:setAngle(playdate.getCrankPosition())
  nut:setAngle(playdate.getCrankPosition())

  gfx.sprite.update()

  pd.drawFPS(0, 0)
end
