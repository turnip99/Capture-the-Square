starting_energy = 1
energy = starting_energy
starting_reward_energy = 0.3
reward_energy = starting_reward_energy
charge = 100
max_charge = 100
charge_cost = 5
charge_regen = 0.2
safe = false
immobile = false
respawning = false
damage = 0.1
image_index = team
image_speed = 0
speed = 0
starting_direction = team*90
direction = starting_direction
max_speed = 10
min_speed = 0
turn_rate = 5
range = 1000
x_start = x
y_start = y
claiming_square = -1
total_cooldown = 10
cooldown = total_cooldown
with (objSafeZone) {
	if team == other.team {
		other.safe_zone = self
	}
}