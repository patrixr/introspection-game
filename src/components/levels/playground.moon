{ :screen }   = require 'config'
Level         = require 'src.components.levels.base'
Player        = require 'src.components.player'
Ground        = require 'src.components.terrain.ground'

class PlaygroundLevel extends Level
  new: (opts = {})=>
    super(screen.width * 2, screen.height * 2, opts)

  populate: (context) =>
    super(context)

    player = Player({ x: 100, y: 1.5 * screen.height })
    context\set 'player', player, { add: 'actors' }

    ground = Ground({
      0, screen.height * 2 - 100,
      100, screen.height * 2 - 80,
      200, screen.height * 2 - 100,
      300, screen.height * 2 - 80,
      400, screen.height * 2 - 100,
      500, screen.height * 2 - 80
      600, screen.height * 2 - 80
    })

    context\set 'ground', ground, { add: 'terrain' }


return PlaygroundLevel