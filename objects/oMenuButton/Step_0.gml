/// @description 
if (clicked<=0) image_index = mouseIn;
else clicked--;

if (mouseIn && mouseLMB>=2){
	clicked = 5;
	image_index = 2;
	
	audio_play_sound(sndClick, 8, false);
}

//Button click
if (mouseIn && mouseLMB>=2) || keyboard_check_pressed(vk_escape){
	if (instance_exists(oMaterialMenu) && keyboard_check_pressed(vk_escape)){
		instance_destroy(oMaterialMenu);
		instance_destroy(oInvMenu);
		instance_destroy(oCraftMenu);
		
		global.pause = false;
	}
	else{
		instance_create_layer(0, 0, "GUITop", oMaterialMenu);
		instance_create_layer(0, 0, "GUITop", oInvMenu);
		instance_create_layer(0, 0, "GUITop", oCraftMenu);
		
		global.pause = true;
	}
}

//Close
if (instance_exists(oMaterialMenu) && mouseLMB && 
	!(global.firstTime && global.guiHelp>0) && !(position_meeting(global.mouseX, global.mouseY, oMaterialMenu)
	|| position_meeting(global.mouseX, global.mouseY, oInvMenu)
	|| position_meeting(global.mouseX, global.mouseY, oCraftMenu))
	&& oMaterialMenu.time>10){
	instance_destroy(oMaterialMenu);
	instance_destroy(oInvMenu);
	instance_destroy(oCraftMenu);
		
	global.pause = false;
}