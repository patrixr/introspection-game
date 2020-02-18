{ :screen }   = require 'config'
Level         = require 'src.components.base.level'
Player        = require 'src.components.player'

class PlaygroundLevel extends Level
  new: (opts = {})=>
    super(screen.width * 2, screen.height * 2, opts)

  populate: (context) =>
    super(context)

    player = Player({ x: 100, y: 1.5 * screen.height })
    context\add player, 'actors'
    context\set 'player', player


return PlaygroundLevel