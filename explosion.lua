Explosion = {}

explFrames = {}
imageFile = love.graphics.newImage("assets/img/FX/explosion-big.png")
for i=1,10 do
  explFrames[i] = love.graphics.newQuad((i-1)*78,0,78,87,imageFile:getDimensions())
end

function Explosion:new(xx, yy)
  local fields = {x=xx, y=yy, t=0, dead=false}
  self.__index = self
  return setmetatable(fields, self)
end

function Explosion:delta(dt)
  self.t = self.t + dt
  if self.t > 1 then
    self.dead = true
  end
end

function Explosion:draw()
  if self.dead then
    return
  end
  i = math.floor(self.t / (1/10)) % 10 + 1
  love.graphics.draw(imageFile, explFrames[i], self.x, self.y, 0, 2, 2, 8, 14)
end