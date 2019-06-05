/// @description 
surf = surface_create(camera_get_view_width(view_camera), camera_get_view_height(view_camera));

camX = camera_get_view_x(view_camera);
camY = camera_get_view_y(view_camera);

//Draw shadows
surface_set_target(surf);

draw_clear_alpha(0, 0);

with (all){
	if (layerStart=="Instances" && object_index!=oBlock && sprite_exists(sprite_index) && !(object_index==oItem && itemID==mat.leaf && itemType==type.mat)){
		draw_set_color(other.shadowColor);
		
		//Get scale
		var sX, sY;
		if (object_index==oTree){
			sX = scaleX;
			sY = scaleY;
		}
		else{
			sX = image_xscale;
			sY = image_yscale;
		}
		
		//Get textire soze
		var tex = sprite_get_texture(sprite_index, image_index);
		var uvs = texture_get_uvs(tex);
		var w = (uvs[2]-uvs[0])/texture_get_texel_width(tex) * sX;
		var h = (uvs[3]-uvs[1])/texture_get_texel_height(tex) * sY;
		
		//Draw shadow
		draw_ellipse(x-w/2-other.camX, bbox_bottom-(w*other.shadowHRad/2)-other.camY, 
		(x+w/2)-other.camX, bbox_bottom+(w*other.shadowHRad/2)-other.camY, false);
		
		draw_set_color(c_white);
	}
}

surface_reset_target();