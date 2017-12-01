require "world"
require "lib"
require "player"
require "enemies"

function love.load()
    playerLoad()
    enemyLoad()
    blobby = love.graphics.newImage("assets/img/blobby.png")
    blob = love.graphics.newImage("assets/img/blob.png")
    love.window.setFullscreen(true)
    sound = love.audio.newSource("assets/sound/watery_cave.mp3")
    sound:setLooping(true)
    sound:play()
end

started = false

function love.update(dt)
  if started then
    playerUpdate()
    updateWorld(dt, player)
    enemyUpdate(dt)
  else
    if love.keyboard.isDown("return") then
      started = true
    end
  end
  if love.keyboard.isDown("escape") then
    os.exit(0)
  end
end

function love.draw()
  if started then
    drawWorld()
    playerDraw()
    enemyDraw()
    love.graphics.setColor(50, 50, 50)
    love.graphics.rectangle("fill", 0, 1024, 1920, 1080-1024)
    love.graphics.setColor(255, 0, 0)
    love.graphics.draw(love.graphics.newText(love.graphics.newFont(20), "Health: " .. player.health .. "/100"), 100, 1040)
    love.graphics.setColor(0, 255, 0)
    love.graphics.draw(love.graphics.newText(love.graphics.newFont(20), "Rescued Blobbies: " .. howManyRescuedBlobs() .. "/" .. #world.blobs), 400, 1040)
    love.graphics.setColor(255, 255, 255)
  else
    love.graphics.draw(blobby, 585, 60)
    love.graphics.draw(love.graphics.newText(love.graphics.newFont(50), "mBlobbies"), 800, 500)
    love.graphics.draw(love.graphics.newText(love.graphics.newFont(20), "Press enter to start..."), 832, 560)
  end
end
