/// @arg list
//Args
var _list = argument[0];

//Function
draw_self();

//Surface
var surf = surface_create(image_xscale, image_yscale);

surface_set_target(surf);
draw_clear_alpha(0, 0);

var xx=0, yy=-scroll;
var margin = 2;
for(var i=0; i<ds_list_size(_list); i++){
	//Get data
	var arr = _list[| i];
	var item = arr[pr.item];
	var count = arr[pr.count];
	var uncraftable = _list==global.craftInv && !arr[pr.craftable];
	
	//Draw
	draw_set_alpha(0.5 + (itemID==i)/2);
	draw_rectangle(xx+margin, yy+margin, xx+(cellSize-margin), yy+(cellSize-margin), false);
	draw_set_alpha(1);
	
	//Sprite
	if (_list==global.materialInv) var arr = global.materials;
	else var arr = global.items;
	
	//Offset percentage
	var spr = arr[item, stat.sprite];
	var offX, offY, sprW, sprH, diffW, diffH, scaleW, scaleH;
	offX = sprite_get_xoffset(spr);
	offY = sprite_get_yoffset(spr);
	sprW = sprite_get_width(spr);
	sprH = sprite_get_height(spr);
	scaleW = min(1, 24/max(sprW, sprH));
	scaleH = min(1, 24/max(sprW, sprH));
	sprW *= scaleW;
	sprH *= scaleH;
	offX *= scaleW;
	offY *= scaleH;
	diffW = (cellSize - sprW)/2;
	diffH = (cellSize - sprH)/2;
	
	draw_sprite_ext(spr, 0, xx + diffW + offX, yy + diffH + offY, scaleW, scaleH, 0, -1, 1);
	
	//Count
	draw_set_color(c_gray);
	draw_text(xx+2, yy+2, count);
	draw_set_color(c_white);
	
	//Inventory
	if (_list==global.inv){
		var arr = global.inv[| i];
		var hp = arr[pr.hp];
	
		//Selected box
		if (global.selectedItem==i){
			draw_set_color(global.selectedColor);
			draw_rectangle(xx, yy, xx+cellSize-1, yy+cellSize-1, true);
			draw_rectangle(xx+1, yy+1, xx+cellSize-2, yy+cellSize-2, true);
			draw_set_color(c_white);
		}
		
		//Health
		draw_healthbar(xx+1, yy+cellSize-4, xx+cellSize-2, yy+cellSize-2, (hp/global.items[item, pr.hp])*100, c_black, global.hpColor, global.hpColor, 0, 0, 1);
	}
	
	//Uncraftables
	if (uncraftable){
		draw_set_color(c_black);
		draw_set_alpha(0.5);
		draw_rectangle(xx, yy, xx+cellSize, yy+cellSize, false);
		draw_set_color(c_white);
		draw_set_alpha(1);
	}
	
	//Increase
	xx+=cellSize;
	
	if (xx+cellSize>image_xscale){
		xx=0;
		yy+=cellSize;
	}
}

surface_reset_target();

//Draw
draw_surface(surf, x, y);
surface_free(surf);

//Draw title
var title = "";

if (object_index==oMaterialMenu) title = "Materials";
else if (object_index==oCraftMenu) title = "Craft";
else if (object_index==oInvMenu) title = "Inventory";

var titleHeight = 16;

if (title!=""){
	draw_set_color(global.titleColor);
	draw_rectangle(x, y-titleHeight, x+image_xscale, y, false);
	draw_set_color(c_white);

	draw_text_center(x+image_xscale/2, y-titleHeight/2, title, 1, 1, 0);
}

//Draw item name
if (itemID >= 0 && itemID < ds_list_size(_list) && _list!=global.craftInv){
	var arr = _list[| itemID];
	var item = arr[pr.item];
	
	if (_list==global.materialInv) var arr = global.materials;
	else var arr = global.items;

	var name = arr[item, stat.name];
	var margins = 4;
	
	draw_set_color(global.titleColor);
	draw_rectangle(global.mouseX, global.mouseY, global.mouseX + margins*2 + string_width(name), global.mouseY + margins*2 + string_height(name), false);
	draw_set_color(c_white);
	
	draw_text(global.mouseX + margins, global.mouseY + margins, name);
}