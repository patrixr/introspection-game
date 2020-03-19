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

  update: (dt, parent) =>
    ctx     = parent\get_context!
    ground  = ctx\get 'ground'

    @grounded = false

    return unless ground

    { :left, :right } = @sides(parent)

    left_i = nil
    right_i = nil
    left_delta = nil
    right_delta = nil

    _.each ground.segments, (seg) ->
      return _.stop if left_i != nil and right_i != nil

      unless left_i
        left_i  = seg\intersection(left)
        left_delta = math.abs(left.y2 - left_i.y) if left_i

      unless right_i
        right_i = seg\intersection(right)
        right_delta = math.abs(right.y2 - right_i.y) if right_i

    return unless left_i != nil and right_i != nil

    -- middle = nil
    -- middle = left_i if right_i == nil
    -- middle = right_i if left_i == nil
    -- middle = Segment(left_i.x, left_i.y, right_i.x, right_i.y)\middle! unless middle

    delta = 0

    -- delta = right_delta if left_i == nil
    -- delta = left_delta if right_i == nil
    delta = math.min(right_delta, left_delta) --unless delta != nil

    parent\set_y parent\get_y! - delta

    @grounded = true


return Grounded