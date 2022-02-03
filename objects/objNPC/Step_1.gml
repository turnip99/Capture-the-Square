event_inherited()

if immobile
	exit


nearest_enemy = -1
nearest_enemy_distance = 10000
with (objTriangle) {
	if !respawning and team != other.team {
		var distance_to_enemy = distance_to_object(other)
		if distance_to_enemy < other.nearest_enemy_distance && !other.safe {
			other.nearest_enemy_distance = distance_to_enemy
			other.nearest_enemy = self
		}
	}
}

nearest_enemy_square = -1
nearest_enemy_square_distance = 10000
nearest_ally_square = -1
nearest_ally_square_distance = 10000
with (objSquare) {
	var distance_to_square = distance_to_object(other)
	if team == other.team {
		if distance_to_square < other.nearest_ally_square_distance {
			other.nearest_ally_square_distance = distance_to_square
			other.nearest_ally_square = self
		}
	}
	else {
		if distance_to_square < other.nearest_enemy_square_distance {
			other.nearest_enemy_square_distance = distance_to_square
			other.nearest_enemy_square = self
		}
	}
}

nearest_energy = -1
nearest_energy_distance = 10000
with (objEnergy) {
	var distance_to_energy = distance_to_object(other)
	if distance_to_energy < other.nearest_energy_distance {
		other.nearest_energy_distance = distance_to_energy
		other.nearest_energy = self
	}
}

if objective == "claim" {
	if (!square_undefended(self, target) && random(100) < 1) || target.team == team || (target.claiming_team != -1 && target.claiming_team != team) {
		objective = ""
		target = -1
	}
}
else if objective == "defend" {
	if (square_undefended(self, target) && random(30) < 1) || target.team != team {
		objective = ""
		target = -1
	}
}
else if objective == "energy" {
	if (!instance_exists(target) || (nearest_energy_distance > 800 && random(100) < 1) || (ally_with_target(target) && random (10) < 1)) {
		objective = ""
		target = -1
	}
}
else if objective == "attack" {
	if (target.safe && random(10) < 1) || target.respawning || (nearest_enemy_distance > 1000 && random(40) < 1) {
		objective = ""
		target = -1
	}
}
else if objective == "explore" {
	if distance_to_point(target[0], target[1]) < 50 {
		objective = ""
		target = -1
	}
}

if objective != "" {
	if objective != "claim" && nearest_enemy_square_distance < 300 && (!nearest_enemy_square.claiming_team != -1 || nearest_enemy_square.claiming_team == team) && energy > 1 && random(100) < 1 {
		objective = "claim"
		target = nearest_enemy_square
	}
	else if objective != "defend" && nearest_ally_square_distance < 500 && !square_undefended(self, nearest_ally_square) && random(130) < 1 {
		objective = "defend"
		target = nearest_ally_square
	}

	if objective == "attack" && distance_to_object(target) - nearest_enemy_distance > 200  && random(20) < 1 {
		target = nearest_enemy
	}
}

if objective == "" || (objective == "explore" && random(80) < 1)
{
	if in_screen(x, y, nearest_energy.x, nearest_energy.y) && !ally_with_target(nearest_energy) && random(1.7) < 1 {
		objective = "energy"
		target = nearest_energy
	}
	else if nearest_enemy_square_distance && nearest_enemy_square.team != team && square_undefended(self, nearest_enemy_square) && random(1.3) < 1 {
		objective = "claim"
		target = nearest_enemy_square
	}
	else if nearest_ally_square_distance < 700 && !square_undefended(self, nearest_ally_square) && random(2) < 1 {
		objective = "defend"
		target = nearest_ally_square
	}
	else if nearest_enemy_distance < 1000 {
		objective = "attack"
		target = nearest_enemy
	}
	else if (nearest_enemy_square.team != team && random(2) < 1) {
		objective = "claim"
		target = nearest_enemy_square
	}
	else {
		objective = "explore"
		target = array(irandom_range(500, room_width-500), irandom_range(500, room_height-500))
	}
}
