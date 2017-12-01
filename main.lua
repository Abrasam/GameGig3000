require "world"
require "lib"
require "player"

function love.load()
    playerLoad()
    love.window.setFullscreen(true)
end

function love.update(dt)
    playerUpdate()
    updateWorld(dt)
    if love.keyboard.isDown("escape") then
      os.exit(0)
    end
end

function love.draw()
  drawWorld()
  playerDraw()
end