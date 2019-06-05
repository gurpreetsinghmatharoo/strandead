/// @description 
//Background
draw_set_color(make_color_hsv(hue, 150, 100));
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(c_white);

hue+=0.1;

//Title
draw_sprite(sTitle, 0, room_width/2, room_height*0.3);

//Menu
draw_set_font(ftMenu);

for(var i=0; i<options; i++){
	var str = string_copy(menuStats[i, mst.name], 1, char);
	
	if (irandom(4)==0) rChar[i] = randomChar();
	
	if (char<=string_length(menuStats[i, mst.name]) && char>0){
		str = string_copy(str, 1, char-1) + rChar[i];
	}
	
	draw_text_color(x, y+i*oHeight, str, -1, -1, -1, -1, 0.5 + (i==menuOption)/2);
}

//Animation
char+=0.2;

//Debug
//draw_rectangle(x, y, x+largeW, y+options*oHeight, true);

//Help text
draw_set_font(ftGUI);

var helpW = string_width(helpText);
var space = "";
draw_text(helpX, room_height-24, helpText + space + helpText);

helpX -= 2;

if (helpX < -helpW) helpX = string_width(space);

//Hiscore
if (file_exists("hiscore")){
	var map = ds_map_secure_load("hiscore");
	
	var hiscore0 = map[? "hiscore0"];
	var hiscore1 = map[? "hiscore1"];
	
	if (hiscore0==undefined) hiscore0 = 0;
	if (hiscore1==undefined) hiscore1 = 0;
	
	draw_text(4, 4, "Easy High-score: " + string(hiscore0) + "\nHard High-score: " + string(hiscore1));
	
	ds_map_destroy(map);
}

//Fade
alpha -= (alpha>0)/20;

draw_set_alpha(alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(c_white);
draw_set_alpha(1);