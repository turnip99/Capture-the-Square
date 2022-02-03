if point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2)
{
	audio_play_sound(sndMenuButton, 0, false)
	if show_question("Restart the game?")
	{
		window_set_fullscreen(false);
		game_restart()
		window_set_fullscreen(true);
	}
}