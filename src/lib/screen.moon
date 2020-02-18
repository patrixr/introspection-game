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

  update: (dt) => super(dt)

  draw: => super!

  keypressed: (key, scancode, isrepeat) =>
    @fire 'keypressed', key, scancode, isrepeat

  keyreleased: (key, scancode) =>
    @fire 'keyreleased', key, scancode

  touchpressed: (id, x, y, dx, dy, pressure) =>
    @fire 'touchpressed', id, x, y, dx, dy, pressure

  touchreleased: (id, x, y, dx, dy, pressure) =>
    @fire 'touchreleased', id, x, y, dx, dy, pressure

  touchmoved: (id, x, y, dx, dy, pressure) =>
    @fire 'touchmoved', id, x, y, dx, dy, pressure

  mousepressed: (x, y, button, istouch, presses) =>
    @fire 'mousepressed', x, y, button, istouch, presses

  mousereleased: (x, y, button, istouch, presses) =>
    @fire 'mousereleased', x, y, button, istouch, presses

  mousemoved: (x, y, dx, dy, istouch) =>
    @fire 'mousemoved', x, y, dx, dy, istouch

return Screen