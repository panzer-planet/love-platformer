--[[
 platform.lua
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
require('lib/error')

platform = {}

--[[
	constructor
	expects a table with all these keys:
		x,y,width,height
	]]
function platform:new(o)
	--validate constructor object
	if not o then return error:noConstructorObject("platform") 
	elseif not platform:validateConstructorObject(o) then 
		return error:invalidConstructorObject("platform") 
	end
	--initialise the object
	platform:load(o)
	
	--ensure the derived table can access this one
	self.__index = self
	setmetatable(o,self)
	--return a new instance 
	return o
end

--[[
	validate the constructor's object, in here
	you must ensure that all needed keys were passed
	to the constructor and initialise them to defaults
	or return false otherwise
	]]
function platform:validateConstructorObject(o)
	if not (o.width * o.height) or (nil == o.x or nil == o.y) then 
		return false 
	end
	return true
end

--[[
	The load function contains all initialisation that is not
	related to object orientation
]]
function platform:load(o)
	--set default platform colour
	self.r, self.b, self.g, self.a = 47, 79, 47, 255
	
	self.x, self.y = o.x,o.y
	self.width, self.height = o.width, o.height
	print "Spawning platform"
	print("x","y","width","height")
	print(platform.x,platform.y,platform.width,platform.height)
	
	
end

--[[
	The object's draw function
]]
function platform:draw()
	--save last draw colour
	local r, g, b, a = love.graphics.getColor()
	--set draw colour to that of our platform
	love.graphics.setColor(self.r, self.g, self.b, self.a)
	--draw the platform
	love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
	--restore the drawing colour to what it was
	love.graphics.setColor(r, g, b, a)
end

function platform:update(dt)

end

function platform:setColor(r, g, b, a)
	self.r, self.g, self.b, self.a = r, g, b, a
end

function platform:getColor()
	return self.r, self.g, self.b, self.a
end