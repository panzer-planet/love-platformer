debug = false
require('game')
require('splash')

function love.load()

  -- Load images (global assets)
  img_names = {"background.jpg","player.png"}
  imgs = {}
  for _,v in ipairs(img_names) do
    imgs[v]=love.graphics.newImage("assets/"..v)
  end
  
  -- Set filter to nearest
  for _,v in pairs(imgs) do
    v:setFilter("nearest","nearest")
  end
  -- Initialize font, and set it.
  default_font = love.graphics.newFont("assets/font.ttf",14)
	title_font = love.graphics.newFont("assets/font.ttf",21)
  
	
  
  -- define colors (global assets)
  bgcolor = {r=0,g=0,b=0}
  fontcolor = {r=255,g=255,b=255}
  splash.load()
	game.load()
  -- initial state
  state = "splash" 
  --load the splash
  
end

function love.draw()
  -- Set color
  love.graphics.setColor(bgcolor.r,bgcolor.g,bgcolor.b)
  -- Draw rectangle for background
  love.graphics.rectangle("fill",
    0,0 ,love.graphics.getWidth(),love.graphics.getHeight())
  -- Return the color back to normal.
  love.graphics.setColor(255,255,255)
  if state == "splash" then
    splash.draw()
  elseif state == "game" then
    game.draw()
  end
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