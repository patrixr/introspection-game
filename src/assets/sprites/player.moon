
BASE_SIZE = 64

animation =
	image_src:      "src/assets/sprites/player_64.png"
	default_state:  "idle"
	states:
		idle:
			frame_count: 1
			offset_x: 0
			offset_y: BASE_SIZE
			frame_w: BASE_SIZE
			frame_h: BASE_SIZE
			next_state: "idle"
			switch_delay: 0.1

		walking:
			frame_count: 6
			offset_x: 0
			offset_y: 0
			frame_w: BASE_SIZE
			frame_h: BASE_SIZE
			next_state: "walking"
			switch_delay: 0.1

return animation