cfg = {}

function love.conf(t)
  t.title = "LoVE platformer"
	t.author = "Werner Roets"
	t.url = "https://github.com/panzer-planet/love-platformer"
	t.version = "0.8.0"
	t.console = true
	t.fullscren = false
  t.screen.width = 1000
  t.screen.height = 600

	cfg = t
end