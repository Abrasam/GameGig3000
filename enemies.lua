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
    local x = math.random(0,love.graphics.getWidth())
    table.insert(enemies, {height = enemy.sprite.h, width = enemy.sprite.w, x = 50, y = 50})

  end

  for x=0, 3 do
    table.insert(enemy.quads,love.graphics.newQuad(x*enemy.sprite.w,0,enemy.sprite.w,enemy.sprite.h,enemy.SS:getDimensions()))
  end
end

function enemyUpdate(dt)
  for i=#enemies, 1, -1 do
    enemies[i].x = enemies[i].x + 1
  end
end

function enemyDraw()
  enemy.drawCount = enemy.drawCount + 1
  for i=#enemies, 1, -1 do
    thisEnemy = enemies[i]  
    love.graphics.draw(enemy.SS, enemy.quads[math.floor(enemy.drawCount / enemy.updateTime) % 4 + 1], thisEnemy.x, thisEnemy.y)
  end
end
