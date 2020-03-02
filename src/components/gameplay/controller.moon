LogicalComponent  = require 'src.components.base.logical_component'
{ :Vec2d }        = require 'src.lib.geometry'
{ :panic }        = require 'src.lib.debug'
_                 = require 'src.lib.utils'

class Controller extends LogicalComponent
  load: =>
    ctx = @get_context!

    @player = ctx\get('player')
    @listeners = {}

    panic('[Controller] Could not find player in context') unless @player

    this = @

    _.push @listeners, ctx\on('mousepressed',   (...) -> this\on_press(...))
    _.push @listeners, ctx\on('mousereleased',  (...) -> this\on_release(...))
    _.push @listeners, ctx\on('mousemoved',     (...) -> this\on_move(...))

  unload: =>
    _.each @listeners, (el) -> el!

  on_press: (x, y, button, istouch, presses) =>
    -- @pressed = true
    -- @move_towards(x)

  on_release: (x, y, button, istouch, presses) =>
    @pressed = false
    -- @player\set_motion Vec2d!

  on_move: (x, y, dx, dy, istouch) =>
    -- @move_towards(x) if @pressed

  move_towards: (x) =>
    -- @player\set_motion Vec2d(x - @player\get_x!, 0)\normalized!
