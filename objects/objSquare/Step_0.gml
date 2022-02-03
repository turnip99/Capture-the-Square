image_index = team
if claiming_team != -1 {
	var workers = 0
	with (objTriangle) {
		if team == other.claiming_team && claiming_square == other {
			workers += 1
		}
	}
	if workers > 0
	{
		claiming_progress += workers / 300
		if claiming_progress > 1
		{
			team = claiming_team
			play_sound_if_in_player_screen(x, y, sndCapture)
			with (objTriangle) {
				if team == other.claiming_team && claiming_square == other {
					immobile = false
					claiming_square = -1
					if object_index == objPlayer {
						global.player_claims += 1
					}
				}
			}
			claiming_progress = 0
			claiming_team = -1
		}
	}
	else {
		with (objTriangle) {
			if team == other.claiming_team && claiming_square == other {
				immobile = false
				claiming_square = -1
			}
		}
		claiming_progress = 0
		claiming_team = -1
	}
}