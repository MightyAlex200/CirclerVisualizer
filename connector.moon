c = Circler!
s = Swipe!
t = Text!
fb = Button!
ab = Button!
sb = Button!
rb = Button!
ib = Button!
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

	ib.text = 'click here to align with nearest int.'
	ib.y = rb.y + 25
	ib.width = 10000
	ib.pressed = ->
		s.intonly = true

	ab.text = '+'
	ab.y = ib.y + 25
	ab.pressed = ->
		c.lines+=1

	sb.text = '-'
	sb.y = ab.y
	sb.x = sb.x + 25
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
	ib\draw!
love.update = =>
	s\update @
	c.mult = s.s/1000
	c\update @
	fb\update @
	ab\update @
	sb\update @
	rb\update @
	ib\update @
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
	ib\mousepressed button