draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(global.colours[global.player_team])
draw_set_font(fnMenuTitle)
draw_text(room_width/2, 50, "Time's up!")

draw_set_font(fnMenuInfo)
x1 = room_width/5
x2 = x1 * 2
x3 = x1 * 3
x4 = x1 * 4
ys = 250

var square_count = global.final_team_square_counts[0]
draw_sprite(sprSquare, 0, x1, ys)
draw_set_color(global.colours[0])
draw_text(x1, ys+100, string(square_count) + " (" + string_format((square_count/global.total_squares)*100, 1, 1) + "%)")

square_count = global.final_team_square_counts[1]
draw_sprite(sprSquare, 1, x2, ys)
draw_set_color(global.colours[1])
draw_text(x2, ys+100, string(square_count) + " (" + string_format((square_count/global.total_squares)*100, 1, 1) + "%)")

square_count = global.final_team_square_counts[2]
draw_sprite(sprSquare, 2, x3, ys)
draw_set_color(global.colours[2])
draw_text(x3, ys+100, string(square_count) + " (" + string_format((square_count/global.total_squares)*100, 1, 1) + "%)")

square_count = global.final_team_square_counts[3]
draw_sprite(sprSquare, 3, x4, ys)
draw_set_color(global.colours[3])
draw_text(x4, ys+100, string(square_count) + " (" + string_format((square_count/global.total_squares)*100, 1, 1) + "%)")


draw_set_font(fnMenuSubheading)
draw_set_color(global.colours[global.player_team])
draw_text(room_width/2, 450, "Player records")

draw_set_font(fnMenuInfo)
x1 = room_width/4
x2 = x1 * 2
x3 = x1 * 3
y1 = 500
y2 = 550
draw_text(x1, y1, "Kills: " + string(global.player_kills))
draw_text(x2, y1, "Deaths: " + string(global.player_deaths))
draw_text(x3, y1, "Hit rate: " + player_hit_rate)
draw_text(x1, y2, "Squares claimed: " + string(global.player_claims))
draw_text(x2, y2, "Highest energy: " + string(floor(global.player_highest_energy*100)) + "%")
draw_text(x3, y2, "Total energy collected: " + string(floor(global.player_total_energy_collected*100)) + "%")