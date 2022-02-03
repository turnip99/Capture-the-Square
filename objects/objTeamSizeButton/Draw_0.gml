draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(c_white)
draw_set_font(fnMenuButton)
draw_text(x, y, string(team_size))
if selected {
	draw_set_color(c_green)
	draw_rectangle(x1, y1, x2, y2, true)
}