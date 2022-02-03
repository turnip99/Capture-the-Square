if objMenuControl.menu_phase == 1 || (global.player_team > -1 && global.map_size != "" && global.time > -1 && global.team_size > -1) {
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_set_color(c_green)
	draw_set_font(fnMenuTitle)
	draw_text(x, y, "Continue")
	draw_rectangle(x1, y1, x2, y2, true)
}