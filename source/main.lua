import "lib/SDK_PATCHES"
import "lib/LUA_CHANGES"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/graphics"

local Wrench = require("classes/wrench")

local pd <const> = playdate
local gfx <const> = pd.graphics

-- unlock refresh rate
pd.display.setRefreshRate(0)

-- test if wrench position and rotation works by placing it at the center
local wrench = Wrench(200, 120)
wrench:add()

function playdate.update()
  wrench:setAngle(playdate.getCrankPosition())

  gfx.sprite.update()

  -- circle at center to check wrench alignment
  gfx.drawCircleAtPoint(200, 120, 7)

  pd.drawFPS(0, 0)
end
