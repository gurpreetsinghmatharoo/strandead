/// @description 
if (global.selectedItem >= 0){
	var selectedArr = global.inv[| global.selectedItem];
	var selItem = selectedArr[pr.item];
	
	//Draw block grid
	if (selItem>=item.woodblock32){
		var size = global.items[selItem, stat.size];
		
		var camX = camera_get_view_x(view_camera);
		var camY = camera_get_view_y(view_camera);
		var camW = camera_get_view_width(view_camera);
		var camH = camera_get_view_height(view_camera);
		
		var mX = (mouse_x div size) * size;
		var mY = (mouse_y div size) * size;
		
		for(var xx=(camX div size)*size; xx<=camX+camW; xx+=size){
			for(var yy=(camY div size)*size; yy<=camY+camH; yy+=size){
				draw_set_alpha(0.5);
				
				draw_line(xx, yy, xx+size, yy);
				draw_line(xx, yy, xx, yy+size);
				
				if (mX==xx && mY==yy){
					draw_rectangle(xx, yy, xx+size, yy+size, false);
				}
				
				draw_set_alpha(1);
			}
		}
	}
}