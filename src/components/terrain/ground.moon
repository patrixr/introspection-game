{ :Segment }  = require 'src.lib.geometry'
Component     = require 'src.components.base.component'
_             = require 'src.lib.utils'

class Ground extends Component

  new: (points = {}, opts = {}) =>
    super(opts)

    @points   = points
    @segments = {}

    for i = 1, #points - 2, 2
      x1 = points[i]
      y1 = points[i + 1]
      x2 = points[i + 2]
      y2 = points[i + 3]
      _.push @segments, Segment(x1, y1, x2, y2)

  load: () =>

  unload: () =>

  update: (dt) =>

  draw: () =>
    love.graphics.line @points

return Ground