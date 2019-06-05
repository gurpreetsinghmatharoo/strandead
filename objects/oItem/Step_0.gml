/// @description 
//Sprite
sprite_index = global.materials[itemID, stat.sprite];

//Get collected
if (place_meeting(x, y, oPlayer)){
	instance_destroy();
	
	audio_play_sound(sndItemget, 8, false);
	
	addInv(itemID, 1, itemType);
	
	with instance_create_layer(x-camera_get_view_x(view_camera), y-camera_get_view_y(view_camera)-z, "GUI", oItemFade){
		itemID = other.itemID;
	}
}

//Gravity
if (z>0){
	z-=grav;
	if (grav<1) grav+=0.1;
	
	if (!place_meeting(x+hsp, y+vsp, oCollision)){
		x += hsp;
		y += vsp;
	}
}