--background.lua

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