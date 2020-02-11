{ warn: warn } = require 'src.lib.debug'

class Drawable
  new: =>
    @x      = 0
    @y      = 0
    @width  = 0
    @height = 0

  update: =>
    -- Noop

  draw: =>
    -- Noop

  set_x: (x) => @x = x

  set_y: (y) => @y = y

  set_position: (x, y) =>
    @set_x(x)
    @set_y(y)

  set_width: (w) => @width = w

  set_height: (h) => @height = h

  set_size: (w, h) =>
    @set_width(w)
    @set_height(h)

  get_x: => @x

  get_y: => @y

  get_width: => @width

  get_height: => @height

  get_geometry: => {
     x:       @x,
     y:       @y,
     width:   @width,
     height:  @height
   }

return Drawable