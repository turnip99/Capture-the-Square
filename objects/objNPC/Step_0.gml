event_inherited()
if immobile
	exit
if (charge - charge_cost > 0 && cooldown == 0) {
	var enemy_to_attack = nearest_enemy
	with (objTriangle)
	{
		if team != other.team && claiming_square != -1 and in_screen(other.x, other.y, x, y) {
			enemy_to_attack = self
		}
	}
	if (in_screen(x, y, enemy_to_attack.x, enemy_to_attack.y) && enemy_to_attack != -1) {
		var steps_to_reach_target = ceil(distance_to_object(enemy_to_attack)/20)
		var potential_x = enemy_to_attack.x + enemy_to_attack.hspeed * steps_to_reach_target
		var potential_y = enemy_to_attack.y + enemy_to_attack.vspeed * steps_to_reach_target
		if enemy_to_attack.speed > 0 {
			potential_x += aim_bias_x*(steps_to_reach_target+enemy_to_attack.speed*3+speed)
			potential_y += aim_bias_y*(steps_to_reach_target+enemy_to_attack.speed*3+speed)
		}
		if distance_to_point(potential_x, potential_y) < range {
			if charge > charge_cost {
				charge -= charge_cost
				cooldown = total_cooldown
				play_sound_if_in_player_screen(x, y, sndLaser)
				instance_create_depth_args(x, y, -100, objLaser, self, potential_x, potential_y)
			}
		}
	}
}

if objective == "attack" {
	movement_strategy = "approach"
}
else if objective == "claim" {
	movement_strategy = "stop_on"
}
else if objective == "defend" {
	movement_strategy = "rotate"
}
else if objective == "energy" {
	movement_strategy = "reach"
}
else if objective == "explore" {
	movement_strategy = "wander"
}

if outside_room()
{
    if x < 0
        if direction < 5 || direction > 355
			speed_step = "A"
        else if direction < 180
			direction_step = "R"
        else
            direction_step = "L"
    else if x > room_width
        if direction < 175 && direction > 185
            speed_step = "A"
        else if direction >= 185
			direction_step = "R"
        else
			direction_step = "L"
    else if y < 0
        if direction > 265 && direction < 275
           speed_step = "A"
        else if direction < 90 || direction >= 275
            direction_step = "R"
        else
            direction_step = "L"
    else if y > room_height
        if direction > 85 && direction < 95
            speed_step = "A"
        else if direction >= 95 && direction < 270
            direction_step = "R"
        else
            direction_step = "L"
}
else
{	
	if movement_strategy == "approach" {
		if distance_to_object(target) > preferred_approach_distance && speed < max_speed {
			speed_step = "A"
		}
		else if distance_to_object(target) < preferred_approach_distance && speed > min_speed && random(30) < 1 {
			if distance_to_object(target) < preferred_approach_distance-100 && speed > max_speed/4 {
				speed_step = "D"
			}
			else {
				speed_step = "N"
			}
		}
		turn_towards_target(target.x, target.y)
	}
	else if movement_strategy == "rotate" {
		if (distance_to_object(target) > 400) {
			turn_towards_target(target.x, target.y)	
		}
		else {
			if speed < max_speed / 4 {
				speed_step = "A"
			}
			else if random(50) < 1 {
				if speed < max_speed / 3 {
					step_speed = "N"
				}
				else {
					step_speed = "D"
				}
			}
			if (nearest_energy_distance < 350) {
				turn_towards_target(nearest_energy.x, nearest_energy.y)	
			}
			else if random(60) < 1 {
				rnd = random(2.5)
				if rnd < 1 {
					direction_step = "L"
				}
				else if rnd < 2 {
					direction_step = "R"
				}
				else {
					direction_step = "N"
				}
			}
		}
	}
	else if movement_strategy == "stop_on" {
		if (distance_to_object(target) > 400 && speed < max_speed) || (!position_meeting(x, y, target) && speed < 2) {
			speed_step = "A"
		}
		else if (distance_to_object(target) < 100 && speed > 2) || (position_meeting(x, y, target) && speed > 0) {
			speed_step = "D"
		}
		if speed > 0
		{
			turn_towards_target(target.x, target.y)
		}
	}
	else if movement_strategy == "reach" {
		if random(30) < 1 {
			max_reach_speed_given_distance = min(max_speed, 4+distance_to_object(target)/100)
			if speed < max_reach_speed_given_distance {
				speed_step = "A"
			}
			else {
				speed_step = "D"
			}
		}		
		turn_towards_target(target.x, target.y)
	}
	else if movement_strategy == "wander" {
		if speed < max_speed {
			speed_step = "A"
		}
		turn_towards_target(target[0], target[1])
	}
}


if speed_step == "A" {
	event_user(1)
}
else if speed_step == "D" {
	event_user(3)
}

if direction_step == "L" {
	event_user(2)
}
else if direction_step == "R" {
	event_user(4)
}

if speed == 0 && position_meeting(x, y, nearest_enemy_square) && objective == "claim" {
	claim_begin(nearest_enemy_square, self)
}