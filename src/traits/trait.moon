_ = require 'src.lib.utils'

class Trait
  @dependencies = {}

  new: (name) =>
    @name = name

  get_name: => @name

  load: (parent) =>
    _.each @@dependencies, (D) ->
      parent\use(D!) unless parent\has(D)

  unload: (parent) =>

  update: (dt, parent) =>

return Trait