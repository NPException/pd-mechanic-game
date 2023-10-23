local gfx <const> = playdate.graphics

local function generateRotatedImages()
  local wrenchImage = gfx.image.new("images/wrench")

  local w, h = wrenchImage:getSize()

  local transform = playdate.geometry.affineTransform.new()
  transform:translate(w / 2, h / 2)
  transform:translate(-21.5, -34.5) -- attachment point
  transform:rotate(-90)

  -- reduce necessary width roughly by the attachement point offset
  local imgWidth = (w - 20) * 2
  local imgCenter = imgWidth / 2

  local img = gfx.image.new(imgWidth, imgWidth)
  for i = 0, 179 do
    gfx.pushContext(img)
    gfx.clear()
    wrenchImage:drawWithTransform(transform:rotatedBy(i), imgCenter, imgCenter)
    gfx.popContext()
    playdate.datastore.writeImage(img, "wrench/wrench_rotated-table-" .. (i + 1) .. ".gif")
  end
end

-- generateRotatedImages()

local wrenchImages <const> = gfx.imagetable.new("images/wrench/wrench_rotated")

local Wrench = {}
class("Wrench", Wrench, {}).extends(gfx.sprite)

function Wrench:init(x, y)
  self:moveTo(x, y)
  self:setAngle(0)
end

local prevAngle

function Wrench:setAngle(angle)
  local angle = math.floor(angle);
  if prevAngle == angle then
    return
  end
  prevAngle = angle
  self:setImage(wrenchImages[angle % 180 + 1])
  self:setImageFlip(angle >= 180 and gfx.kImageFlippedXY or gfx.kImageUnflipped)
end

return Wrench
