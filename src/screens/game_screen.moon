_       = require 'src.lib.utils'
Screen  = require 'src.lib.screen'
Player  = require 'src.components.player'
Camera  = require 'src.components.camera'

class GameScreen extends Screen
  new: =>
    @objects  = {}
    @player   = Player(100, 100)
    @camera   = Camera!

    @camera\follow @player

    @player\set_state 'walking'

    _.push @objects, @player

  update: (dt) =>
    @camera\update!
    _.each @objects, (o) -> o\update(dt)

  draw: () =>
    @camera\apply () -> _.each(@objects, (o) -> o\draw(dt))

return GameScreen