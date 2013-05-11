--[[
 background.lua
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


background = {}

function background.load()
end

function background.draw()
	love.graphics.draw(imgs["background.jpg"],0,0)
end

function background.update(dt)
end

function background.keypressed(key)
end