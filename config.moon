{ env: env } = require 'src.lib.env'

return {
  app: {
    title:        "Love2D Game",
    author:       "Patrick",
    version:      "0.1",
    description:  "Description"
  },
  screen: {
    background:   {0,0,0},
    width:        1280,
    height:       720,
    vsync:        true
  },
  input: {
    keyboard: true,
    mouse:    true,
    touch:    true
  },
  startup: {
    screen:     "src.screens.game_screen",
    parameters: {}
  },
  debug_mode: {
    active:   env == 'development',
    show_fps: true
  }
}