--player.lua
player = {}

-- ON LOAD
function player.load()
	--player.sprites = love.graphics.newSpriteBatch(imgs["player.png"],14)
	--player.sprite = love.graphics.newImage(imgs["player.png"])
	--yer size is equal to the sprite size / number of images in sprite
	player.size={}
	player.size.x = imgs["player.png"]:getWidth() / 14
	player.size.y = imgs["player.png"]:getHeight()
	s_sheet = {}
	for i=1,14 do
		s_sheet[i] = love.graphics.newQuad(
			player.size.x*(i-1),	-- X start
			0, 										-- Y start
			player.size.x*i,			-- X end
			player.size.y,				-- Y end
			834,100	
		);
	end
	--the pla
	s_sheet.iterator = 1
	s_sheet.timer = 0
	s_sheet.moving = false
	s_sheet.max = 14
	--initial position for the player
	player.x = 10
	player.y = cfg.screen.height - 200
	player.rotation = 0
end

-- GRAPHICS
function player.draw()
	love.graphics.drawq(imgs["player.png"], --drawable object
		s_sheet[s_sheet.iterator],
		player.x, 				--X coordinate
		player.y,					--Y coordinate
		player.rotation, 	--rotation
		1,								--X scale 
		1,								--Y scale
		player.size.x/2, 	--X origin
		player.size.y/2)  --Y origin

end
-- LOGIC
function player.update(dt)
	
	
	if love.keyboard.isDown("right") then
    player.x = player.x + 100*dt
		s_sheet.timer = s_sheet.timer + dt
			if s_sheet.timer > 0.2 then
				s_sheet.timer = 0
				s_sheet.iterator = s_sheet.iterator + 1
				if s_sheet.iterator > s_sheet.max then
					s_sheet.iterator = 1
				end
			end
  end
	
  if love.keyboard.isDown("left") then
    player.x = player.x - 100*dt
  end
end

-- KEYBOARD
function player.keypressed()

end
