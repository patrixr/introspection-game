{ :Vec2d }    = require 'src.lib.geometry'
Trait         = require 'src.traits.trait'

count = 0

class Velocity extends Trait
  new: =>
    super('velocity')
    @forces   = Vec2d!
    @mass     = 1

  add_force: (force) =>
    @forces += force

  update: (dt, parent) =>
    -- acceleration = @forces
    velocity     = @forces * dt

    parent\set_position(
      parent\get_x! + velocity.x * dt,
      parent\get_y! + velocity.y * dt
    )

    @forces\update(0, 0)


return Velocity