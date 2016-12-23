export class Text
	text: ''
	draw: =>
		love.graphics.setColor 0, 0, 0
		love.graphics.print @text
		--love.graphics.print "Circler visualizer"
		--love.graphics.print "Press 'q' and 'e' to change amount of lines", 0, 15
		--love.graphics.print "Press 'w' to turn off friction", 0, 30
		--love.graphics.print "click and drag to change the times table represented!", 0, love.graphics.getHeight!-15
		--love.graphics.print "amount of lines: " .. @lines, 0, 30
		--love.graphics.print "table represented: " .. @mult, 0, 45
		--love.graphics.print "friction: ", 0, 75
		--love.graphics.print tostring(@slowdown), 50, 75