draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(c_white)
draw_set_font(fnMenuTitle)
draw_text(room_width/2, 50, "Capture the Square")

if menu_phase == 1
{
	draw_set_font(fnMenuInfo)
	draw_text(room_width/2, 150, "You are a simple triangle, fighting for the freedom of your mighty two-dimensional dynasty.")
	draw_text(room_width/2, 200, "Your objective is to claim squares from your rival dynasties.")
	draw_text(room_width/2, 250, "Use WASD to move and hold down the left mouse button to attack.")
	draw_text(room_width/2, 300, "When you reach a square, you can right click on it while stopping on it to attempt to claim it.")
	draw_text(room_width/2, 350, "Be careful, though - while claiming a square, you are completely vulnerable for several seconds!")
	draw_text(room_width/2, 400, "Defeated foes leave behind energy, which can make you larger.")
	draw_text(room_width/2, 450, "As you grow, you will become more durable and will be able to attack more often.")
	draw_text(room_width/2, 500, "The dynasty with the most squares when the time runs out will be declared the champion!")
}
else if menu_phase == 2
{
	draw_set_font(fnMenuSubheading)
	draw_set_color(c_ltgrey)
	draw_text(room_width/2, 120, "Dynasty:")
	draw_text(room_width/2, 255, "Map size:")
	draw_text(room_width/2, 380, "Game length:")
	draw_text(room_width/2, 505, "Team sizes:")
}
draw_set_font(fnMenuSmall)
draw_text(155, room_height-30, "Sound from Zapsplat.com")