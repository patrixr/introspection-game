_                 = require 'src.lib.utils'
{ :warn, :dump }  = require 'src.lib.debug'
{ :debug_mode }   = require 'config'

class Component
  new: (opts = {}) =>
    @opts   = opts
    @ctx    = _.get(opts, 'context', nil)
    @x      = _.get(opts, 'x', 0)
    @y      = _.get(opts, 'y', 0)
    @width  = _.get(opts, 'width', 0)
    @height = _.get(opts, 'height', 0)
    @traits = {}

  use: (trait) =>
    name = trait\get_name!

    error("[Component] Traits must be named") unless name

    @[name] = trait
    @traits[trait.__class] = trait

  has: (trait_klass) => @traits[trait_klass] != nil

  load: =>
    _.each @traits, (t) -> t\load(@)

  unload: =>
    _.each @traits, (t) -> t\unload(@)

  update: (dt) =>
    _.each @traits, (t) -> t\update(dt, @)

  draw: =>
    if debug_mode.active
      r, g, b, a = love.graphics.getColor!
      love.graphics.setColor(0, 255, 0, 1)
      love.graphics.rectangle('line', @get_x!, @get_y!, @get_width!, @get_height!)
      love.graphics.setColor(r, g, b, a)

  get_context: => @ctx

  set_context: (context) => @ctx = context

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