--player.lua
player = {}

-- ON LOAD
function player.load()
	player.sprites = love.graphics.newSpriteBatch(imgs["player.png"],14)
	player.clock = 0
	--the player size is equal to the sprite size / number of images in sprite
	player.size={}
	player.size.x = imgs["player.png"]:getWidth() / 14
	player.size.y = imgs["player.png"]:getHeight()
	
	--initial position for the player
	player.x = 10
	player.y = cfg.screen.height - 200
	player.rotation = 0
end

-- GRAPHICS
function player.draw()
	love.graphics.draw(player.sprites, --drawable object
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
	player.clock = player.clock + dt
	if love.keyboard.isDown("right") then
    player.x = player.x + 100*dt
  end
  if love.keyboard.isDown("left") then
    player.x = player.x - 100*dt
  end
end

-- KEYBOARD
function player.keypressed()

end
