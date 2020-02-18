debug = require 'src.lib.debug'
_     = require 'src.lib.utils'

class EventEmitter
  new: =>
    @clear!

  clear: =>
    @listeners = {}

  on: (event, callback) =>
    id = _.uuid!
    @listeners[event] = @listeners[event] or {}
    @listeners[event][id] = callback
    return () -> @listeners[event][id] = nil

  fire: (event, ...) =>
    listeners = @listeners[event] or {}
    for key, fn in pairs listeners
      fn(...)

return EventEmitter

