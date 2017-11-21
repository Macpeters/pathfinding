/// @description  

draw_self();
var halfBlockWidth = 0.5 * oAStar.block_size;
var pathNumber = path_get_number(path_index);

//draw path elements
if(pathNumber >= 2){
	//draw path
	draw_set_color(c_blue);
	for(var i=0; i < pathNumber-1; i++){
		draw_line(
			path_get_point_x(path_index, i)+ halfBlockWidth,
			path_get_point_y(path_index, i)+ halfBlockWidth,
			path_get_point_x(path_index, i+1)+ halfBlockWidth,
			path_get_point_y(path_index, i+1)+ halfBlockWidth,
		);
	}
	
	//draw starting point and ending point
	draw_set_color(c_green);
	draw_circle(
		path_get_point_x(path_index,0) + halfBlockWidth,
		path_get_point_y(path_index,0) + halfBlockWidth, 
		5, 
		false
	);
	draw_set_color(c_red);
	draw_circle(
		path_get_point_x(path_index, pathNumber - 1) + halfBlockWidth,
		path_get_point_y(path_index, pathNumber - 1) + halfBlockWidth,
		5,
		false
	);
	
}
