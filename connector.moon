c = Circler!
s = Swipe!
t = Text!
love.load = ->
	love.graphics.setBackgroundColor 255, 255, 255
love.draw = ->
	t\draw!
	s\draw!
	c\draw!
love.update = =>
	s\update @
	c.mult = s.s/1000
	c\update @
love.keypressed = =>
	c\keypressed @
	s\keypressed @
