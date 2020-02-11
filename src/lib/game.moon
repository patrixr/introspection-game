debug           = require 'src.lib.debug'
ScreenManager   = require 'src.lib.screen_manager'

class Game
  new: (config) =>
    @config = config

  run: =>
    {
      width:      width,
      height:     height,
      vsync:      vsync,
      background: background
    } = @config.screen

    debug_mode = @config.debug_mode

    --
    -- Setup love2d
    --
    love.conf = (t) ->
      t.console = true

    love.load = (arg) ->
      love.graphics.setBackgroundColor background or {0, 0, 0}

      love.window.setMode width, height, {
        resizable: false
        vsync: @config.screen.vsync
      }

      startup_screen = require(@config.startup.screen)
      ScreenManager\push startup_screen!

    love.keypressed = (key) ->
      love.event.push('quit') if key == 'escape'
      ScreenManager\keypressed key

    love.keyreleased = (key) ->
      ScreenManager\keyreleased key

    love.draw = ->
      ScreenManager\draw!
      debug.draw_fps! if debug_mode.active and debug_mode.show_fps

    love.update = (dt) ->
      ScreenManager\update dt



return Game