var window_width = window_get_width()
var window_height = window_get_height()
x_base = window_width - 250
draw_set_color(c_black)
draw_rectangle(x_base, 0, window_width, window_height, false)
draw_set_color(c_white)
draw_rectangle(x_base, 0, window_width, window_height, true)

draw_rectangle(minimap_x1, minimap_y1, minimap_x2, minimap_y2, true)
with (objSquare)
{
	var x_centre = other.minimap_x1+(x*other.minimap_sizex)
	var y_centre = other.minimap_y1+(y*other.minimap_sizey)
	var radius = 4
	draw_set_color(global.colours[team])
	draw_rectangle(x_centre-radius, y_centre-radius, x_centre+radius, y_centre+radius, false)
}
with (objNPC)
{
	var x_centre = other.minimap_x1+(x*other.minimap_sizex)
	var y_centre = other.minimap_y1+(y*other.minimap_sizey)
	var radius = 2
	draw_set_color(global.colours[team])
	draw_triangle(x_centre, y_centre-radius, x_centre-radius, y_centre+radius, x_centre+radius, y_centre+radius, false)
}
with (objPlayer)
{
	var x_centre = other.minimap_x1+(x*other.minimap_sizex)
	var y_centre = other.minimap_y1+(y*other.minimap_sizey)
	var radius = 4*scale
	draw_set_color(c_yellow)
	draw_triangle(x_centre, y_centre-radius, x_centre-radius, y_centre+radius, x_centre+radius, y_centre+radius, false)
}


draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_set_font(fnGame)
draw_set_color(c_white)

y_base = 320
team_square_counts = get_team_square_counts()
for (var i = 0; i < array_length(global.team_nums); i += 1)
{
	draw_sprite_stretched(sprSquare, i, x_base+50, y_base-25+i*50, 50, 50)
	square_count = team_square_counts[i]
	draw_set_color(global.colours[i])
	draw_text(x_base+120, y_base+i*50, square_count)
	draw_text(x_base+160, y_base+i*50, string_format((square_count/global.total_squares)*100, 1, 1) + "%")
}

draw_set_halign(fa_center)
draw_set_color(c_white)
y_base = 550
draw_text(x_base+125, y_base, "Time remaining:")
draw_text(x_base+125, y_base+50, string_replace_all(string_format(floor(global.time / 60), 2, 0) + ":" + string_format(global.time % 60, 2, 0), " " , 0))

y_base = 660
draw_text(x_base+125, y_base, "Energy level:")
var player_energy = objPlayer.energy
if player_energy < 0.5 {
	draw_set_color(c_red)
}
else if player_energy < 1 {
	draw_set_color(c_orange)
}
else if player_energy < 2 {
	draw_set_color(c_yellow)
}
else if player_energy < 4 {
	draw_set_color(c_green)
}
else {
	draw_set_color(c_teal)
}
draw_text(x_base+125, y_base+50, string(floor(player_energy*100)) + "%")
