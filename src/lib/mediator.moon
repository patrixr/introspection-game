debug = require 'src.lib.debug'
_     = require 'src.lib.utils'

class Mediator
  new: =>
    @clear!

  clear: =>
    @listeners = {}

  on: (event, callback) =>
    id = _.uuid!
    @listeners[event] = @listeners[event] or {}
    @listeners[event][id] = callback
    return () -> @listeners[event][id] = nil

  fire: (event, args) =>
    _.each @listeners[event], (fn) -> fn(args)

return Mediator!

