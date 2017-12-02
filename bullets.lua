function bulletLoad()
    bullets = {}
    BULLET_VEL = 20
    lastBullet = 0
end

function bulletUpdate(enemies)
    
    for i=#bullets, 1, -1 do
        for j=#enemies, 1, -1 do
            if objCollision(bullets[i], enemies[j]) then
                table.remove(enemies, j)
            elseif not canAddObject(bullets[i]) then
                table.remove(bullets,i)
                break
        end
        end
    end

    for i=#bullets, 1, -1 do 
        bullets[i].x = bullets[i].x + bullets[i].dir * BULLET_VEL
    end

    if love.keyboard.isDown("q") then
        addBullet(player.dir, player.x, player.y)
    end

end

function addBullet(d, startX, startY)
    time = love.timer.getTime()    
    if time - lastBullet > 0.5 then
        table.insert(bullets, {x=startX,y=startY, vel = {x = BULLET_VEL, y = 0},dir=d, width=5, height=5})        
        lastBullet =love.timer.getTime()    
        
    end
    

end


function bulletDraw()
    love.graphics.setColor(255,100,255)
    for i=1, #bullets do
        love.graphics.rectangle("fill", bullets[i].x,bullets[i].y, bullets[i].height, bullets[i].width)
    end
    love.graphics.setColor(255,255,255)

end
