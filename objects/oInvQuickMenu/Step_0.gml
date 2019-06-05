/// @description 
menuStep(global.inv);
invSelect();

//Invisible
if (place_meeting(camera_get_view_x(view_camera) + x, camera_get_view_y(view_camera) + y, oPlayer)){
	image_alpha = lerp(image_alpha, 0.5, 0.1);
}
else{
	image_alpha = lerp(image_alpha, 1, 0.1);
}

//Number controls
for(var i=1; i<=9; i++){
	if (keyboard_check_pressed(ord(string(i))) && ds_list_size(global.inv)>=i){
		global.selectedItem = i-1;
		break;
	}
}

//Wheel
var wheel = mouse_wheel_down() - mouse_wheel_up();

if (wheel!=0 && !wheelCD){
	global.selectedItem = clamp(global.selectedItem + wheel, 0, ds_list_size(global.inv)-1);
	
	wheelCD = 5;
}

wheelCD -= wheelCD>0;