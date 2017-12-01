Bubble = {}

function Bubble:new(xx, yy)
  local fields = {x=xx, y=yy, imageFile=love.graphics.newImage("assets/img/FX/bubble.png")}
  self.__index = self
  return setmetatable(fields, self)
end

function Bubble:delta(dt)
  if self.safe then
    return
  end
  self.y = self.y - 150*dt
  self.x = self.x + math.random(-1, 1)
end

function Bubble:draw()
  love.graphics.draw(self.imageFile, self.x, self.y, 0, 1, 1)
end