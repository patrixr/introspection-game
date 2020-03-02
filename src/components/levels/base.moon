{ :panic, :dump } = require 'src.lib.debug'
Boundaries        = require 'src.components.terrain.boundaries'

class Level
  new: (width, height, opts = {}) =>
    panic('[Level] Missing dimensions') if width == nil or height == nil

    @opts   = opts
    @width  = width
    @height = height

  populate: (context) =>
    context\add Boundaries({ width: @width, height: @height }), 'terrain'

return Level