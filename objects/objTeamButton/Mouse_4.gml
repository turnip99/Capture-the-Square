if !selected
{
	audio_play_sound(sndMenuButton, 0, false)
}
with (objTeamButton)
{
	selected = false
}
selected = true
global.player_team = team