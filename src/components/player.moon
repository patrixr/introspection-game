SpriteSheet         = require 'src.components.spritesheet'
PhysicsComponent    = require 'src.components.base.physics_component'
{ :Vec2d }          = require 'src.lib.geometry'

player_sheet = require 'src.assets.sprites.player'

class Player extends SpriteSheet(PhysicsComponent)
  DIRECTIONS = {
    LEFT:   1,
    RIGHT:  2
  }

  new: (opts = {}) =>
    super(player_sheet, opts)
    @speed          = 400
    @motion         = Vec2d!

  load: (x, y) =>
    super!
    { :width, :height } = @get_sprite_size!

    world     = @get_context!\get('world')
    @body     = love.physics.newBody(world, @opts.x, @opts.y, "dynamic")
    @shape    = love.physics.newRectangleShape(width, height)
    @fixture  = love.physics.newFixture(@body, @shape)

    @body\setLinearDamping(1)

  unload: ->

  update: (dt) =>
    super(dt)

    @body\applyForce(@motion[1] * @speed, @motion[2] * @speed)

    if @is_moving!
      @set_state 'walking'
      @set_horizontal_flip(@direction! == DIRECTIONS.LEFT)
    else
      @set_state 'idle'

  draw: =>
    super!

  set_motion: (vec) =>
    @motion[1] = vec[1]

  is_moving: =>
    x, y = @body\getLinearVelocity!
    x > 0.1 or x < -0.1

  direction: =>
    x, y = @body\getLinearVelocity!
    if x < 0 then DIRECTIONS.LEFT else DIRECTIONS.RIGHT

return Player