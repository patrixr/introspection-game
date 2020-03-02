EventEmitter  = require 'src.lib.event_emitter'
{ :dump }     = require 'src.lib.debug'
_             = require 'src.lib.utils'

--
-- A container class to store the game's entities
--
class Context extends EventEmitter
  new: =>
    @clear!

  clear: =>
    super!
    _.each @all, (o) -> o.unload!
    @categories = {}
    @all        = {}
    @state      = {}

  reset: => @clear!

  category: (name) =>
    @categories[name] = {} unless @categories[name]
    @categories[name]

  add: (component, category = '_') =>
    _.push @all, component
    _.push @category(category), component
    component\set_context self
    component\load!

  remove: (component, category = '_') =>
    _.remove_one @all, _.equality(component)
    _.remove_one @category(category), _.equality(component)
    component\unload!
    component\set_context nil

  get: (key) => @state[key]

  set: (key, value, opts = {}) =>
    @state[key] = value
    @add(value)           if opts.add == true
    @add(value, opts.add) if type(opts.add) == 'string'
    value

  each: (cb) =>
    _.each @all, cb

  update: (dt) =>
    @each (o) -> o\update(dt)

  draw: () =>
    @each (o) -> o\draw!


return Context