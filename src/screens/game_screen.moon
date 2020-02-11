_       = require 'src.lib.utils'
Screen  = require 'src.lib.screen'
Player  = require 'src.components.player'
Camera  = require 'src.components.camera'

class GameScreen extends Screen
  new: =>
    super!
    @player   = Player(100, 100)
    @camera   = Camera!

    @camera\follow @player
    @add @player

  update: (dt) =>
    super(dt)
    @camera\update(dt)

  draw: () =>
    @camera\apply () -> super!

return GameScreen