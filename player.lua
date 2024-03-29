require "lib"

function playerLoad()
    player = {}
    
    player.x = 100
    player.y = 100

    player.vel = {}
    player.vel.x = 0
    player.vel.y = 0

    player.MAXVEL = 3
    player.ACC = 8
    player.DEC = 8
    
    player.state = "right"
    player.dir = 1
    player.width = 48
    player.height = 20

    player.SS = love.graphics.newImage("assets/img/player/player-swiming.png")
    player.quads = {}
    player.sprite = {w = 80, h = 20} 
    player.drawCount = 1
    player.updateTime = 10
 

    player.health = 100

    for x=0, 5 do
        table.insert(player.quads,love.graphics.newQuad(x*player.sprite.w+16,29,player.width,player.height,player.SS:getDimensions()))    
    end
end

function playerHurt(x)
    player.health = player.health - 1
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
    else
        if player.vel.y < 0 then
            player.vel.y = player.vel.y + player.DEC * dt
        
        elseif player.vel.y > 0 then
            player.vel.y = player.vel.y - player.DEC * dt
        end
    end    

    if love.keyboard.isDown("a") then
        player.state = "left"
        player.dir = -1
        player.vel.x = clamp(player.vel.x -  player.ACC*dt, -player.MAXVEL)
        setPos(player, player.x + player.vel.x, player.y + player.vel.y)
        
    elseif love.keyboard.isDown("d") then
        player.state = "right"
        player.dir = 1
        player.vel.x = clamp(player.vel.x +  player.ACC*dt, player.MAXVEL)
        setPos(player, player.x + player.vel.x, player.y + player.vel.y)
    else
        if player.vel.x < 0 then
            player.vel.x = player.vel.x + player.DEC * dt        
        elseif player.vel.x > 0 then
            player.vel.x = player.vel.x - player.DEC * dt
        end
    end 

    -- else
    --     if player.vel.x < 0 then
    --         player.vel.x = player.vel.x + player.DEC * dt
        
    --     elseif player.vel.x > 0 then
    --         player.vel.x = player.vel.x - player.DEC * dt
    --     end
    --     if player.vel.y < 0 then
    --         player.vel.y = player.vel.y + player.DEC * dt
        
    --     elseif player.vel.y > 0 then
    --         player.vel.y = player.vel.y - player.DEC * dt
    --     end
    -- end
    
    setPos(player, player.x + player.vel.x, player.y + player.vel.y)
end

function drawCentre(angle)
    thisQuad = player.quads[math.floor(player.drawCount / player.updateTime) % 4 + 1]
    love.graphics.draw(player.SS, thisQuad:flip(true, false), player.x, player.y, angle, 1, 1, 40,25)    
end

function playerDraw()
    -- love.graphics.setColor(255,100,255)
    -- love.graphics.rectangle("fill", player.x, player.y, 50, 50)
    -- love.graphics.setColor(255,255,255)
    player.drawCount = player.drawCount + 1
    thisQuad = player.quads[math.floor(player.drawCount / player.updateTime) % 4 + 1]
    
    if player.state == "right" then
        love.graphics.draw(player.SS, thisQuad, player.x, player.y, 0, 1, 1, 0, 0)    
    elseif player.state == "left" then
        love.graphics.draw(player.SS, thisQuad, player.x+player.width, player.y, 0, -1, 1)    
    elseif player.state == "up" then
        love.graphics.draw(player.SS, thisQuad, player.x, player.y, 0, 1, 1)    
    elseif player.state == "down" then
        love.graphics.draw(player.SS, thisQuad, player.x, player.y, 0, 1, 1)    
    end
end

