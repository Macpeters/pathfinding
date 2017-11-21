//Run through A* process on current node

var debug=true;
var grid_width = oAStar.field_width;
var grid_height = oAStar.field_height
var curKey = scr_get_key(curX,curY);
var walkable = oAStar.walkable;

//add to closed list
ds_list_add(C,curKey);

//analyze adjacent blocks/grid locations
distFromStartToCurrent=ds_map_find_value(G, curKey);


for(var i=max(0,curX-1);i <= min(grid_width-1,curX+1);i++){
    for(var j=max(0,curY-1);j <= min(grid_height-1, curY+1);j++){
        if(i==curX && j==curY)
            continue;
		var checkKey = scr_get_key(i,j);
        var closed=ds_list_find_index(C,checkKey)!=-1;
        var diagonal=((i+j)%2 == (curX+curY)%2);
        var canWalk=false;
        var distFromCurrentToIJ=0;
        if(diagonal){
            canWalk=walkable[i,j] &&
					walkable[curX,j] && 
					walkable[i,curY];
            distFromCurrentToIJ=1.414;
        }else{
            canWalk=oAStar.walkable[i,j];
            distFromCurrentToIJ=1;
        }
        if(!closed && canWalk){
            //calculated G,H,and F
            var tempG=distFromStartToCurrent+distFromCurrentToIJ;
            var tempH=abs(i-endX)+abs(j-endY);//insert heuristic of choice (we use manhattan)
                //NOTE : you could also use point_distance(i,j,endX,endY);
            var tempF=tempG+tempH;
            //update if necessary
            var processed=ds_map_exists(G,checkKey);
            if(processed){
                var lowerG=(ds_map_find_value(G,checkKey)>tempG);
                if(lowerG){
                    ds_map_replace(G,scr_get_key(i,j),tempG);
                    ds_map_replace(H,scr_get_key(i,j),tempH);
                    ds_priority_change_priority(F,checkKey,tempF);
                    ds_map_replace(P,checkKey,curKey);  
                }
            }else{
                ds_map_add(G,checkKey,tempG);
                ds_map_add(H,checkKey,tempH);
                ds_priority_add(F,checkKey,tempF);
                ds_map_add(P,checkKey,curKey);     
            }
        }
    }
}
//find best option
var minF=-1;
var empty=ds_priority_empty(F);
if(!empty){
    minF=ds_priority_delete_min(F);
}
//decide what to do
if(minF==-1){
    searching=false;
    found=false;
}else{
	var fKeyX = scr_get_key_x(minF);
	var fKeyY = scr_get_key_y(minF);
    curX = fKeyX;
    curY = fKeyY;
}
//check whether we're at the end
if(curX==endX && curY==endY){
    searching=false;
    found=true;
}
