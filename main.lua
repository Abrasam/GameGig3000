require "world"
require "collision"
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