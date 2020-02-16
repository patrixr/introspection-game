PhysicsComponent = require 'src.components.base.physics_component'

class Block extends PhysicsComponent
  load: =>
    { :x, :y, :width, :height } = @opts

    world = @ctx\get('world')
    @body = love.physics.newBody(world, x + width / 2, y + height / 2, 'static')
    @shape = love.physics.newRectangleShape(width, height)
    @fixture = love.physics.newFixture(@body, @shape)

  draw: =>
    super!
    love.graphics.rectangle('fill', @x, @y, @width, @height)


return Block