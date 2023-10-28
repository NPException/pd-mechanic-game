local gfx <const> = playdate.graphics

local image = gfx.image.new("images/nut")

local Nut = {}
class("Nut", Nut, {}).extends(gfx.sprite)

function Nut:init(x, y)
  self:setImage(image)
  self:moveTo(x, y)
  self:setAngle(0)
end

local prevAngle

function Nut:setAngle(angle)
  local angle = math.floor(angle);
  if prevAngle == angle then
    return
  end
  self:setRotation(angle)
end

return Nut
