_  = require 'src.lib.utils'

class ScreenManager

  @screens = {}

  -------------------
  -- Helpers
  -------------------

  each_screen = (screens, block_property, cb) ->
    to_trigger = _.reduce screens, {}, (res, screen, i) ->
      _.prepend(res, screen)
      return _.stop if screen[block_property]
      res
    _.each to_trigger, cb

  -------------------
  -- API
  -------------------

  @clear: =>
    @screens = {}

  --
  -- Pushes a screen to the stack
  --
  -- @param {Screen} screen the screen instance to push on the stack
  --
  @push: (screen) =>
    screen\load!
    table.insert(@screens, 1, screen)

  --
  -- Pops the top screen off the stack
  --
  -- @returns {Screen} screen the screen that got removed
  --
  @pop: =>
    screen = @screens[1]
    screen\unload!
    table.remove(@screens, 1)
    screen

  --
  -- Calls the draw method on the screen stack
  --
  @draw: () =>
    each_screen @screens, 'blocks_draw', (s) -> s\draw!

  --
  -- Calls the draw method on the screen stack
  --
  @update: (dt) =>
    each_screen @screens, 'blocks_update', (s) -> s\update(dt)

  --
  -- Inputs
  --

  @keypressed: (key, scancode, isrepeat) =>
    each_screen @screens, 'blocks_input', (s) -> s\keypressed(key, scancode, isrepeat)

  @keyreleased: (key, scancode) =>
    each_screen @screens, 'blocks_input', (s) -> s\keyreleased(key, scancode)

  @touchpressed: (id, x, y, dx, dy, pressure) =>
    each_screen @screens, 'blocks_input', (s) -> s\touchpressed(key, id, x, y, dx, dy, pressure)

  @touchreleased: (id, x, y, dx, dy, pressure) =>
    each_screen @screens, 'blocks_input', (s) -> s\touchreleased(key, id, x, y, dx, dy, pressure)

  @touchmoved: (id, x, y, dx, dy, pressure) =>
    each_screen @screens, 'blocks_input', (s) -> s\touchmoved(key, id, x, y, dx, dy, pressure)

  @mousepressed: (x, y, button, istouch, presses) =>
    each_screen @screens, 'blocks_input', (s) -> s\mousepressed(x, y, button, istouch, presses)

  @mousereleased: (x, y, button, istouch, presses) =>
    each_screen @screens, 'blocks_input', (s) -> s\mousereleased(x, y, button, istouch, presses)

  @mousemoved: (x, y, dx, dy, istouch) =>
    each_screen @screens, 'blocks_input', (s) -> s\mousemoved(x, y, dx, dy, istouch)

return ScreenManager