animation =
	image_src:      "src/assets/sprites/player.png"
	default_state:  "walking"
	states:
		idle:
			frame_count: 3
			offset_x: 0
			offset_y: 32
			frame_w: 32
			frame_h: 32
			next_state: "idle"
			switch_delay: 0.1

		walking:
			frame_count: 6
			offset_x: 0
			offset_y: 0
			frame_w: 32
			frame_h: 32
			next_state: "walking"
			switch_delay: 0.1

return animation