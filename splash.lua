--[[
 splash.lua
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


splash = {}

function splash.load()
  splash.dt_temp = 0
end

function splash.draw()
  --love.graphics.draw(imgs["title"],0,(splash.dt_temp-1)*32*scale,0,scale,scale)
	love.graphics.setFont(title_font)
  love.graphics.setColor(fontcolor.r,fontcolor.g,fontcolor.b)
  -- Show after 2.5 seconds
  --if splash.dt_temp == 2.5 then
    love.graphics.printf("Press Start",0,splash.dt_temp*100,love.graphics.getWidth(),"center")
  --end
  -- Reset the color
  love.graphics.setColor(255,255,255)
end

function splash.update(dt)
  -- Update dt_temp
  splash.dt_temp = splash.dt_temp + dt
  -- Wait 2.5 seconds, then stop in place.
  if splash.dt_temp > 2.5 then
    splash.dt_temp = 2.5
  end
end

function splash.keypressed(key)
  -- Change to game state, and init game.
  state = "game"
	love.graphics.setFont(default_font)
end
