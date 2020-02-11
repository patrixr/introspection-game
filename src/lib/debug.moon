{ env: env } = require 'src.lib.env'

--
-- @param {number} count the number of tabs we want
-- @return {string} a string of tabs
--
tabs = (count) ->
  i   = 0
  str = ''
  while i < count
    i += 1
    str = str .. '    '
  str

--
-- @param {string} text the text to color
-- @return {string} the colored text
--
colored = (text) -> "\27[101;93m#{text}\27[0m"

--
-- Prints a table =
--
-- @param {any} obj the table to print
--
dump = (obj, indent = 0) ->
  for key in pairs(obj)
    if type(obj[key]) == 'table'
      print tabs(indent) .. colored(key) .. ' ->'
      dump obj[key], indent + 1
    else
      print(tabs(indent) .. colored(key) .. ' ->' .. tostring(obj[key]))

warn = (...) ->
  print colored('WARN'), ... unless env != 'development'

draw_fps = ->
  love.graphics.setColor {255,255,255}
  love.graphics.print("FPS : " .. tostring(love.timer.getFPS()), 10, 10)

return {
  dump:       dump,
  warn:       warn,
  draw_fps:   draw_fps
}