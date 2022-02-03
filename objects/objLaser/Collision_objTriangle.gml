if team != other.team {
	instance_destroy()
	if (!other.safe) {
		var damage_taken = max(0.03, 0.1-(0.004*power(damage, 1.5)))
		other.energy -= damage_taken
		if sender.object_index == objPlayer {
			global.player_hits += 1
		}
		with (other) {
			if energy <= 0.1
			{
				play_sound_if_in_player_screen(x, y, sndDeath)
				var energy_array = get_energy_array(reward_energy)
				for (var i = 0; i < array_length(energy_array); i += 1) {
					rnd_x = irandom_range(x-sprite_width/2, x+sprite_width/2)
					rnd_y = irandom_range(y-sprite_width/2, y+sprite_width/2)
					instance_create_depth_args(rnd_x, rnd_y, -50, objEnergy, energy_array[i])
				}
				energy = starting_energy
				reward_energy = starting_reward_energy
				x = -100000
				y = -100000
				alarm[0] = 60
				immobile = true
				claiming_square = -1
				respawning = true
				speed = 0
				if other.sender.object_index == objPlayer {
					global.player_kills += 1
				}
				if object_index == objPlayer {
					global.player_deaths += 1
				}
			}
			else 
			{
				play_sound_if_in_player_screen(x, y, sndHit)
			}
		}
	}	
}