--player.lua
player = {}

-- ON LOAD
function player.load()
	--s_sheet table holds sprite sheet data
	s_sheet = {}
	s_sheet.iterator = 1		--the index of the current frame in the sprite
	s_sheet.timer = 0				--for temp delta time
	s_sheet.max = 7 				--number of images in the sheet
	s_sheet.direction_x = 1 	--facing right -1 facing left
	
	--This is a vertical sprite sheet
	--Player x size equals the width of the image
	player.size_x = imgs["player.png"]:getWidth()
	--The player y size equals the height of the whole sheet divided by how many frames
	player.size_y = imgs["player.png"]:getHeight() / s_sheet.max
	
	--We will push and pull here to move him
	player.speed_x = 0
	player.speed_y = 0
	player.max_speed = 100
	
	--initial position for the player
	player.x = 10
	player.y = game.floor
	player.rotation = 0

	--loop from 1 to max number of frames and create the quads
	for i=1,s_sheet.max do
		s_sheet[i] = love.graphics.newQuad(
			0,														-- X pos
			player.size_y*(i-1), 					-- Y pos
			player.size_x,								-- width
			player.size_y,								-- height
			imgs["player.png"]:getWidth(),-- total width of sprite sheet
			imgs["player.png"]:getHeight()-- total height of sprite sheet
		);
	end
	
end

-- GRAPHICS
function player.draw()
	if debug then
		--print some debug to screen
		love.graphics.printf("Player y: "..player.y,0,20,love.graphics.getWidth(),"left")
	end
	--Draw the player sprite
	love.graphics.drawq(imgs["player.png"], --drawable object
		s_sheet[s_sheet.iterator],						--quad array
		player.x, 				--X coordinate
		player.y,					--Y coordinate
		player.rotation, 	--rotation
		s_sheet.direction_x,--X scale 
		1,								--Y scale
		player.size_x/2, 	--X origin
		player.size_y/2)  --Y origin

end

-- LOGIC
function player.update(dt)
	
	if love.keyboard.isDown("right") or love.keyboard.isDown("left") then
			if love.keyboard.isDown("left") then 
				s_sheet.direction_x = -1 
			elseif love.keyboard.isDown("right") then
				s_sheet.direction_x = 1 
			end
		--if we're not moving we don't want standing ( frame 1)
		if s_sheet.iterator == 1 then s_sheet.iterator = 2 end
		
		--movement on x
		player.speed_x = player.speed_x + 5
		if player.speed_x >= player.max_speed then player.speed_x = player.max_speed end
		
		--move the player
		--player.x = player.x + player.speed_x * dt * s_sheet.direction_x
		--update our timer
		s_sheet.timer = s_sheet.timer + dt
		
		--only change frames each 0.15 seconds
			if s_sheet.timer > 0.15 then
				s_sheet.timer = 0
				s_sheet.iterator = s_sheet.iterator + 1
				if s_sheet.iterator > s_sheet.max then
					s_sheet.iterator = 1
				end
			end
	else 
		--decelerate
		player.speed_x = player.speed_x - 5
		if player.speed_x <= 0 then player.speed_x = 0 end
		--if we're not pressing left or right show the first frame (standing)
		s_sheet.iterator = 1
  end
	player.x = player.x + player.speed_x * dt * s_sheet.direction_x
	player.y = player.y + player.speed_y * dt 
	apply_gravity()
end

-- KEYBOARD
function player.keypressed(key)
	if key == " " and player.y >= 500 and player.y <= 512 then
		player.speed_y = player.speed_y - 200
	end
end


-- APPLY GRAVITY [[incomplete]]
function apply_gravity()
	if player.y < game.floor then
		player.speed_y = player.speed_y + 10
	else
		player.speed_y = 0
	end
	
end
