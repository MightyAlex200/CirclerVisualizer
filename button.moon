export class Button
    x: 0
    y: 0
    width: 100
    height: 50
    text: 'Button'
    font: love.graphics.newFont!
    padding: 10
    ishover: false
    colors:{
        
        regular: {128,128,128}
        highlight: {180,180,180}

        }
    draw: =>
        @height = @font\getHeight! + @padding 
        @width = math.min @font\getWidth(@text) + @padding, @width
        love.graphics.setColor @colors["regular"] if not @ishover else love.graphics.setColor @colors["highlight"]
        love.graphics.rectangle "fill", @x, @y, @width, @height
        love.graphics.setColor 255,255,255
        love.graphics.printf @text, @x+@padding/2, @y+@padding/2, @width
    update: (dt) =>
        mouse = {}
        mouse.x = love.mouse.getX!
        mouse.y = love.mouse.getY!
        @ishover = ( mouse.x > @x and mouse.x < (@width+@x) ) and ( mouse.y > @y and mouse.y < @y+@height )
    mousepressed: (b) =>
        if b == 1 and @ishover
            @pressed!
    pressed: =>
        print 'placeholder'