Component = require 'src.components.base.component'

class Block extends Component
  load: =>
    { :x, :y, :width, :height } = @opts

  draw: =>
    love.graphics.rectangle('fill', @x, @y, @width, @height)


return Block