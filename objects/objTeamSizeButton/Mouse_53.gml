if point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2)
{
	if !selected
	{
		audio_play_sound(sndMenuButton, 0, false)
	}
	with (objTeamSizeButton)
	{
		selected = false
	}
	selected = true
	global.team_size = team_size
}