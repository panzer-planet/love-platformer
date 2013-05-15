--[[
 level1.lua
 LoVE platformer
 https://github.com/panzer-planet/love-platformer
 Copyright 2013, Werner Roets
 Licensed under GNU General Public License v3
 Redistributions of files must retain the above copyright notice.

 author: Werner Roets (cobolt.exe@gmail.com)
 url: https://github.com/panzer-planet/love-platformer
 version: 0.1alpha
 license: GNU GPL v3 (http://www.gnu.org/copyleft/gpl.html)
]]

require('lib/enviro/floor')
require('lib/enviro/background')
require('lib/enviro/platform')

level1 = {}
function level1.load()
	background.load()
	floor.load(love.graphics.getHeight() - 80)
	
	level1.platforms = level1:createPlatforms()
end

function level1.draw()
	background.draw()
	floor.draw()
	for k, v in pairs (level1.platforms) do
		v:draw()
	end
end

function level1.update(dt)
	background.update(dt)
	floor.update(dt)
end

function level1.keypressed(key)
	background.keypressed(key)
end

function level1:createPlatforms()
	local platforms = {}
		platforms[1] = {
			x = 100;
			y = 100;
			width = 400;
			height = 40;
		}
		platforms[2] = {
			x = 100;
			y = 220;
			width = 300;
			height = 30;
		}
	p = {}
	for k, v in pairs(platforms) do
		p[k] = platform:new(v)
	end
	return p
end