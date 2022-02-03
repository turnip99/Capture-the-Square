team = global.args[0]
image_index = team
image_speed = 0
image_xscale = 0.4
image_yscale = 0.4
if instance_number(self.object_index) == 1
{
	selected = true
	global.player_team = team
}
else
{
	selected = false
}

width = 70
height = 70
x1 = x-width/2
x2 = x+width/2
y1 = y-height/2
y2 = y+height/2