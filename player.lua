function playerLoad()
    player = {}
    
    player.x = 0
    player.y = 0

    player.vel = {}
    player.vel.x = 0
    player.vel.y = 0

    player.MAXVEL = 10
    player.ACC = 2
    
    player.state = "still"

end

function playerUpdate()
    local dt = love.timer.getDelta()
    if love.keyboard.isDown("w") then
        player.state = "up"
        player.vel.y = player.vel.y + player.ACC * dt
    elseif love.keyboard.isDown("s") then
        player.state = "down"
        player.acc.y = player.acc.y - player.ACC * dt
    elseif love.keyboard.isDown("a") then
        player.state = "left"
        player.acc.x = player.acc.x -  player.ACC * dt
    elseif love.keyboard.isDown("d") then
        player.state = "right"
        player.acc.x = player.acc.x +  player.ACC * dt

    else
        if player.vel.x < 0 then
            player.vel.x = player.vel.x + player.ACC * dt
        
        elseif player.vel.x > 0 then
            player.vel.x = player.vel.x - player.ACC * dt
        
        if player.vel.y < 0 then
            player.vel.y = player.vel.y + player.ACC * dt
        
        elseif player.vel.y > 0 then
            player.vel.y = player.vel.y - player.ACC * dt
        end
    end
    player.x = player.x + player.vel.x * dt
    player.y = player.y + player.vel.y * dt



end
end

function playerDraw()


end

