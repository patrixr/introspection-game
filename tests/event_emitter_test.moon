lust          = require 'vendor.lust'
EventEmitter  = require 'src.lib.event_emitter'
debug         = require 'src.lib.debug'

describe, it, expect = lust.describe, lust.it, lust.expect

describe 'EventEmitter', ->
  mediator = EventEmitter!

  lust.before () ->
    mediator\clear!

  describe 'events', ->

    it 'registers a listener', ->
      received  = nil
      received2 = nil

      mediator\on 'toast', (arg) -> received = arg
      mediator\fire('toast', 43)

      expect(received).to.equal(43)

    it 'registers multiple listeners', ->
      received  = nil
      received2 = nil

      mediator\on 'toast', (arg) -> received = arg
      mediator\on 'toast', (arg) -> received2 = arg

      mediator\fire('toast', 43)

      expect(received).to.equal(43)
      expect(received2).to.equal(43)

    it 'unregisters a listener', ->
      received  = nil
      received2 = nil

      off = mediator\on 'toast', (arg) -> received = arg
      mediator\on 'toast', (arg) -> received2 = arg

      mediator\fire('toast', 43)
      expect(received).to.equal(43)
      expect(received2).to.equal(43)

      off!

      mediator\fire('toast', 100)
      expect(received).to.equal(43)
      expect(received2).to.equal(100)