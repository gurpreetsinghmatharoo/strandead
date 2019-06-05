/// @description 
//Keyboard arrows
var ver = (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down))-
	(keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up));
	
menuOption += ver;

if (menuOption < 0) menuOption += options;
if (menuOption >= options) menuOption -= options;

//Mouse
var mH = mouse_x - mouseXPrev;
var mV = mouse_y - mouseYPrev;

var inR = point_in_rectangle(mouse_x, mouse_y, x, y, x+largeW, y+options*oHeight);

if (abs(mH) || abs(mV)) && inR{
	var mY = (mouse_y-y) div oHeight;
	
	menuOption = clamp(mY, 0, options-1);
}

//Enter
if (keyboard_check_pressed(vk_enter) || (mouse_check_button_pressed(mb_left) && inR)){
	switch(menuMode){
		case 0:
			switch(menuOption){
				case menu.new:
					menuStats[menu.new, mst.name] = "Easy";
					menuStats[menu.load, mst.name] = "Hard";
					menuStats[menu.quit, mst.name] = "Back";
					
					menuMode = 1;
					
					char = 0;
				break;
		
				case menu.load:
					if (menuStats[menu.load, mst.name] == "Load"){
						instance_create_depth(0, 0, 0, oLoad);
						room_goto(rmGame);
					}
				break;
		
				case menu.quit:
					game_end();
				break;
			}
		break;
		
		case 1:
			switch(menuOption){
				case menu.new:
					room_goto(rmGame);
				break;
				
				case menu.load:
					instance_create_depth(0, 0, 0, oHard);
					room_goto(rmGame);
				break;
				
				case menu.quit:
					menuMode = 0;
					
					menuStats[menu.new, mst.name] = "New";
					if (file_exists("jcsave")) menuStats[menu.load, mst.name] = "Load";
					else menuStats[menu.load, mst.name] = "<No Save Found>";
					menuStats[menu.quit, mst.name] = "Quit";
					
					char = 0;
				break;
			}
		break;
	}
	
	audio_play_sound(sndClick, 8, false);
}