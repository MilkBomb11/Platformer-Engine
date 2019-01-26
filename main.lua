
function PlayerPlatformCollision(player, platform)

  function CheckCollisionOfRects(a, b)
    return CheckCollision(a.x,a.y,a.w,a.h, b.x,b.y,b.w,b.h)
  end

  if CheckCollisionOfRects(player, platform) then --while intersection happens

    local deadzone = 20

    local topBox = {x=platform.x+deadzone, y=platform.y-player.h, w=platform.w-deadzone*2, h=player.h}
    local bottomBox = {x=platform.x+deadzone, y=platform.y+platform.h, w=platform.w-deadzone*2, h=player.h}
    local leftBox = {x=platform.x-player.w, y=platform.y+deadzone, w=player.w, h=platform.h-deadzone*2}
    local rightBox = {x=platform.x+platform.w, y=platform.y+deadzone, w=player.w, h=platform.h-deadzone*2}

    if CheckCollisionOfRects(player, topBox) then
      player.yv = 0
      player.y = platform.y-player.h

    elseif CheckCollisionOfRects(player, bottomBox) then
      player.yv = 0
      player.y = platform.y+platform.h

    elseif CheckCollisionOfRects(player, leftBox) then
      player.xv = 0
      player.x = platform.x-player.w

    elseif CheckCollisionOfRects(player, rightBox) then
      player.xv = 0
      player.x = platform.x+platform.w
    end

  end
end

function love.load()
  Object = require "classic"
  require "Player"
  require "Platform"

  objects = {}
  objects.player = Player(0, 0, 64, 64)
  objects.platforms = {
                      -- platforms
                      Platform(0, love.graphics.getHeight()-100, love.graphics.getWidth(), 100),
                      Platform(300, 230, 200, 200),
                      Platform(100, 300, 50, 200),

                      -- borders
                      Platform(-50, 0, 50, love.graphics.getHeight()), --left
                      Platform(love.graphics.getWidth(), 0, 50, love.graphics.getHeight()), --right
                      Platform(0, -50, love.graphics.getWidth(), 50), --top
                      Platform(0, love.graphics.getHeight(), love.graphics.getWidth(), 50) --bottom

                      }
end

function love.update(dt)
  objects.player:move(5000, 0.9, dt)
  objects.player:gravity(1000, dt)
  for key, platform in pairs(objects.platforms) do
    PlayerPlatformCollision(objects.player, platform)
  end
end

function love.draw()
  objects.player:display("fill", 1, 1, 1, 1)
  love.graphics.print(objects.player.yv, 0, 0)
  for key, platform in pairs(objects.platforms) do
    platform:display("fill", 1, 0.5, 1, 1)
  end
end

function love.keypressed(key, scancode, isrepeat)
  if key == "up" and objects.player.yv == 0 then
    objects.player:jump(750)
  end
end
