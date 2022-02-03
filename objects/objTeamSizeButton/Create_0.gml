team_size = global.args[0]
if instance_number(self.object_index) == 3
{
	selected = true
	global.team_size = team_size
}
else
{
	selected = false
}

width = 100
height = 40
x1 = x-width/2
x2 = x+width/2
y1 = y-height/2
y2 = y+height/2