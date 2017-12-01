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
    