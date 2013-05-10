debug = true
require('game')
require('splash')

function love.load()
	print("Initialising love-platformer")
  -- Load images (global assets)
	load_images()
  -- Initialize font, and set it.
	init_graphics()
  init_fonts()
  	
	--load splash and game states
  splash.load()
	game.load()
  -- initial state
  state = "splash" 
end

function love.draw()
	love.graphics.clear()--not sure this is needed
  if state == "splash" then
    splash.draw()
  elseif state == "game" then
    game.draw()
  end
	
	if debug then
		love.graphics.printf("FPS: "..tostring(love.timer.getFPS( )),10,20,love.graphics.getWidth()-20,"right")
	end
	--
end

function love.update(dt)
  if state == "splash" then
    splash.update(dt)
  elseif state == "game" then
		game.update(dt)
	end
end

function love.keypressed(key)
  if state == "splash" then
    splash.keypressed(key)
  elseif state == "game" then
		game.keypressed(key)
	end
	
  if key == "`" then
    debug = not debug
  end

end
--[[
	initialise any drawing settings
]]
function init_graphics()
	bgcolor = {r=0,g=0,b=0}
	love.graphics.setColor(bgcolor.r,bgcolor.g,bgcolor.b)
end

function init_fonts()
	default_font = love.graphics.newFont("assets/font.ttf",14)
	title_font = love.graphics.newFont("assets/font.ttf",21)
	fontcolor = {r=255,g=255,b=255}
end

--[[
	Load any images required throughout the game,
	specify images to load at startup in this function.
	They must be in the assets folder
]]
function load_images()
  img_names = {
		"background.jpg",
		"player.png"
	}
  imgs = {}
  for _,v in ipairs(img_names) do
    imgs[v]=love.graphics.newImage("assets/"..v)
  end
  
  -- Set filter to nearest
  for _,v in pairs(imgs) do
    v:setFilter("nearest","nearest")
  end
end