--[[
 error.lua
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
error = {}

function error:noConstructorObject(message)
	print ("No Constructor Object passed",message)
	return false
end

function error:invalidConstructorObject(message)
	print("Invalid Constructor Object passed",message)
	return false
end