SpriteSheet         = require 'src.components.spritesheet'
PhysicsComponent    = require 'src.components.base.physics_component'

player_sheet = require 'src.assets.sprites.player'

class Player extends SpriteSheet(PhysicsComponent)
  new: (opts = {}) =>
    super(player_sheet, opts)

  load: (x, y) =>
    super!
    { :width, :height } = @get_sprite_size!

    world = @get_context!\get('world')
    @body = love.physics.newBody(world, @opts.x, @opts.y, "dynamic")
    @shape = love.physics.newRectangleShape(width, height)
    @fixture = love.physics.newFixture(@body, @shape)
    @fixture\setRestitution(0.1)

  unload: ->

  update: (dt) =>
    super(dt)

  draw: =>
    super!

return Player