enemies = {}

function enemyLoad()
  enemy = {SS = love.graphics.newImage("assets/img/enemies/fishbig.png")}
  enemy.quads = {}
  enemy.sprite = {w = 54, h = 49} 
  enemy.drawCount = 0

  enemies = {}

  table.insert(enemies, {x = 50, y = 50})

  for x=0, 3 do
    table.insert(enemy.quads,love.graphics.newQuad(x*54,0,enemy.sprite.w,enemy.sprite.h,enemySprites:getDimensions()))
  end
end

function enemyDraw()
  enemy.drawCount = enemy.drawCount + 1
  for i=#enemies, 1, -1 do
    thisEnemy = enemies[i]  
    love.graphics.draw(enemy.SS, enemy.quads[enemy.drawCount//4 + 1], thisEnemy.x, thisEnemy.y)
  end
end
