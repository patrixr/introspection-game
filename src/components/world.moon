Component = require 'src.components.base.component'

class World extends Component
  new: =>
    love.physics.setMeter(64)
    @world = love.physics.newWorld(0, 9.81*64, true)

  add: (physical_entity) =>
    @world

  update: (dt) =>
    @world\update dt

return World