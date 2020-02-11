Drawable = require 'src.components.base.drawable'

class World extends Drawable
  new: =>
    love.physics.setMeter(64)
    @world = love.physics.newWorld(0, 9.81*64, true)

  add: (physical_entity) =>
    @world

  update: (dt) =>
    @world\update dt

return World