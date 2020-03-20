{ :Vec2d, :Segment }    = require 'src.lib.geometry'
Trait                   = require 'src.traits.trait'
_                       = require 'src.lib.utils'

class Grounded extends Trait
  new: =>
    super('grounded')

    @grounded = false

  load: (parent) =>

  sides: (cmp) =>
    { :x, :y, :width, :height } = cmp\get_geometry!
    {
      left:   Segment(x, y, x, y + height)
      right:  Segment(x + width, y, x + width, y + height)
    }

  on_ground: => @grounded

  falling: => not @grounded

  clamp_position: (parent) =>
    { :x, :y, :width, :height } = parent\get_geometry!

    max_width = parent\get_context!\get('level.width')
    max_height = parent\get_context!\get('level.height')

    parent\set_x(0) if x < 0
    parent\set_x(max_width - width) if x > max_width - width
    parent\set_y(0) if y < 0
    parent\set_y(max_height - height) if y > max_height - height



  update: (dt, parent) =>
    ctx     = parent\get_context!
    ground  = ctx\get 'ground'

    @grounded = false

    @clamp_position(parent)

    return unless ground

    { :left, :right } = @sides(parent)

    left_i = nil
    right_i = nil

    _.each ground.segments, (seg) ->
      return _.stop if left_i != nil and right_i != nil

      left_i  = seg\intersection(left) unless left_i
      right_i = seg\intersection(right) unless right_i

    return if left_i == nil and right_i == nil

    right_delta = if right_i then math.abs(right.y2 - right_i.y) else 0
    left_delta = if left_i then math.abs(left.y2 - left_i.y) else 0

    delta = if (left_i and right_i) then math.min(right_delta, left_delta) else (right_delta or left_delta)

    parent\set_y parent\get_y! - delta

    @grounded = true


return Grounded