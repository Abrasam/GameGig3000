function collisionUpdate()
  updateObject(player, 0)
  for i = #enemies, 1 , -1 do
    thisEnemy = enemies[i]
    updateObject(thisEnemy, -thisEnemy.vel)
    if objCollision(player,thisEnemy) then
      playerHurt()
    end
  end  
end

function objCollision(obj1, obj2)
  return AABB(obj1.x,obj1.y,obj1.width,obj1.height, obj2.x, obj2.y, obj2.width, obj2.height)
end

function updateObject(obj,newVel)
  for i = 0, obj.width, 16 do
    if get(math.floor((obj.x + i)/16)+1,math.floor(obj.y/16)+1) ~= 0 and obj.vel.y < 0 then
      obj.vel.y = -newVel.y
    end
    if get(math.floor((obj.x + i)/16)+1,math.floor((obj.y+obj.height)/16)+1) ~= 0 and obj.vel.y > 0 then
      obj.vel.y = -newVel.y
    end
  end
 
  for i = 0, obj.height, 16 do 
    if get(math.floor((obj.y + i)/16)+1,math.floor(obj.x/16)+1) ~= 0 and obj.vel.x < 0 then
      obj.vel.x = -newVel.x
    end
    if get(math.floor((obj.y + i)/16)+1,math.floor((obj.x+obj.height)/16)+1) ~= 0 and obj.vel.x > 0 then
      obj.vel.x = -newVel.x
    end
  end 
end
