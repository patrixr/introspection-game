Block       = require 'src.components.terrain.block'
Component   = require 'src.components.base.component'
_           = require 'src.lib.utils'

class Boundaries extends Component

  load: () =>
    super!
    { :width, :height } = @opts
    @walls = {
      Block({ x: 0, y: 0, width: 1, height: height, context: @ctx }),
      Block({ x: width, y: 0, width: 1, height: height, context: @ctx }),
      Block({ x: 0, y: 0, width: width, height: 1, context: @ctx }),
      Block({ x: 0, y: height, width: width, height: 1, context: @ctx })
    }

    _.each @walls, (w) -> w\load!

  unload: () =>
    _.each @walls, (w) -> w\unload!

  update: (dt) =>
    _.each @walls, (w) -> w\update(dt)

  draw: () =>
    _.each @walls, (w) -> w\draw!




return Boundaries