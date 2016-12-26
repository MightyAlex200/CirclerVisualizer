export class Circler
	radius: 200
	lines: 200
	mult: 2
	t: 0
	rainbow: true
	black: {0,0,0}
	draw: =>
		@radius = math.min love.graphics.getHeight!/2, love.graphics.getWidth!/2
		for line = 1, @lines
			love.graphics.setColor HSL line/@lines*255, 255, 128 if @rainbow else love.graphics.setColor @black
			pos = line/@lines * math.pi * 2
			x = math.sin(pos)*@radius+love.graphics.getWidth!/2
			y = math.cos(pos)*@radius+love.graphics.getHeight!/2
			pos1 = line*@mult/@lines * math.pi * 2
			x1 = math.sin(pos1)*@radius+love.graphics.getWidth!/2
			y1 = math.cos(pos1)*@radius+love.graphics.getHeight!/2
			love.graphics.line x,y,x1,y1
		love.graphics.setColor 0, 0, 0
	keypressed: (key) =>
		if key == "q"
			@lines -= 1
		if key == "e"
			@lines += 1
	update: (dt) =>
		@t += dt
		if @t >= 25
			@t -= 1
	wheelmoved: (x,y) =>
		@lines += y