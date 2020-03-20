{ :screen }   = require 'config'
{ :Point }    = require 'src.lib.geometry'
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
      Point(0, screen.height * 2 - 100)
      Point(100, screen.height * 2 - 80)
      Point(200, screen.height * 2 - 100)
      Point(300, screen.height * 2 - 80)
      Point(400, screen.height * 2 - 100)
      Point(500, screen.height * 2 - 80)
      Point(600, screen.height * 2 - 80)
    })

    context\set 'ground', ground, { add: 'terrain' }


return PlaygroundLevel