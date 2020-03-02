Trait         = require 'src.traits.trait'

class Mass extends Trait
  new: (val = 64) =>
    super('mass')
    @value    = val

return Mass