{ :Vec2d }    = require 'src.lib.geometry'
Trait         = require 'src.traits.trait'
Velocity      = require 'src.traits.velocity'
_             = require 'src.lib.utils'

class Controller extends Trait
  @dependencies = { Velocity }

  new: =>
    super('controller')
    @listeners = {}
    @move = false

  load: (player) =>
    ctx = player\get_context!

    this = @

    _.push @listeners, ctx\on('mousepressed',   (...) -> this\start_moving(...))
    _.push @listeners, ctx\on('mousemoved',     (...) -> this\move_towards(...))
    _.push @listeners, ctx\on('mousereleased',  (...) -> this\stop_moving(...))

  update: (dt, player) =>
    return unless @move and player.grounded\on_ground!

    player_x = player\get_x! + player\get_width! / 2

    diff = player_x - @target_x

    return if math.abs(diff) < player\get_width! * 2

    sign = if diff > 0 then -1 else 1

    player.velocity\add_force Vec2d(sign * 10000, 0)

  unload: =>
    _.each @listeners, (el) -> el!

  stop_moving: =>
    @move = false

  start_moving: (x) =>
    @move = true
    @move_towards(x)

  move_towards: (x) =>
    @target_x = x


return Controller