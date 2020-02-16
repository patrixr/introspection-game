_         = require 'src.lib.utils'
Component = require 'src.components.base.component'

return _.cache (base_klass = Component) ->
  class SpriteSheet extends base_klass
    @from_file: (file) =>
      desc = love.filesystem.load(file)!
      SpriteSheet desc

    new: (descriptor, opts = {}) =>
      super(opts)

      image_path = opts.image_path

      @animation_file = file_path
      @descriptor     = descriptor
      @texture        = love.graphics.newImage(image_path or @descriptor.image_src)
      @reset!

    reset: =>
      @state_name         = @descriptor.default_state
      @state              = @get_state_descriptor(@descriptor.default_state)
      @tick               = 0
      @speed_multiplier   = 1
      @current_frame      = 0
      @rotation           = 0
      @active             = true
      @visible            = true
      @flip_x             = 1
      @rotation           = @rotation or 0
      @relative_origin_x  = @relative_origin_x or 0
      @relative_origin_y  = @relative_origin_y or 0


    get_state_descriptor: (name) => @descriptor.states[name]

    get_sprite_size: => {
      width: @state.frame_w,
      height: @state.frame_h,
    }

    --
    -- @brief Updates the animation state and frame. Called in the update loop
    -- @param dt the elapsed time in seconds (floating point)
    --
    update: (dt) =>
      super(dt)

      return if not @active

      @tick +=  dt * @speed_multiplier


      return if @tick < @state.switch_delay

      @current_frame += 1

      if @current_frame >= @state.frame_count
        -- Case: no next state, it is locked on the last frame
        if not @state.next_state
          @current_frame = @state.frame_count - 1
          @tick = 0
        else
          @set_state @state.next_state
          @current_frame = 0

      @tick = 0

    --
    -- @brief Draws the sprite on the screen. Called in the drawing loop
    --
    --
    draw: (scale_x = 1, scale_y = 1)=>
      return if not @visible

      @state.quads = {} if not @state.quads

      quad = nil

      @state.quads[@current_frame] = @state.quads[@current_frame] or love.graphics.newQuad(
          (@state.offset_x or 0) + (@current_frame * @state.frame_w),
          @state.offset_y or 0,
          @state.frame_w,
          @state.frame_h,
          @texture\getWidth!,
          @texture\getHeight!
      )

      quad = @state.quads[@current_frame]

      love.graphics.draw(@texture,
        quad,
        @get_x!,
        @get_y!,
        @rotation,
        @flip_x * scale_x,
        scale_y,
        @relative_origin_x * @state.frame_w,
        @relative_origin_x * @state.frame_h,
        0,0
      )

    --
    -- @brief Sets the state of the animation
    -- @param name (string) a state specified in the animation file that we want to switch to
    -- e.g anim:setState("jump")
    --
    set_state: (name) =>
      return if name == @state_name

      @tick           = 0
      @current_frame  = 0
      @state          = @get_state_descriptor(name)
      @state_name     = name

    --
    -- @brief Gets the state the animation is currently in
    -- @return (string) the current state
    --
    get_state: () => @state_name

    --
    -- @brief Allows to speed up the animation with a multiplier
    -- @param sm (positive floating point) the multiplier
    --
    set_speed_multiplier: (sm) =>
      @speed_multiplier = math.abs(sm)

    --
    -- @brief Switches the pause
    --
    --
    toggle_pause: () =>
      @active = not @active

    --
    -- @brief Pauses the animation
    --
    --
    pause: () =>
      @active = false

    --
    -- @brief Unpauses the animation
    --
    --
    unpause: () =>
      @active = true

    --
    -- @brief Sets the sprite as visible or invisible
    -- @param v (bool) true if visible, false if invisible
    --
    set_visibility: (v) =>
      @visible = v

    --
    -- @brief Gets the width of the current frame
    -- @return the current width
    --
    get_width: () =>  @state.frame_w

    --
    -- @brief Gets the height of the current frame
    -- @return the current height
    --
    get_height: () =>  @state.frame_h

  return SpriteSheet