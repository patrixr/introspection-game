Component = require 'src.lib.components.base.component'

class Physical extends Component

  new: (body, shape, fixture) =>
    @body     = body
    @shape    = shape
    @fixture  = fixture

return Physical