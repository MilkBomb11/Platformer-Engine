Player = Object:extend()

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function Player:new(x, y, w, h)
  self.x = x
  self.y = y
  self.w = w
  self.h = h
  self.xv = 0
  self.yv = 0
end

function Player:move(speed, friction, dt)
  if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
    self.xv = self.xv + speed*dt
  elseif love.keyboard.isDown("left") or love.keyboard.isDown("a") then
    self.xv = self.xv - speed*dt
  end
  self.x = self.x + self.xv*dt
  self.xv = self.xv * friction
end

function Player:gravity(grv, dt)
  self.yv = self.yv + grv *dt
  self.y = self.y + self.yv*dt
end

function Player:jump(jumpSpeed)
  self.yv = -jumpSpeed
end

function Player:display(mode, red, green, blue, alpha)
  local mode = mode or "line"

  local color = {}
  color.red = red or 1
  color.green = green or 1
  color.blue = blue or 1
  color.alpha = alpha or 1

  love.graphics.setColor(color.red, color.green, color.blue)
  love.graphics.rectangle(mode, self.x, self.y, self.w, self.h)
end
