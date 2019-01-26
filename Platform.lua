Platform = Object:extend()

function Platform:new(x, y, w, h)
  self.x = x
  self.y = y
  self.w = w
  self.h = h
end

function Platform:display(mode, red, green, blue, alpha)
  local color = {}
  color.red = red or 1
  color.green = green or 1
  color.blue = blue or 1

  love.graphics.setColor(color.red, color.green, color.blue)
  love.graphics.rectangle(mode, self.x, self.y, self.w, self.h)

  -- love.graphics.setColor(1, 1, 1)
  -- love.graphics.rectangle("line", self.x+20, self.y-64, self.w-40, 64)
  -- love.graphics.rectangle("line", self.x+20, self.y+self.h, self.w-40, 64)
  -- love.graphics.rectangle("line", self.x-64, self.y+20, 64, self.h-40)
  -- love.graphics.rectangle("line", self.x+self.w, self.y+20, 64, self.h-40)
end
