function collisionUpdate()
  updateObject(player)
  for i = #enemies, 1 , -1 do
    updateObject(enemies[i])
end  

function updateObject(obj)
  for i = 0, obj.w, 16 do 
    if get(math.floor((obj.x + i)/16),obj.y) != 0 and obj.vel.y < 0 then
      obj.vel.y = 0
    end
    if get(math.floor((obj.x + i)/16),obj.y+obj.height) != 0 and obj.vel.y > 0 then
      obj.vel.y = 0
    end
  end
 
  for i = 0, obj.h, 16 do 
    if get(math.floor((obj.y + i)/16),obj.x) != 0 and obj.vel.x < 0 then
      obj.vel.x = 0
    end
    if get(math.floor((obj.y + i)/16),obj.x+obj.height) != 0 and obj.vel.x > 0 then
      obj.vel.x = 0
    end
  end 
end
