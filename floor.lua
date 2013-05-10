floor = {}

function floor.load(o)
	floor.top = o
end

function floor.draw()
	love.graphics.setColor(200,200,200)
	love.graphics.rectangle(
		"fill", --DrawMode mode - How to draw the rectangle. 
		0, 		--number x - The position of top-left corner along x-axis. 
		floor.top, 		--number y - The position of top-left corner along y-axis.
		love.graphics.getWidth(), 		--number width - Width of the rectangle
		love.graphics.getHeight() - floor.top			--number height - Height of the rectangle
	)		
	--love.graphics.setColor(bgcolor.r,bgcolor.g,bgcolor.b)
end

function floor.update(dt)

end
