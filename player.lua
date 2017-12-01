function playerLoad()
    player = {}
    
    player.x = 0
    player.y = 0

    player.vel = {}
    player.vel.x = 0
    player.vel.y = 0

    player.acc = {}
    player.vel.x = 0
    player.vel.y = 0
    
    player.state = "still"

end

function playerUpdate(dt)
    if love.keyboard.isDown("w") then
        player.state = "up"
        player.acc.y = player.acc.y + 1
    elseif love.keyboard.isDown("s") then
        player.state = "down"
        player.acc.y = player.acc.y - 1
    elseif love.keyboard.isDown("a") then
        player.state = "left"
        player.acc.x = player.acc.x - 1
    elseif love.keyboard.isDown("d") then
        player.state = "right"
        player.acc.x = player.acc.x + 1
    end    
    

end

function playerDraw()

end

