global.player_team = -1
global.map_size = ""
global.time = -1
global.team_size = -1
global.colours = array(make_color_rgb(242, 101, 34), make_color_rgb(0, 255, 255), make_color_rgb(0, 255, 0),  make_color_rgb(255, 0, 255), make_color_rgb(215, 215, 215))
global.team_nums = array(0, 1, 2, 3)
global.start_positions = array(array(0, 0), array(0, 0), array(0, 0), array(0, 0))
global.safe_positions = array(array(0, 0), array(0, 0), array(0, 0), array(0, 0))
global.total_squares = 0
global.final_team_square_counts = array(0, 0, 0, 0)

global.player_kills = 0
global.player_deaths = 0
global.player_shots = 0
global.player_hits = 0
global.player_claims = 0
global.player_highest_energy = 0
global.player_total_energy_collected = 0


window_set_cursor(cr_none);
cursor_sprite = sprTarget