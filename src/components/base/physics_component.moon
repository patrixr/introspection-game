{ :panic }  = require 'src.lib.debug'
Component   = require 'src.components.base.component'

class PhysicsComponent extends Component

  get_body: =>
    panic('[PhysicsComponent] body uninitialized') unless @body
    @body

  get_shape: =>
    panic('[PhysicsComponent] shape uninitialized') unless @shape
    @shape

  get_fixture: =>
    panic('[PhysicsComponent] fixture uninitialized') unless @fixture
    @fixture

  set_x: (x) =>
    @get_body!\setX(x + @get_height / 2)

  set_y: (y) =>
    @get_body!\setY(y + @get_width! / 2)

  update: (dt) =>
    super(dt)
    x1, y1, x2, y2 = @get_fixture!\getBoundingBox!
    -- @x = @get_body!\getX! - @get_width!/2
    -- @y = @get_body!\getY! - @get_height!/2
    @x = x1
    @y = y1
    @width  = x2 - x1
    @height = y2 - y1

return PhysicsComponent
