export class Swipe
	
	s: 0
	ml: {-1,-1}
	xvel: 0
	tap: false
	slowdown: true
	intonly: true

	load: ->

	draw: =>
		love.graphics.setColor 0,0,0
		love.graphics.setColor 255, 0, 0 if not @slowdown else love.graphics.setColor 0, 255, 0
	update: =>
		if love.mouse.isDown 1
			if @tap
				if @ml[1] != -1
					@xvel = love.mouse.getX!-@ml[1]
			else
				@tap = true
		else
			@tap = false
		
		if @slowdown
			@xvel -= 1 if @xvel > 0
			@xvel += 1 if @xvel < 0
		if @intonly
			round = math.floor(@s/1000 + 0.5) - @s/1000
			if round != 0
				if round > 0
					@xvel -= 1
				else
					@xvel += 1
			else
				@intonly = false

		@s -= @xvel
		@ml = {love.mouse.getX!, love.mouse.getY!}
	keypressed: (key) =>
		if key == "w"
			@slowdown = not @slowdown
