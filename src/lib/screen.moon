Context           = require 'src.lib.context'

{ :warn, :dump }  = require 'src.lib.debug'

bool_prop = (opts, key) -> if type(opts[key]) == 'boolean' then opts[key] else true

class Screen extends Context
  --
  -- Creates a new screen
  --
  -- @method new
  -- @param {Scene} opts The scene to use. Can be nil
  -- @param {table} [opts] Object to be set by using the different attributes. Can be nil
  -- @param {boolean} [options.blocksDraw] True if screen prevents lower screens to draw
  -- @param {boolean} [options.blocksUpdate] True if screen prevents lower screens to update
  -- @memberof Screen
  --
  new: (opts = {}) =>
    super!
    @blocks_draw   = bool_prop(opts, 'blocks_draw')
    @blocks_update = bool_prop(opts, 'blocks_update')
    @blocks_input  = bool_prop(opts, 'blocks_input')

  get_context: => self

  load: =>
    warn 'Screen:load not implemented'

  unload: =>
    warn 'Screen:unload not implemented'

  keypressed: =>
    warn 'Screen:keypressed not implemented'

  keyreleased: =>
    warn 'Screen:keyreleased not implemented'



return Screen