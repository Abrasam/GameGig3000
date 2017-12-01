function playerLoad()
    player = {}
    
    player.x = 0
    player.y = 0

    player.vel = {}
    player.vel.x = 0
    player.vel.y = 0

    player.MAXVEL = 3
    player.ACC = 8
    player.DEC = 8
    
    player.state = "still"
    player.width = 50
    player.height = 50

end

function setPos(player,x,y)
    if x < 0 then
        player.x = 0
        player.vel.x = 0
    elseif x > love.graphics.getWidth() - player.width then
        player.x = love.graphics.getWidth() - player.width
        player.vel.x = 0
    
    elseif y < 0 then
        player.y = 0
        player.vel.y = 0
    elseif y > love.graphics.getHeight() - player.height then
        player.y = love.graphics.getHeight() - player.height
        player.vel.y = 0
    else 
        player.x = x
        player.y = y
    end
end

function clamp(x,mx)

    if math.abs(x) > math.abs(mx) then
        return mx
    else
        return x
    end
end

function playerUpdate()
    local dt = love.timer.getDelta()

    if love.keyboard.isDown("w") then
        player.state = "up"
        player.vel.y = clamp(player.vel.y - player.ACC*dt, -player.MAXVEL)
        setPos(player, player.x + player.vel.x, player.y + player.vel.y)

    
    elseif love.keyboard.isDown("s") then
        player.state = "down"
        player.vel.y = clamp(player.vel.y + player.ACC*dt,player.MAXVEL)
        setPos(player, player.x + player.vel.x, player.y + player.vel.y)
        
    elseif love.keyboard.isDown("a") then
        player.state = "left"
        player.vel.x = clamp(player.vel.x -  player.ACC*dt, -player.MAXVEL)
        setPos(player, player.x + player.vel.x, player.y + player.vel.y)
        
    elseif love.keyboard.isDown("d") then
        player.state = "right"
        player.vel.x = clamp(player.vel.x +  player.ACC*dt, player.MAXVEL)
        setPos(player, player.x + player.vel.x, player.y + player.vel.y)
        
    else
        if player.vel.x < 0 then
            player.vel.x = player.vel.x + player.DEC * dt
        
        elseif player.vel.x > 0 then
            player.vel.x = player.vel.x - player.DEC * dt
        end
        if player.vel.y < 0 then
            player.vel.y = player.vel.y + player.DEC * dt
        
        elseif player.vel.y > 0 then
            player.vel.y = player.vel.y - player.DEC * dt
        end
    end
    
    setPos(player, player.x + player.vel.x, player.y + player.vel.y)
end


function playerDraw()
    love.graphics.setColor(255,100,255)
    love.graphics.rectangle("fill", player.x, player.y, 50, 50)
    love.graphics.setColor(255,255,255)
    
end

