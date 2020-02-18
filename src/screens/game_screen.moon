_                 = require 'src.lib.utils'
Screen            = require 'src.lib.screen'
Controller        = require 'src.components.gameplay.controller'
Camera            = require 'src.components.camera'
PlaygroundLevel   = require 'src.components.levels.playground'

class GameScreen extends Screen
  new: (level_klass = PlaygroundLevel) =>
    super!
    @level = level_klass!

  load: =>
    @level\populate(self)

    @player   = @get('player')

    @camera   = Camera!
    @camera\follow @player
    @set 'camera', @camera

    @add Controller!

  unload: =>
    @get_world!\destroy!
    @clear!

  get_world: =>
    @get_context!\get('world')

  update: (dt) =>
    super(dt)
    @camera\update(dt)
    @get_world!\update(dt)

  draw: =>
    @camera\apply () -> super!

  mousepressed: (x, y, button, istouch, presses) =>
    rx, ry = @camera\real_coordinates(x, y)
    super rx, ry, button, istouch, presses

  mousereleased: (x, y, button, istouch, presses) =>
    rx, ry = @camera\real_coordinates(x, y)
    super rx, ry, button, istouch, presses

  mousemoved: (x, y, dx, dy, istouch) =>
    rx, ry = @camera\real_coordinates(x, y)
    super rx, ry, dx, dy, istouch

return GameScreen