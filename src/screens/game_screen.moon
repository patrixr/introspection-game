_                 = require 'src.lib.utils'
Screen            = require 'src.lib.screen'
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

  unload: =>
    @get_world!\destroy!
    @clear!

  get_world: =>
    @get_context!\get('world')

  update: (dt) =>
    super(dt)
    @camera\update(dt)
    @get_world!\update(dt)

  draw: () =>
    @camera\apply () -> super!

return GameScreen