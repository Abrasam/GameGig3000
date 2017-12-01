require "world"
require "lib"
require "player"

function love.load()
    playerLoad()
end

function love.update()
    playerUpdate()
end

function love.draw()
  drawWorld()
  playerDraw()
end