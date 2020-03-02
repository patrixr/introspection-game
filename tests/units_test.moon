lust          = require 'vendor.lust'
_             = require 'src.lib.utils'
{ :Speed }    = require 'src.lib.units'

{ :describe, :it, :expect } = lust

describe 'Units', ->

  describe 'Speed', ->
    it 'computes the distance over time correctly', ->
      speed = 100 -- pixels per second

