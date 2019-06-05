/// @description 
menuDrawGUI(global.craftInv);

//Draw tooltip
if (itemID >= 0 && itemID < ds_list_size(global.craftInv)){
	var arr = global.craftInv[| itemID];
	var item = arr[pr.item];
	var recipeArr = global.items[item, stat.recipe];
	
	var cardX = global.mouseX;
	var cardY = global.mouseY;
	
	var w = 0;
	var h = 0;
	
	var guiW = display_get_gui_width();
	var guiH = display_get_gui_height();
	
	for(var j=0; j<array_length_1d(recipeArr); j++){
		var recipeItemArr = recipeArr[j];
		var recipeItem = recipeItemArr[pr.item];
		var recipeCount = recipeItemArr[pr.count];
		
		//Draw background
		draw_set_color(global.titleColor);
		draw_rectangle(cardX + w, cardY + h, cardX + w + cellSize, cardY + h + cellSize, false);
		draw_set_color(c_white);
		
		//Draw items
		draw_sprite(global.materials[recipeItem, stat.sprite], 0, cardX + w + cellSize/2, cardY + h + cellSize/2);
		draw_text(cardX + w + 4, cardY + h + 4, recipeCount);
		
		//Increase position
		w += cellSize;
		
		//Exceeding size
		if (cardX + w + cellSize > guiW){
			w = 0;
			h += cellSize;
		}
		if (cardY + h + cellSize > guiH){
			h -= cellSize*2;
		}
	}
}