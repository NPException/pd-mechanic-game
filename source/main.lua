import "lib/SDK_PATCHES"
import "lib/LUA_CHANGES"
import "CoreLibs/object"
import "CoreLibs/sprites"

local Wrench = require("classes/wrench")

local pd <const> = playdate
local gfx <const> = pd.graphics

-- unlock refresh rate
pd.display.setRefreshRate(0)

-- test if wrench position and rotation works by placing it at the center
local wrench = Wrench(200, 120)
wrench:add()

function playdate.update()
  wrench:setRotation(playdate.getCrankPosition())

  gfx.sprite.update()

  -- cross at center to check wrench alignment
  gfx.drawLine(200, 100, 200, 140)
  gfx.drawLine(180, 120, 220, 120)

  pd.drawFPS(0,0)
end
