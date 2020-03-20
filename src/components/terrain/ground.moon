{ :Segment }  = require 'src.lib.geometry'
Component     = require 'src.components.base.component'
_             = require 'src.lib.utils'

class Ground extends Component

  new: (points = {}, opts = {}) =>
    super(opts)

    @points       = points
    @line_values  = _.reduce points, {}, (res, point) ->
      _.push(res, point.x)
      _.push(res, point.y)
      res

    @segments = {}
    for i = 1, #points - 1, 1
      p1 = points[i]
      p2 = points[i + 1]
      _.push @segments, Segment(p1.x, p1.y, p2.x, p2.y)

  load: () =>

  unload: () =>

  update: (dt) =>

  draw: () =>
    love.graphics.line @line_values

return Ground