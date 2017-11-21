/// @description
if(mouse_check_button_pressed(mb_any)){
	var path = scr_get_path(x, y, mouse_x, mouse_y);
	path_start(path, 5, 0, true);
}

