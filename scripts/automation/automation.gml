function generate_room()
{
	new_room_width = 0
	new_room_height = 0
	square_count = 0
	energy_total = (((global.team_size + 1)  * 15) + square_count)/10
	switch (global.map_size)
	{
		case "Small":
		    new_room_width = 4000;
			new_room_height = 4000;
			square_count = 10;
		    break;
		case "Medium":
		    new_room_width = 5500;
			new_room_height = 5500;
			square_count = 15;
		    break;
		case "Large":
		    new_room_width = 7000;
			new_room_height = 7000;
			square_count = 25;
		    break;
		case "Huge":
		    new_room_width = 9000;
			new_room_height = 9000;
			square_count = 40;
		    break;
	}
	room_width = new_room_width
	room_height = new_room_height
	global.total_squares = square_count
	global.start_positions[0] = array(100, room_height/2)
	global.start_positions[1] = array(room_width/2, room_height-100)
	global.start_positions[2] = array(room_width-100, room_height/2)
	global.start_positions[3] = array(room_width/2, 100)
	global.safe_positions[0] = array(201, room_height/2)
	global.safe_positions[1] = array(room_width/2, room_height-201)
	global.safe_positions[2] = array(room_width-201, room_height/2)
	global.safe_positions[3] = array(room_width/2, 201)
	
	
	for (var i = 0; i < array_length(global.team_nums); i += 1) {
		instance_create_depth_args(global.safe_positions[i][0], global.safe_positions[i][1], 0, objSafeZone, i)
		for (j = 0; j < global.team_size; j += 1) {
			xs = global.start_positions[i][0]
			ys = global.start_positions[i][1]
			if (i % 2 == 0) {
				ys += (j * 60) - 60 * ((global.team_size-1)/2)
			}
			else {
				xs += (j * 60) - 60 * ((global.team_size-1)/2)
			}
			if (j == 0 && global.player_team == i) {
				instance_create_depth(xs, ys, -200, objPlayer)
			}
			else {
				instance_create_depth_args(xs, ys, -200, objNPC, i)
			}
		}
	}
	for (var i = 0; i < square_count; i += 1) {
		valid_pos = false
		attempts = 0
		var quadrant = i % 5
		if quadrant == 0 {
			var x1 = 200
			var y1 = 200
			var x2 = room_width/2
			var y2 = room_height/2
		}
		else if quadrant == 1 {
			var x1 = room_width/2
			var y1 = 200
			var x2 = room_width-200
			var y2 = room_height/2
		}
		else if quadrant == 2 {
			var x1 = 200
			var y1 = room_height/2
			var x2 = room_width/2
			var y2 = room_height-200
		}
		else if quadrant == 3 {
			var x1 = room_width/2
			var y1 = room_height/2
			var x2 = room_width-200
			var y2 = room_height-200
		}
		else if quadrant == 4 {
			var x1 = room_width/4
			var y1 = room_height/4
			var x2 = (room_width/4)*3
			var y2 = (room_height/4)*3
		}
		while !valid_pos && attempts < 100 {
			attempts += 1
			rnd_x = irandom_range(x1, x2)
			rnd_y = irandom_range(y1, y2)
			nearest_triange = instance_nearest(rnd_x, rnd_y, objTriangle)
			if point_distance(rnd_x, rnd_y, nearest_triange.x, nearest_triange.y) > 700
			{
				if i == 0 {
					valid_pos = true
				}
				else {
					nearest_enemy_square = instance_nearest(rnd_x, rnd_y, objSquare)
					if point_distance(rnd_x, rnd_y, nearest_enemy_square.x, nearest_enemy_square.y) > 500 {
						valid_pos = true
					}
				}
			}
		}
		instance_create_depth(rnd_x, rnd_y, 0, objSquare)
	}
	energy_array = get_energy_array(energy_total)
	for (var i = 0; i < array_length(energy_array); i += 1) {
		valid_pos = false
		attempts = 0
		while !valid_pos && attempts < 100 {
			attempts += 1
			rnd_x = irandom_range(100, room_width-100)
			rnd_y = irandom_range(100, room_height-100)
			nearest_triange = instance_nearest(rnd_x, rnd_y, objTriangle)
			nearest_enemy_square = instance_nearest(rnd_x, rnd_y, objSquare)
			if point_distance(rnd_x, rnd_y, nearest_triange.x, nearest_triange.y) > 600 && point_distance(rnd_x, rnd_y, nearest_enemy_square.x, nearest_enemy_square.y) > 200
			{
				if i == 0 {
					valid_pos = true
				}
				else {
					nearest_energy = instance_nearest(rnd_x, rnd_y, objEnergy)
					if point_distance(rnd_x, rnd_y, nearest_energy.x, nearest_energy.y) > 50 {
						valid_pos = true
					}
				}
			}
		}
		instance_create_depth_args(rnd_x, rnd_y, -50, objEnergy, energy_array[i])
	}
}