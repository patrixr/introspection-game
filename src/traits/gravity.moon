{ :Vec2d }    = require 'src.lib.geometry'
Trait         = require 'src.traits.trait'
Velocity      = require 'src.traits.velocity'
Mass          = require 'src.traits.mass'

class Gravity extends Trait
  @dependencies = { Velocity, Mass }

  new: =>
    super('gravity')

  load: (parent) =>
    @value    = 9.84 * 64 * parent.mass.value
    @enabled  = true

  update: (dt, parent) =>
    parent.velocity\add_force Vec2d(0, @value)

return Gravity