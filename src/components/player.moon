SpriteSheet         = require 'src.components.spritesheet'
Velocity            = require 'src.traits.velocity'
Gravity             = require 'src.traits.gravity'
Grounded            = require 'src.traits.grounded'
Mass                = require 'src.traits.mass'
Controller          = require 'src.traits.controller'
{ :Compose }        = require 'src.lib.composer'
{ :Vec2d }          = require 'src.lib.geometry'

player_sheet = require 'src.assets.sprites.player'

--
-- Main Character class
--
--
--
class Player extends Compose(SpriteSheet, { Mass(20), Velocity, Gravity, Grounded, Controller })
  DIRECTIONS = {
    LEFT:   1,
    RIGHT:  2
  }

  new: (opts = {}) =>
    super(player_sheet, opts)

  load: (x, y) =>
    super!

  unload: ->

  update: (dt) =>
    super(dt)

    if @is_moving!
      @set_state 'walking'
      @set_horizontal_flip(@direction! == DIRECTIONS.LEFT)
    else
      @set_state 'idle'

  draw: =>
    super!

  is_moving: =>
    @velocity.forces.x != 0

  direction: =>
    if @velocity.forces.x  < 0 then DIRECTIONS.LEFT else DIRECTIONS.RIGHT

return Player