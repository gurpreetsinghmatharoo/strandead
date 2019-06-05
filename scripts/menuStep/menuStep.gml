/// @arg list

//Get mouse data
var cellX, cellY;
cellX = (global.mouseX - x) div cellSize;
cellY = (global.mouseY - y) div cellSize;

if (mouseIn){
	itemID = cellX + cellY*(image_xscale/cellSize);
}
else{
	itemID = -1;
}

//Time
time++;

//Scroll
if (mouseRMB && mouseIn){
	//Height
	var height = ds_list_size(argument[0])/(image_xscale/cellSize);
	height *= cellSize;
	
	//Scroll
	var ver = global.mouseY - global.mouseYPrev;
	
	scroll = clamp(scroll-ver, 0, max(0, height-image_yscale));
}