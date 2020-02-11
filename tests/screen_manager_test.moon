lust            = require 'vendor.lust'
_               = require 'src.lib.utils'
debug           = require 'src.lib.debug'
ScreenManager   = require 'src.lib.screen_manager'
Screen          = require 'src.lib.screen'

describe, it, expect = lust.describe, lust.it, lust.expect

class NonBlockingScreen extends Screen
  new: =>
    super({ blocks_draw: false,  blocks_update: false })
    @loaded       = false
    @unloaded     = false
    @drawn        = false
    @updated      = false

  load:   => @loaded    = true
  unload: => @unloaded  = true
  draw:   => @drawn     = true
  update: => @updated   = true

class DrawBlockingScreen extends NonBlockingScreen
  new: =>
    super!
    @blocks_draw = true

class UpdateBlockingScreen extends NonBlockingScreen
  new: =>
    super!
    @blocks_update = true


describe 'ScreenManager', ->
  lust.before () ->
    ScreenManager\clear!

  it 'calls the load method when pushing a screen on the stack', ->
    sc = NonBlockingScreen!
    expect(sc.loaded).to.equal(false)
    ScreenManager\push(sc)
    expect(sc.loaded).to.equal(true)

  it 'calls the unload method when pushing a screen on the stack', ->
    sc = NonBlockingScreen!
    ScreenManager\push(sc)
    expect(sc.unloaded).to.equal(false)
    ScreenManager\pop!
    expect(sc.unloaded).to.equal(true)

  describe 'drawing screens', ->
    describe 'without blockers', ->
      it 'draws all the sreens', ->
        ScreenManager\push(NonBlockingScreen!)
        ScreenManager\push(NonBlockingScreen!)
        ScreenManager\push(NonBlockingScreen!)

        ScreenManager\draw!
        _.each ScreenManager.screens, (screen) ->
          expect(screen.drawn).to.equal(true)

    describe 'with blockers', ->
      it 'stops drawing when it finds a screen with blocks_draw=true', ->
        a = NonBlockingScreen!
        b = DrawBlockingScreen!
        c = NonBlockingScreen!
        d = NonBlockingScreen!

        ScreenManager\push(a)
        ScreenManager\push(b)
        ScreenManager\push(c)
        ScreenManager\push(d)

        ScreenManager\draw!

        expect(a.drawn).to.equal(false)
        expect(b.drawn).to.equal(true)
        expect(c.drawn).to.equal(true)
        expect(d.drawn).to.equal(true)

  describe 'updating screens', ->
    describe 'without blockers', ->
      it 'updates all the sreens', ->
        ScreenManager\push(NonBlockingScreen!)
        ScreenManager\push(NonBlockingScreen!)
        ScreenManager\push(NonBlockingScreen!)

        ScreenManager\update!
        _.each ScreenManager.screens, (screen) ->
          expect(screen.updated).to.equal(true)

    describe 'with blockers', ->
      it 'stops updating when it finds a screen with blocks_update=true', ->
        a = NonBlockingScreen!
        b = UpdateBlockingScreen!
        c = NonBlockingScreen!
        d = NonBlockingScreen!

        ScreenManager\push(a)
        ScreenManager\push(b)
        ScreenManager\push(c)
        ScreenManager\push(d)

        ScreenManager\update!

        expect(a.updated).to.equal(false)
        expect(b.updated).to.equal(true)
        expect(c.updated).to.equal(true)
        expect(d.updated).to.equal(true)

