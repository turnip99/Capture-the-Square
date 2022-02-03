global.time -= 1
alarm[0] = 60
if global.time == 0 {
	audio_play_sound(sndGameEnd, 0, false)
	global.final_team_square_counts = get_team_square_counts()
	room_goto(rmEnd)
}
else if global.time <= 10 {
	audio_play_sound(sndTick, 0, false)
}