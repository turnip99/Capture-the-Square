function array()
{
	var arr;
	for (var i=0;i<argument_count;i+=1)
	{
	    arr[i] = argument[i];
	}
	return arr;
}


function instance_create_depth_args()
{
	for (i = 0; i < argument_count-4; i++)
	{
		global.args[i] = argument[i+4];
	}
	instance_create_depth(argument[0], argument[1], argument[2], argument[3])
}


function print()
{
	window_set_fullscreen(false);
	show_message(argument[0]);
	window_set_fullscreen(true);
}


function in_screen(x_pos, y_pos, x_target, y_target) {
	if (abs(x_pos-x_target) < 675 && abs(y_pos-y_target) < 450) {
		return true
	}
	else {
		return false
	}
}


function play_sound_if_in_player_screen(xs, ys, sound) {
	if in_screen(objPlayer.x, objPlayer.y, xs, ys){
		audio_play_sound(sound, 0, false)
	}
}