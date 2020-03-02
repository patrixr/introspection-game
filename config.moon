{ :is_prod, :is_dev } = require 'src.lib.env'

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
    vsync:        true,
    fullscreen:   is_prod
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
    active:   is_dev
    show_fps: true
  }
}