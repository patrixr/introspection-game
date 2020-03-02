SpriteSheet         = require 'src.components.spritesheet'
Velocity            = require 'src.traits.velocity'
Gravity             = require 'src.traits.gravity'
Mass                = require 'src.traits.mass'
{ :Compose }        = require 'src.lib.composer'
{ :Vec2d }          = require 'src.lib.geometry'

player_sheet = require 'src.assets.sprites.player'

--
-- Main Character class
--
--
--
class Player extends Compose(SpriteSheet, { Mass(20), Velocity, Gravity })
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

    -- if @is_moving!
    --   @set_state 'walking'
    --   @set_horizontal_flip(@direction! == DIRECTIONS.LEFT)
    -- else
    --   @set_state 'idle'

  draw: =>
    super!

  -- set_motion: (vec) =>
  --   @motion[1] = vec[1]

  -- is_moving: =>
  --   x, y = @body\getLinearVelocity!
  --   x > 0.1 or x < -0.1

  -- direction: =>
  --   x, y = @body\getLinearVelocity!
  --   if x < 0 then DIRECTIONS.LEFT else DIRECTIONS.RIGHT

return Player