local gfx <const> = playdate.graphics

local image = gfx.image.new("images/wrench")

local Wrench = {}
class("Wrench", Wrench, {}).extends(gfx.sprite)

function Wrench:init(x, y)
  self:setImage(image)
  self:setZIndex(10)
  self:setCenter(21/232, 34/45) -- center on point between the jaws
  self:moveTo(x, y)
  self:setAngle(0)
end

local prevAngle

function Wrench:setAngle(angle)
  local angle = math.floor(angle) - 90;
  if prevAngle == angle then
    return
  end
  prevAngle = angle
  self:setRotation(angle)
end

return Wrench
