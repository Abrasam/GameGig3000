require "worlds"
require "explosion"

worldTextures = {[0] = love.graphics.newImage("assets/img/environment/bgtile.png"); [1] = love.graphics.newImage("assets/img/environment/sand.png"); [2] = love.graphics.newImage("assets/img/environment/stone.png")}

world = {map=world_01, entities={}, explosions={}, mines={}, blobs = blobs_01}

function howManyRescuedBlobs()
  count = 0
  for i=1,#world.blobs do
    if world.blobs[i].safe then
      count = count + 1
    end
  end
  return count
end

function drawWorld()
  for y=1,64 do
    for x=1,120 do
      love.graphics.draw(worldTextures[world.map[y][x]], (x-1)*16, (y-1)*16)
    end
  end
  for i=1,#world.explosions do
    world.explosions[i]:draw()
  end
  for i=1,#world.mines do
    world.mines[i]:draw()
  end
  for i=1,#world.blobs do
    world.blobs[i]:draw()
    --love.graphics.rectangle("fill",world.blobs[i].x,world.blobs[i].y,world.blobs[i].width,world.blobs[i].height)
  end
end

timeSinceLastMine = 1000
hurtTime = -1

function updateWorld(dt, p)
  if hurtTime <= 0 then
    love.graphics.setColor(255, 255, 255)
  else
    love.graphics.setColor(255, 0, 0)
    hurtTime = hurtTime - dt
  end
  timeSinceLastMine = timeSinceLastMine + dt
  --explode(math.random(0, 119), math.random(0, 63))
  if love.keyboard.isDown("space") and timeSinceLastMine > 0.75 then
    timeSinceLastMine = 0
    table.insert(world.mines, Mine:new(p.x/16, p.y/16, p))
  end
  kill = {}
  for i=1,#world.explosions do
    world.explosions[i]:delta(dt)
    if world.explosions[i].dead then
      table.insert(kill, i)
    end
  end
  for i=1,#kill do
    table.remove(world.explosions, kill[i])
  end
  killmine = {}
  for i=1,#world.mines do
    world.mines[i]:delta(dt)
    if world.mines[i].dead then
      table.insert(killmine, i)
    end
  end
  for i=1,#killmine do
    table.remove(world.mines, killmine[i])
  end
  for i=1,#world.blobs do
    world.blobs[i]:delta(dt)
  end
end

function get(x, y)
  return world.map[y][x]
end

function pass(x, y)
  if x <= 0 or y <= 0 or x > 120 or y > 64 then
    return false
  else
    return world.map[y][x] == 0
  end
end

function explode(x, y, p)
  world.explosions[#world.explosions+1] = (Explosion:new(x*16,y*16))
  for i=(x*16),(x*16+78*2) do
    for j=(y*16),(y*16+87*2) do
      if math.pow(j-(y*16+87), 2) + math.pow(i-(x*16+78), 2) <= 4*16*4*16 and math.floor(j/16) <= 64 and math.floor(i/16) <= 120 then
        world.map[math.floor(j/16)][math.floor(i/16)] = 0
      end
    end
  end
  if distSq(p.x, p.y, x*16+78, y*16+87) <= 3*16*3*16 then
    p.health = p.health - 20
    hurtTime = 0.25
    love.graphics.setColor(255, 0, 0)
  end
  for i=#enemies, 0, -1 do
    if enemies[i] ~= nil then
    if distSq(enemies[i].x, enemies[i].y, x*16+78, y*16+87) <= 3*16*3*16 then
      table.remove(enemies, i)
    end
  end
  end
  --Do same for all entities
end

Mine = {}

function Mine:new(xx, yy, pp)
  local fields = {x=xx, y=yy, p=pp, t=0, exploded=false, imageFile=love.graphics.newImage("assets/img/enemies/mine-small.png")}
  self.__index = self
  return setmetatable(fields, self)
end

function Mine:delta(dt)
  if self.exploded then
    return
  end
  self.t = self.t + dt
  if self.t > 2 then
    self.exploded = true
    explode(self.x - 78/16+10/16, self.y-87/16, self.p)
  end
end

function Mine:draw()
  if self.exploded then
    return
  end
  love.graphics.draw(self.imageFile, self.x*16-20, self.y*16-20)
end
