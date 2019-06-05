/// @description 
#region Calculate craftables
if (instance_exists(oMaterialMenu)){
	//Empty list
	ds_list_clear(global.craftInv);
	
	//Loop through all craftable items
	for(var i=0; i<array_height_2d(global.items); i++){
		var recipeArr = global.items[i, stat.recipe];
		var craftable = true;
		
		//Loop through all items in the recipe and check whether anything is missing
		for(var j=0; j<array_length_1d(recipeArr); j++){
			var recipeItemArr = recipeArr[j];
			var recipeItem = recipeItemArr[pr.item];
			var recipeCount = recipeItemArr[pr.count];
			var itemInv = itemPosition(recipeItem, recipeCount, true);
			
			if (itemInv<0){
				craftable = false;
				break;
			}
		}
		
		//Add to craftable list if craftable
		ds_list_add(global.craftInv, [i, "", 1, craftable]);
	}
}
#endregion

#region Spawn enemies
if (enemyCD<=0){
	//Position
	var dist = 64;
	var xPos, yPos;
	if (irandom(1)==0){
		xPos = choose(-dist, room_width+dist);
		yPos = random(room_height);
	}
	else{
		xPos = random(room_width);
		yPos = choose(-dist, room_height+dist);
	}
	
	//Spawn
	spawnEnemy(xPos, yPos, irandom(ENEMIES-1));
	
	//Cooldown
	enemyCD = enemyCooldown;
	enemyCooldown = max(enemyCooldown*0.95, room_speed*5);
}

//Cooldown
enemyCD -= enemyCD > 0;
#endregion

#region Respawn trees and mines
//Trees
var totalTrees = instance_number(oTree);
if (!timerTrees && totalTrees<maxTrees){
	//Get position to place tree
	do{
		var treeX = irandom(room_width);
		var treeY = irandom(room_height);
	}
	until(getTile(treeX, treeY)==tile.grass && !collision_circle(treeX, treeY, 32, all, false, true));
	
	//Place
	with instance_create_layer(treeX, treeY, "Instances", oTree){
		scaleX = 0;
		scaleY = 0;
	}
	
	//Timer
	timerTrees = (totalTrees/maxTrees) * 2000;
}
timerTrees -= timerTrees>0 && totalTrees<maxTrees;

//Mines
var totalMines = instance_number(oMetalMine);
if (!timerMines && totalMines<maxMines){
	//Get position to place mine
	do{
		var mineX = irandom(room_width);
		var mineY = irandom(room_height);
	}
	until(getTile(mineX, mineY)==tile.dirt);
	
	//Place
	instance_create_layer(mineX, mineY, "Mining", oMetalMine);
	
	//Timer
	timerMines = (totalMines/maxMines) * 2000;
}
timerMines -= timerMines>0 && totalMines<maxMines;

#endregion

#region Developer mode
if (devMode){
	//Test: place items on click
	if (!global.pause && global.selectedItem<0){
		if (mouse_check_button_pressed(mb_right)){
			repeat(10){
				spawnItem(mouse_x, mouse_y, mat.metal, type.mat);
				spawnItem(mouse_x, mouse_y, mat.gunpowder, type.mat);
				spawnItem(mouse_x, mouse_y, mat.wood, type.mat);
				spawnItem(mouse_x, mouse_y, mat.leaf, type.mat);
			}
		}
	}
	
	//Disable enemies
	if (keyboard_check(vk_control) && keyboard_check_pressed(ord("E"))){
		enemyCD = 1000000;
		if (instance_exists(oEnemy)) instance_destroy(oEnemy);
	}
	
	//Seek through music
	var hor = keyboard_check_pressed(ord("E")) - keyboard_check_pressed(ord("Q"));
	audio_sound_set_track_position(track, audio_sound_get_track_position(track)+5*hor);
	
	//Intensity
	//var ver = keyboard_check_pressed(ord("I")) - keyboard_check_pressed(ord("K"));
	//if (ver>0) setIntensity(1);
	//if (ver<0) setIntensity(0);
	
	//Reset
	if (keyboard_check(vk_control) && keyboard_check_pressed(ord("R"))){
		file_delete("jcsave");
		global.reset = true;
		game_restart();
	}
	else if (keyboard_check_pressed(ord("R"))){
		room_restart();
	}
}
#endregion

#region Retry (Dead)
if (global.dead){
	if (keyboard_check_pressed(vk_enter)){
		room_goto(rmMenu);
	}
	//if (keyboard_check_pressed(vk_escape)){
	//	room_goto(rmMenu);
	//}
}
#endregion

#region Audio
//Play next part
//for(var i=0; i<array_length_1d(audGrp); i++){
//	var aud = asset_get_index("Music_" + string(i+1));
//	var trk = track[i];
	
//	var pos = audio_sound_get_track_position(trk);
//	var len = audio_sound_length(trk);
//	var seek = pos/len;
	
//	if (len-pos<3.871 && playNew[i]){
//		//if (playNew){
//		//global.audioPiece = choose("A", "B", "C", "D");
//		//aud = asset_get_index("Music_" + string(i+1));
//		//playNew = true;
			
//		tPrev = track[i];
//		track[i] = audio_play_sound(aud, 8, false);
//		playNew[i] = false;
			
//		//Fade
//		//var time = (len * (1-seek)) * 1000;
			
//		//audio_sound_gain(track[i], 0, 0);
//		//audio_sound_gain(track[i], 1, time);
//		//audio_sound_gain(tPrev, 0, time);
			
//		//if (i==global.intLevel){
//		//	global.track = aInst;
//		//}
//		//}
//		//else{
//		//}
//	}
	
//	//Play
//	if (!audio_is_playing(aud)){
//		track[i] = audio_play_sound(aud, 8, false);
//	}
	
//	//Enable
//	if (!audio_is_playing(tPrev) && !playNew[i]){
//		playNew[i] = true;
//	}
//}

//Intensity levels
//var eNear = instance_nearest(oPlayer.x, oPlayer.y, oEnemy);
//var int2 = false;
//if (eNear && point_distance(oPlayer.x, oPlayer.y, eNear.x, eNear.y)<256){
//	int2 = true;
//}

//switch(global.intLevel){
//	case 0:
//		if (int2) setIntensity(1);
//	break;
	
//	case 1:
//		if (!int2) setIntensity(0);
//	break;
//}
#endregion

#region First time
//Gui help
if (instance_exists(oMaterialMenu) && global.firstTime && global.guiHelp>0 && mouse_check_button_pressed(mb_left)){
	global.guiHelp--;
}
#endregion