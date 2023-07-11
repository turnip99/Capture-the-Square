surface_resize(application_surface, window_get_width(), window_get_height());
randomize()
generate_room()
alarm[0] = 60

minimap_width=250
minimap_height=250
minimap_sizex=minimap_width/room_width
minimap_sizey=minimap_height/room_height
minimap_x1 = window_get_width()-minimap_width
minimap_y1 = 0
minimap_x2 = window_get_width()
minimap_y2 = minimap_height