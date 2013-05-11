--[[
 conf.lua
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
cfg = {}

function love.conf(t)
  t.title = "LoVE platformer"
	t.author = "Werner Roets"
	t.url = "https://github.com/panzer-planet/love-platformer"
	t.version = "0.8.0"
	t.console = true
	t.fullscren = false
  t.screen.width = 1000
  t.screen.height = 600
	cfg = t
end