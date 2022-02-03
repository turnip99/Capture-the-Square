draw_sprite_ext(sprite_index, image_index, x, y, scale, scale, direction, c_white, 1);

var charge_x1 = x-(sprite_height/2)-41*scale-1
var charge_y1 = y-(sprite_height/2)
var charge_x2 = x-(sprite_width/2)-41*scale
var charge_y2 = y+(sprite_height/2)
var charge_height = charge_y2 - charge_y1
var charge_portion = charge/max_charge
draw_set_color(c_black)
draw_rectangle(charge_x1, charge_y1, charge_x2, charge_y2, false)
draw_set_color(c_white)
draw_rectangle(charge_x1, charge_y1, charge_x2, charge_y2, true)
draw_rectangle(charge_x1, charge_y1+charge_height*(1-charge_portion), charge_x2, charge_y2, false)