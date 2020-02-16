{ :panic, :dump } = require 'src.lib.debug'
Boundaries        = require 'src.components.terrain.boundaries'

class Level
  new: (width, height, opts = {}) =>
    panic('[Level] Missing dimensions') if width == nil or height == nil

    @opts   = opts
    @width  = width
    @height = height

  populate: (context) =>
    love.physics.setMeter(64)
    world = love.physics.newWorld(0, 9.81*64, true)

    context\set('world', world)
    context\add Boundaries({ width: @width, height: @height }), 'terrain'

return Level