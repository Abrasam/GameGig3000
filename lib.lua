function AABB(x1,y1,w1,h1,x2,y2,w2,h2)
  return x1 < x2+w2 and x1+w1 > x2 and y1 < y2+h2 and y1+h1 > y2
end

function dist(x1, y1, x2, y2)
  return math.sqrt(math.pow(x1-x2, 2) + math.pow(y1-y2, 2))
end

function distSq(x1, y1, x2, y2)
  return math.pow(x1-x2, 2) + math.pow(y1-y2, 2)
end

function clamp(x,mx)
    if math.abs(x) > math.abs(mx) then
            return mx
        else
            return x
        end
    end
    
function setPos(p,x,y)
    if x < 0 then
        p.x = 0
        p.vel.x = 0
    elseif x > love.graphics.getWidth() - p.width then
        p.x = love.graphics.getWidth() - p.width
        p.vel.x = 0
    
    elseif y < 0 then
        p.y = 0
        p.vel.y = 0
    elseif y > love.graphics.getHeight() - p.height  then
        p.y = love.graphics.getHeight() - p.height
        p.vel.y = 0
    else 
        p.x = x
        p.y = y
    end
end
    