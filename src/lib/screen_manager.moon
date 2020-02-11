_  = require 'src.lib.utils'

class ScreenManager

  @screens = {}

  -------------------
  -- Helpers
  -------------------

  filter_screens = (screens, block_property) ->
    _.reduce screens, {}, (res, screen, i) ->
      _.prepend(res, screen)
      return if screen[block_property] then _.stop else res

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
  @draw: (...) =>
    to_draw = filter_screens @screens, 'blocks_draw'
    for i = 1, #to_draw
      to_draw[i]\draw(...)

  --
  -- Calls the draw method on the screen stack
  --
  @update: (...) =>
    to_update = filter_screens @screens, 'blocks_update'
    for i = 1, #to_update
      to_update[i]\update(...)

  @keypressed: (...) =>
    to_notify = filter_screens @screens, 'blocks_input'
    for i = 1, #to_notify
      to_notify[i]\keypressed(...)

  @keyreleased: (...) =>
    to_notify = filter_screens @screens, 'blocks_input'
    for i = 1, #to_notify
      to_notify[i]\keyreleased(...)

return ScreenManager