c = Circler!
s = Swipe!
t = Text!
fb = Button!
ab = Button!
sb = Button!
rb = Button!
ib = Button!
inb = Button!
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

	inb.text = 'click here to invert background color'
	inb.y = ib.y + 25
	inb.width = 10000
	inb.pressed = ->
		a = love.graphics.getBackgroundColor! == 0,0,0
		if a
			love.graphics.setBackgroundColor 255, 255, 255
			t.color = {0,0,0}
			c.black = {0,0,0}
		else
			love.graphics.setBackgroundColor 0,0,0
			t.color = {255,255,255}
			c.black = {255,255,255}

	ab.text = '+'
	ab.y = inb.y + 25
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
	inb\draw!
love.update = =>
	s\update @
	c.mult = s.s/1000
	c\update @
	fb\update @
	ab\update @
	sb\update @
	rb\update @
	ib\update @
	inb\update @
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
	inb\mousepressed button
love.wheelmoved = (x,y) ->
	c\wheelmoved x,y