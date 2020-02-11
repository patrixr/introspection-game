SpriteSheet = require 'src.components.spritesheet'

player_sheet = require 'src.assets.sprites.player'

class Player extends SpriteSheet
  new: (x = 0, y = 0) =>
    super player_sheet
    @set_position x, y

  update: (dt) =>
    @x += 1
    super(dt)

  draw: =>
    super!

return Player