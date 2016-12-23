export class Text
	draw: ->
		love.graphics.setColor 0, 0, 0
		love.graphics.print "Circler visualizer"
		love.graphics.print "Press 'q' and 'e' to change amount of lines", 0, 15
		love.graphics.print "Press 'w' to turn off friction", 0, 30
		love.graphics.print "click and drag to change the times table represented!", 0, love.graphics.getHeight!-15
