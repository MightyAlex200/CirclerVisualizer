c = Circler!
s = Swipe!
t = Text!
fb = Button!
ab = Button!
sb = Button!
rb = Button!
love.load = ->
	love.graphics.setBackgroundColor 255, 255, 255
	fb.text = 'click here to toggle friction'
	fb.width = 1000
	fb.pressed = ->
		s.slowdown = not s.slowdown
	fb.y = 65
	rb.text = 'click here to toggle rainbow color'
	rb.width = 10000
	rb.y = fb.y + 25
	rb.pressed = ->
		c.rainbow = not c.rainbow
	ab.text = '+'
	ab.y = rb.y + 25
	sb.text = '-'
	sb.y = ab.y
	sb.x = sb.x + 25
	ab.pressed = ->
		c.lines+=1
	sb.pressed = ->
		c.lines-=1

love.draw = ->
	t\draw!
	s\draw!
	c\draw!
	fb\draw!
	ab\draw!
	sb\draw!
	rb\draw!
love.update = =>
	s\update @
	c.mult = s.s/1000
	c\update @
	fb\update @
	ab\update @
	sb\update @
	rb\update @
	t.text = "Circler visualizer
current multiplication table being represented: #{c.mult}
amount of lines: #{c.lines}
friction: #{tostring s.slowdown}"
love.keypressed = =>
	c\keypressed @
	s\keypressed @
love.mousepressed = (x,y,button) ->
	fb\mousepressed button
	ab\mousepressed button
	sb\mousepressed button
	rb\mousepressed button