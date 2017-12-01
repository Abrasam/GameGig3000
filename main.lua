require "world"
require "lib"
require "player"
require "enemies"

function love.load()
    playerLoad()
    enemyLoad()
    love.window.setFullscreen(true)
end

function love.update(dt)
    playerUpdate()
    updateWorld(dt, player)
    enemyUpdate(dt)
    if love.keyboard.isDown("escape") then
      os.exit(0)
    end
end

function love.draw()
    drawWorld()
    playerDraw()
    enemyDraw()
    love.graphics.setColor(50, 50, 50)
    love.graphics.rectangle("fill", 0, 1024, 1920, 1080-1024)
    love.graphics.setColor(255, 255, 255)
end
