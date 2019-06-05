//Select
if (itemID >= 0 && itemID < ds_list_size(global.inv) && mouseLMB<0){
	if (global.selectedItem != itemID){
		global.selectedItem = itemID;
	}
	else{
		global.selectedItem = -1;
	}
	
	audio_play_sound(sndClick, 8, false);
}