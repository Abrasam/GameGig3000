require "worlds"

worldTextures = {[0] = love.graphics.newImage("assets/img/environment/bgtile.png"); [1] = love.graphics.newImage("assets/img/environment/sand.png"); [2] = love.graphics.newImage("assets/img/environment/stone.png")}

worldBackground = love.graphics.newImage("assets/img/environment/bgtile.png")

world = {map=world_01, entities={}, explosions={}}

function drawWorld()
  for y=1,64 do
    for x=1,120 do
      love.graphics.draw(worldTextures[world.map[y][x]], (x-1)*16, (y-1)*16)
    end
  end
end

function updateWorld(dt)
  for i=1,#world.explosions do
    explosions[i].delta(dt)
  end
end

function get(x, y)
  return world.map[y][x]
end

function pass(x, y)
  return world.map[y][x] == 0
end

function explode(x, y)
  
end