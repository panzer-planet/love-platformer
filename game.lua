--[[
 game.lua
 LoVE platformer
 https://github.com/panzer-planet/love-platformer
 Copyright 2013, Werner Roets
 Licensed under GNU General Public License v3
 Redistributions of files must retain the above copyright notice.

 author: Werner Roets (cobolt.exe@gmail.com)
 copyright: Copyright 2012, Werner Roets and the cobolt-gallery contributors
 url: https://github.com/panzer-planet/love-platformer
 version: 0.1alpha
 license: GNU GPL v3 (http://www.gnu.org/copyleft/gpl.html)
]]

require('player')
require('floor')
require('background')

game = {}
function game.load()
  --game variables
  game.clock = 0
	game.collision_clock = 0
	game.floor = love.graphics.getHeight() - 100
	game.collide = false
	
	init_physics()
	love.graphics.setFont(default_font)
	background.load()
	player.load()
	floor.load(game.floor)
	
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
	local collide = game:checkFloorCollission()
	if collide then
		game.collide = true
		game:stopPlayer()
	else game.collide = false end
end

function game.keypressed(key)
	background.keypressed(key)
	player.keypressed(key)
end

function init_physics()
	love.physics.setMeter(100)-- 100px = 1m
	--create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81
	world = love.physics.newWorld(0,9.81*100,true)
end

--[[ crude Collision detection function.
 Checks if a and b overlap.
 w and h mean width and height.
]]
function game:check_collision(ax1,ay1,aw,ah, bx1,by1,bw,bh)
  local ax2,ay2,bx2,by2 = ax1 + aw, ay1 + ah, bx1 + bw, by1 + bh
  return ax1 < bx2 and ax2 > bx1 and ay1 < by2 and ay2 > by1
end

function game:checkFloorCollission()
	local collide = game:check_collision(
		player.x,
		player.y - player.size_y/2 + 1, -- 1 pixel above the floor
		player.size_x,
		player.size_y,
		0,
		game.floor,
		love.graphics.getWidth(),
		love.graphics.getHeight() - game.floor);
	return collide
end

function game:stopPlayer()
	if game.clock - game.collision_clock > 0.1 then
		--player.speed_x = 0
		--player.speed_y = 0
		game.collision_clock = game.clock
	end
	
end