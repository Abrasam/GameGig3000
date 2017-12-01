require "worlds"
require "explosion"

worldTextures = {[0] = love.graphics.newImage("assets/img/environment/bgtile.png"); [1] = love.graphics.newImage("assets/img/environment/sand.png"); [2] = love.graphics.newImage("assets/img/environment/stone.png")}

world = {map=world_01, entities={}, explosions={}}

function drawWorld()
  for y=1,64 do
    for x=1,120 do
      love.graphics.draw(worldTextures[world.map[y][x]], (x-1)*16, (y-1)*16)
    end
  end
  for i=1,#world.explosions do
    world.explosions[i]:draw()
  end
end

function updateWorld(dt)
  explode(math.random(0, 1920), math.random(0, 800))
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
end

function get(x, y)
  return world.map[y][x]
end

function pass(x, y)
  return world.map[y][x] == 0
end

function explode(x, y)
  world.explosions[#world.explosions+1] = (Explosion:new(x,y,3))
end