require "world"
require "lib"
require "player"
require "enemies"
require "collision"
require "bubble"
require "bullets"

function love.load()
    playerLoad()
    enemyLoad()
    bulletLoad()
    blobby = love.graphics.newImage("assets/img/blobby.png")
    blob = love.graphics.newImage("assets/img/blob.png")
    love.window.setFullscreen(true)
    sound = love.audio.newSource("assets/sound/watery_cave.mp3")
    sound:setLooping(true)
    sound:play()
end

started = false
success = false
failure = false
bubbles = {}

function love.update(dt)
  if math.random(0, 30) == 2 then
    table.insert(bubbles, Bubble:new(math.random(10, 1910), 1020))
  end
  
  for i=1,#bubbles do
    bubbles[i]:delta(dt)
  end
  
  collisionUpdate()

  if started then
    playerUpdate()
    blobUpdate()    
    updateWorld(dt, player)
    enemyUpdate(dt)
    bulletUpdate(enemies)
  else
    if love.keyboard.isDown("return") then
      started = true
    end
  end
  if love.keyboard.isDown("escape") then
    os.exit(0)
  end
  if #world.blobs == howManyRescuedBlobs() then
    success = true
  end
  if player.health <=0 then
    failure = true
  end
end

function love.draw()
  if started then
    if success then
      love.graphics.draw(blobby, 585, 60)
      love.graphics.setColor(0, 255, 0)
      love.graphics.draw(love.graphics.newText(love.graphics.newFont(50), "mBlobbies"), 800, 500)
      love.graphics.draw(love.graphics.newText(love.graphics.newFont(20), "And so, we are done"), 832, 560)
      love.graphics.setColor(255, 255, 255)
    elseif failure then
      love.graphics.draw(blobby, 585, 60)
      love.graphics.setColor(255, 0, 0)
      love.graphics.draw(love.graphics.newText(love.graphics.newFont(50), "mBlobbies"), 800, 500)
      love.graphics.draw(love.graphics.newText(love.graphics.newFont(20), "You left us to die!"), 832, 560)
      love.graphics.setColor(255, 255, 255)
    else
      drawWorld()
      playerDraw()
      enemyDraw()
      bulletDraw()
      blobUpdate()
      for i=1,#bubbles do
        bubbles[i]:draw()
      end
      love.graphics.setColor(50, 50, 50)
      love.graphics.rectangle("fill", 0, 1024, 1920, 1080-1024)
      love.graphics.setColor(255, 0, 0)
      love.graphics.draw(love.graphics.newText(love.graphics.newFont(20), "Health: " .. player.health .. "/100"), 100, 1040)
      love.graphics.setColor(0, 255, 0)
      love.graphics.draw(love.graphics.newText(love.graphics.newFont(20), "Rescued Blobbies: " .. howManyRescuedBlobs() .. "/" .. #world.blobs), 400, 1040)
      love.graphics.setColor(255, 255, 255)
    end
  else
    love.graphics.draw(blobby, 585, 60)
    love.graphics.draw(love.graphics.newText(love.graphics.newFont(50), "mBlobbies"), 800, 500)
    love.graphics.draw(love.graphics.newText(love.graphics.newFont(20), "Press enter to start..."), 832, 560)
    love.graphics.draw(love.graphics.newText(love.graphics.newFont(14), "A game by James Rhodes, Anik Roy and Sam Sully."), 1500, 1000)
  end
end

function blobUpdate()
  if love.keyboard.isDown("r") then
    for i=#world.blobs,1,-1 do
      if objCollision(player, world.blobs[i]) then
        world.blobs[i].safe = true
      end
    end
  end
end
