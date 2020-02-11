Drawable = require 'src.lib.components.base.drawable'

class Physical extends Drawable

  new: (body, shape, fixture) =>
    @body     = body
    @shape    = shape
    @fixture  = fixture

return Physical