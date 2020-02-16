_         = require 'src.lib.utils'
{ :warn } = require 'src.lib.debug'

class Component
  new: (opts = {}) =>
    @opts   = opts
    @ctx    = _.get(opts, 'context', nil)
    @x      = _.get(opts, 'x', 0)
    @y      = _.get(opts, 'y', 0)
    @width  = _.get(opts, 'width', 0)
    @height = _.get(opts, 'height', 0)

  load: =>
    -- to implement

  unload: =>
    -- to implement

  update: =>
    -- to implement

  draw: =>
    -- to implement

  get_context: => @ctx

  set_context: (context) =>
    @ctx = context

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
    x:       @get_x!,
    y:       @get_y!,
    width:   @get_width!,
    height:  @get_height!
  }

return Component