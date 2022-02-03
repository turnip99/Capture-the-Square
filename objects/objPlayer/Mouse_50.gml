if immobile
	exit
if charge > charge_cost && cooldown == 0 {
	charge -= charge_cost
	cooldown = total_cooldown
	audio_play_sound(sndLaser, 0, false)
	instance_create_depth_args(x, y, -100, objLaser, self, mouse_x, mouse_y)
	global.player_shots += 1
}