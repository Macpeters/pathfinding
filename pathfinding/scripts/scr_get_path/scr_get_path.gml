//creates a path from (startX,startY) to (endX,endY)
// param0 = startX : starting x position
// param1 = startY : starting y position
// param2 = endX : ending x position
// param3 = endY : ending y position

//NOTE : Inputs are in terms of room positions. 
//       All other positions will be in terms of grid

var startRoomX=argument0;
var startRoomY=argument1;
var endRoomX=argument2;
var endRoomY=argument3;

//_____PRE-ALGOR____
//convert vars into grid
startX=startRoomX div oAStar.block_size;
startY=startRoomY div oAStar.block_size;
endX=endRoomX div oAStar.block_size;
endY=endRoomY div oAStar.block_size;

//create datastructures
G=ds_map_create();
H=ds_map_create();
F=ds_priority_create();
P=ds_map_create();
C=ds_list_create();

//init first G value
ds_map_add(G,scr_get_key(startX,startY),0);

//_____ALGOR____
searching=true;
found=false;
curX=startX;
curY=startY;
while(searching){
    scr_process_current_node();
}

var path=-1;
if(found){
    path=path_add();
    var curNode=scr_get_key(endX,endY);
    while(curNode!=scr_get_key(startX,startY)){
		
        path_add_point(
			path,
			scr_get_key_x(curNode)*oAStar.block_size,
            scr_get_key_y(curNode)*oAStar.block_size,
			100
		);
        var parentNode = ds_map_find_value(P,curNode);
		curNode = parentNode
    }
    path_add_point(path,startX*oAStar.block_size,startY*oAStar.block_size,100);
    path_reverse(path);
    path_set_closed(path,false);
}

//_____POST-ALGOR____
//destroy datastructures
ds_map_destroy(G);
ds_map_destroy(H);
ds_priority_destroy(F);
ds_map_destroy(P);
ds_list_destroy(C);

//return our result
return path;
