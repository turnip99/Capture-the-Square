surface_resize(application_surface, room_width, room_height);

instance_create_depth(room_width/2, 645, 0, objPlayAgainButton)

if global.player_shots > 0 {
	player_hit_rate = string_format((global.player_hits / global.player_shots) * 100, 1, 1) + "%"
}
else {
	player_hit_rate = "0.0%"
}

