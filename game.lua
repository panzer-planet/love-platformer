--game.lua
require('player')
game = {}
function game.load()
  -- background init
  game.clock = 0
	love.graphics.setFont(default_font)
	player.load()
end

function game.draw()
  -- Draw moving background
      love.graphics.draw(imgs["background.jpg"],0,0)
			player.draw()
end

function game.update(dt)
  --update game clock
  game.clock = game.clock + dt
	player.update(dt)
end

function game.keypressed(key)
	player.keypressed(key)
end