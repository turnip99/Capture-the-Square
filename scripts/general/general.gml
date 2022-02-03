function outside_room() {
	if (x < 0 || y < 0 || x > room_width || y > room_height)
	{
		return true
	}
	else
	{
		return false
	}
}


function get_energy_array(energy_total) {
	var arr;
	count = 0
	while (energy_total > 0.6)
	{
	    arr[count] = random_range(0.1, 0.5);
		energy_total -= arr[count]
		count += 1
	}
	arr[count] = energy_total
	return arr;
}

function get_team_square_counts() {
	var square_counts = array(0, 0, 0, 0)
	with (objSquare) {
		if (team != 4) {
			square_counts[team] += 1
		}
	}
	return square_counts
}

function claim_begin(square, triangle) {
	if triangle.speed == 0 && square.team != triangle.team && (square.claiming_progress == 0 || square.claiming_team == triangle.team) {
		triangle.immobile = true
		square.claiming_team = triangle.team
		triangle.claiming_square = square
	}
}

function square_undefended(triange, square) {
	with (objTriangle) {
		if team != triange.team && distance_to_object(square) < 600 {
			return false
		}
	}
	return true
}
