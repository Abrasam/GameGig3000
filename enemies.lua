enemies = {}

function enemyLoad()
  enemy = {}
  enemy.SS = love.graphics.newImage("assets/img/enemies/fish-big.png")
  enemy.quads = {}
  enemy.sprite = {w = 54, h = 49} 
  enemy.drawCount = 0
  enemy.updateTime = 10

  enemies = {}

  for i=0, 10 do
    createEnemy()
  end

  for x=0, 3 do
    table.insert(enemy.quads,love.graphics.newQuad(x*enemy.sprite.w,0,enemy.sprite.w,enemy.sprite.h,enemy.SS:getDimensions()))
  end
  enemiesPerSec = 1
end

function createEnemy()
  local random_y = math.random(100,love.graphics.getHeight()-enemy.sprite.h-20)
  print(random_y)
  local r = math.random()
  --random_y = 50
   if r<0.5 then 
     random_x = love.graphics.getWidth()-enemy.sprite.w-2
   else 
     random_x = 50 
  end

  if canAddObject({height = enemy.sprite.h, width = enemy.sprite.w, x = random_x, y = random_y, vel={x=3, y=0}}) then
    table.insert(enemies, {height = enemy.sprite.h, width = enemy.sprite.w, x = random_x, y = random_y, vel={x=3, y=0}})
  end
end

function enemyUpdate(dt)
  if enemy.drawCount % 60 == 0 then enemiesPerSec = enemiesPerSec + 1 end

  if enemy.drawCount % (60/enemiesPerSec) == 0 then createEnemy() end


  for i=#enemies, 1, -1 do
    
    enemies[i].x = enemies[i].x + enemies[i].vel.x

  end
end

function enemyDraw()
  enemy.drawCount = enemy.drawCount + 1
  for i=#enemies, 1, -1 do
    thisEnemy = enemies[i]  
    love.graphics.draw(enemy.SS, enemy.quads[math.floor(enemy.drawCount / enemy.updateTime) % 4 + 1], thisEnemy.x, thisEnemy.y)
  end
end
