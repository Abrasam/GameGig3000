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
    if love.keyboard.isDown("escape") then
      os.exit(0)
    end
end

function love.draw()
    drawWorld()
    playerDraw()
    enemyDraw()
end
