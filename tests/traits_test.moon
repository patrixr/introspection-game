lust          = require 'vendor.lust'
Component     = require 'src.components.base.component'
Trait         = require 'src.traits.trait'
debug         = require 'src.lib.debug'

describe, it, expect = lust.describe, lust.it, lust.expect

describe 'Traits', ->
  _cmp = nil
  _trait = nil

  lust.before () ->
    _cmp = Component!

  describe 'on components', ->

    class TestTrait extends Trait
      new: =>
        super('test')

      update: (dt, parent) =>
        @arg1     = dt
        @arg2     = parent

    lust.before () ->
      _trait = TestTrait!
      _cmp\use(_trait)

    it 'successfully registers the trait', ->
      expect(_cmp\has(TestTrait)).to.equal(true)

    it 'sets a member variable on the component', ->
      expect(_cmp.test).to.equal(_trait)

    it 'is updated with the component', ->
      expect(_trait.arg1).to.equal(nil)
      expect(_trait.arg2).to.equal(nil)

      _cmp\update(10)

      expect(_trait.arg1).to.equal(10)
      expect(_trait.arg2 == _cmp).to.equal(true)