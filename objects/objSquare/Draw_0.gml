draw_self()
if claiming_team != -1 {
	draw_set_color(global.colours[claiming_team])
	draw_rectangle(x-sprite_width/2, y-sprite_height/2-5, (x-sprite_width/2)+(sprite_width*claiming_progress), y-sprite_height/2-1, false)
}