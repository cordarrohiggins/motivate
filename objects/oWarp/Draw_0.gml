for (var i = 0; i <= room_width; i = i + sprite_width) {
	for (var j = 0; j <= room_height; j = j + sprite_height) {
		draw_sprite(sprite_index, image_index, i, j);	
	}
}