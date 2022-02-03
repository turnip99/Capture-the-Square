map_size = global.args[0]
if instance_number(self.object_index) == 2
{
	selected = true
	global.map_size = map_size
}
else
{
	selected = false
}

width = 170
height = 40
x1 = x-width/2
x2 = x+width/2
y1 = y-height/2
y2 = y+height/2