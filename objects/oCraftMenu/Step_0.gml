/// @description 
menuStep(global.craftInv);

//On click, craft item
if (itemID >= 0 && itemID < ds_list_size(global.craftInv) && mouseLMB<0 && !(global.firstTime && global.guiHelp>0)){
	var arr = global.craftInv[| itemID];
	var item = arr[pr.item];
	var craftable = arr[pr.craftable];
	
	if (craftable){
		addInv(item);
	
		//Remove from crafting
		ds_list_delete(global.craftInv, itemID);
	
		//Deduct materials
		var recipeArr = global.items[item, stat.recipe];
	
		for(var j=0; j<array_length_1d(recipeArr); j++){
			var recipeItemArr = recipeArr[j];
			var recipeItem = recipeItemArr[pr.item];
			var recipeCount = recipeItemArr[pr.count];
		
			addInv(recipeItem, -recipeCount, true);
		}
	
		audio_play_sound(sndClick, 8, false);
	}
}