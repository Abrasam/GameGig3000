Blobby = {}

function Blobby:new(xx, yy)
  local fields = {x=xx, y=yy, safe=false, t=0, imageFile=love.graphics.newImage("assets/img/blob.png")}
  self.__index = self
  return setmetatable(fields, self)
end

function Blobby:delta(dt)
  if self.safe then
    return
  end
  self.t = self.t + dt
end

function Blobby:draw()
  if self.t > 0.5 then
    self.t = 0
  end
  love.graphics.draw(self.imageFile, self.x, self.y, math.pi, 0.25, 0.25*math.sin(0.93+self.t*2*1.27))
end