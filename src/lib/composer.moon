_ = require 'src.lib.utils'

Compose = (base_klass, traits = {}) ->
  class extends base_klass
    new: (...) =>
      super(...)
      _.each traits, (trait) ->
        trait = trait! if trait.__class == trait
        @\use(trait)

{ Compose: Compose }