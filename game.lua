--game.lua
require('player')
require('floor')
require('background')
game = {}
function game.load()
  -- background init
  game.clock = 0
	game.floor = love.graphics.getHeight() - 100
	game.collide = false
	
	love.graphics.setFont(default_font)
	background.load()
	player.load()
	local f
	floor.load(game.floor)
	print("player.x "..player.x,
		"player.y "..player.y,
		"player.size_x "..player.size_x,
		"payer.size_y "..player.size_y)
end

function game.draw()
	background.draw()
	player.draw()
	floor.draw()
	if debug then
		love.graphics.printf("collide: "..tostring(game.collide),10,40,love.graphics.getWidth()-20,"right")
	end
end

function game.update(dt)
  --update game clock
  game.clock = game.clock + dt
	background.update(dt)
	player.update(dt)
	floor.update(dt)
	local collide = game:check_collision(
		player.x,
		player.y,
		player.size_x,
		player.size_y,
		0,
		game.floor,
		love.graphics.getWidth(),
		love.graphics.getHeight() - game.floor);
	if collide then
		game.collide = true
		--player.speed_x = 0
		--player.speed_y = 0
	else game.collide = false end
end

function game.keypressed(key)
	background.keypressed(key)
	player.keypressed(key)
end

-- Collision detection function.
-- Checks if a and b overlap.
-- w and h mean width and height.
function game:check_collision(ax1,ay1,aw,ah, bx1,by1,bw,bh)
  local ax2,ay2,bx2,by2 = ax1 + aw, ay1 + ah, bx1 + bw, by1 + bh
  return ax1 < bx2 and ax2 > bx1 and ay1 < by2 and ay2 > by1
end

