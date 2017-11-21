/// @description
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_green);

for(var i=0; i<field_width; i++){
	for(var j=0; j<field_height; j++){
		draw_rectangle(
			i * block_size, 
			j * block_size, 
			(i+1) * block_size, 
			(j+1) * block_size, 
			walkable[i,j]
		);
		draw_text(i * block_size, j * block_size, string(i) + "/" + string(j));
		var key = scr_get_key(i, j)
		draw_text(i * block_size, j * block_size + 32, string(key));
	}
}