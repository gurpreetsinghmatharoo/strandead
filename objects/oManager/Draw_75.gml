/// @description 
var guiW = display_get_gui_width();
var guiH = display_get_gui_height();

//Help
if (instance_exists(oMaterialMenu) && global.firstTime && global.guiHelp>0){
	draw_set_alpha(0.6);
	draw_set_color(c_black);
	draw_rectangle(0, 0, guiW, guiH, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	var w = guiW * 0.3;
	var h = 8;
	
	switch(global.guiHelp){
		case 3:
			draw_textbox(oMaterialMenu.x, oMaterialMenu.y + h, "Here are your materials; you can use them for crafting items.", w);
		break;
		
		case 2:
			draw_textbox(oInvMenu.x, oInvMenu.y + h, "This is your inventory. You can equip any item from here.", w);
		break;
		
		case 1:
			draw_textbox(oCraftMenu.x, oCraftMenu.y + h, "Here you can craft items for your inventory. Hover over any item to see what materials it needs, and click to craft!", w);
		break;
	}
}