export class Swipe
	
	s: 0
	ml: {-1,-1}
	xvel: 0
	tap: false
	slowdown: true

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
		
		@s -= @xvel
		@ml = {love.mouse.getX!, love.mouse.getY!}
	keypressed: (key) =>
		if key == "w"
			@slowdown = not @slowdown
