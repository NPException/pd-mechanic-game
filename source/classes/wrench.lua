local gfx <const> = playdate.graphics

local wrenchImage = gfx.image.new("images/wrench")

local Wrench = {}
class("Wrench", Wrench, {}).extends(gfx.sprite)

function Wrench:init(x, y)
  self:moveTo(x, y)
  self:setImage(wrenchImage)
  self:setCenter(0.0927, 0.76)
  self:setRotation(0)
end

function Wrench:setRotation(angle)
  gfx.sprite.setRotation(self, angle - 90)
end

return Wrench
