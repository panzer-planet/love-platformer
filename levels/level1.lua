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

level1 = {}
function level1.load()
	background.load()
	game.floor = love.graphics.getHeight() - 100
	floor.load(game.floor)
end

function level1.draw()
	background.draw()
	
	floor.draw()
end

function level1.update(dt)
	background.update(dt)
	floor.update(dt)
end

function level1.keypressed(key)
	background.keypressed(key)
end