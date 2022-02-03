if point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2) && (objMenuControl.menu_phase == 1 || (global.player_team > -1 && global.map_size != "" && global.time > -1 && global.team_size > -1))
{
	audio_play_sound(sndMenuButton, 0, false)
	if (objMenuControl.menu_phase == 1)
	{
		objMenuControl.menu_phase = 2
		for (var i = 0; i < array_length(global.team_nums); i += 1)
		{
			instance_create_depth_args(200+((room_width-200)/array_length(global.team_nums))*i, 180, 0, objTeamButton, i)
		}
		instance_create_depth_args(200, 305, 0, objMapSizeButton, "Small")
		instance_create_depth_args(400, 305, 0, objMapSizeButton, "Medium")
		instance_create_depth_args(600, 305, 0, objMapSizeButton, "Large")
		instance_create_depth_args(800, 305, 0, objMapSizeButton, "Huge")
		instance_create_depth_args(200, 430, 0, objGameLengthButton, 3)
		instance_create_depth_args(400, 430, 0, objGameLengthButton, 5)
		instance_create_depth_args(600, 430, 0, objGameLengthButton, 10)
		instance_create_depth_args(800, 430, 0, objGameLengthButton, 20)
		instance_create_depth_args(200, 555, 0, objTeamSizeButton, 1)
		instance_create_depth_args(400, 555, 0, objTeamSizeButton, 2)
		instance_create_depth_args(600, 555, 0, objTeamSizeButton, 3)
		instance_create_depth_args(800, 555, 0, objTeamSizeButton, 5)
	}
	else
	{
		room_goto(rmGame)
	}
}