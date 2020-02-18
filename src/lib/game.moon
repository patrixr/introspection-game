debug           = require 'src.lib.debug'
ScreenManager   = require 'src.lib.screen_manager'

class Game
  new: (config) =>
    @config = config

  run: =>
    { :width, :height, :vsync, :background, :fullscreen } = @config.screen

    debug_mode = @config.debug_mode

    --
    -- Setup love2d
    --

    love.load = (arg) ->
      love.window.setMode width, height, fullscreen, vsync
      love.graphics.setBackgroundColor background or {0, 0, 0}

      startup_screen = require(@config.startup.screen)
      ScreenManager\push startup_screen!

    love.keypressed = (key) ->
      love.event.push('quit') if key == 'escape'
      ScreenManager\keypressed key

    love.keyreleased = (key) ->
      ScreenManager\keyreleased key

    love.touchpressed = (id, x, y, dx, dy, pressure) ->
      ScreenManager\touchpressed id, x, y, dx, dy, pressure

    love.touchreleased = (id, x, y, dx, dy, pressure) ->
      ScreenManager\touchreleased id, x, y, dx, dy, pressure

    love.touchmoved = (id, x, y, dx, dy, pressure) ->
      ScreenManager\touchmoved id, x, y, dx, dy, pressure

    love.mousepressed = (x, y, button, istouch, presses) ->
      ScreenManager\mousepressed x, y, button, istouch, presses

    love.mousereleased = (x, y, button, istouch, presses) ->
      ScreenManager\mousereleased x, y, button, istouch, presses

    love.mousemoved = (x, y, dx, dy, istouch) ->
      ScreenManager\mousemoved x, y, dx, dy, istouch

    love.draw = ->
      ScreenManager\draw!
      debug.draw_fps! if debug_mode.active and debug_mode.show_fps

    love.update = (dt) ->
      ScreenManager\update dt



return Game