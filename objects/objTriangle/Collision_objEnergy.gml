if (!other.no_collect) {
	play_sound_if_in_player_screen(x, y, sndPowerUp)
	energy += other.energy
	reward_energy += other.energy / 3
	if object_index == objPlayer {
		global.player_total_energy_collected += other.energy
		if energy > global.player_highest_energy {
			global.player_highest_energy = energy
		}
	}
	with (other)
	{
		instance_destroy()
	}
}