/// @description 
//Depth
with (all){
	if (!variable_instance_exists(id, "layerStart")){
		layerStart = layer_get_name(layer);
	}
	
	if (layerStart=="Instances") depth = -bbox_bottom;
}

//Camera
var cX, cY, cam_w, cam_h;
cam_w = camera_get_view_width(view_camera);
cam_h = camera_get_view_height(view_camera);
cX = oPlayer.x - cam_w/2;
cY = oPlayer.y - cam_h/2;
cX = clamp(cX + irandom_range(-global.shake, global.shake), 0, room_width-cam_w);
cY = clamp(cY + irandom_range(-global.shake, global.shake), 0, room_height-cam_h);

camera_set_view_pos(view_camera, floor(cX), floor(cY));

//Shake
global.shake -= (global.shake>0)/2;