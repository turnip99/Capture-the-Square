function turn_towards_target(target_x, target_y) {
	var acceptaple_dir_difference = max(min(point_distance(x, y, target_x, target_y)/70, 20), 2)
	
	/*
	var debug_messages = true
	var target_dir = point_direction(x, y, target.x, target.y)
	if ((target_dir > acceptaple_dir_difference && target_dir < 180) || (target_dir <= -180 && target_dir > -360 + acceptaple_dir_difference))
	{
		direction_step = "L"
	}
	else if ((target_dir >= 180 && target_dir < 360 - acceptaple_dir_difference) || (target_dir < -acceptaple_dir_difference && target_dir > -180))
	{
		direction_step = "R"
	}
	else {
		direction_step = "N"
	}
	if debug_messages
		show_debug_message(direction_step)
	*/
	
	var facingDir = direction
	var targetDir = point_direction(x, y, target_x, target_y)
	var facingMinusTarget = facingDir - targetDir;
	var angleDiff = facingMinusTarget;
	if(abs(facingMinusTarget) > 180)
	{
	    if(facingDir > targetDir)
	    {
	        angleDiff = -1 * ((360 - facingDir) + targetDir);
	    }
	    else
	    {
	        angleDiff = (360 - targetDir) + facingDir;
	    }
	}
	if (angleDiff > acceptaple_dir_difference)
	{
	    direction_step = "R"
	}
	else if(angleDiff < acceptaple_dir_difference)
	{
		direction_step = "L"
	}
}

function ally_with_target(potential_target) {
	with (objNPC) {
		if self != other && team == other.team && target == potential_target {
			return true
		}
	}
	return false
}