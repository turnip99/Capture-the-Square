if outside_room() {
	if (x < 0 && hspeed < 0) || (y < 0 && vspeed < 0) || (x > room_width && hspeed > 0) || (y > room_height && vspeed > 0)
	{
		speed = 0
	}
}

if cooldown > 0
	cooldown -= 1

max_speed = 7/power(energy, 0.2)
if speed > max_speed {
	speed = max_speed
}
else if speed < min_speed {
	speed = min_speed
}


max_charge = 100+30*(energy-1)
charge_regen = max_charge/500
if charge < max_charge
{
	charge += charge_regen
}
if charge > max_charge
{
	charge = max_charge
}


scale = (energy + 0.9)/5
image_xscale = scale
image_yscale = scale
depth = -250 + energy