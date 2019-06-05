/// @description 
mouseXPrev = mouse_x;
mouseYPrev = mouse_y;

window_set_cursor(cr_none);
cursor_sprite = sCursor;

//Help text
helpText = "  ||  This game uses autosave; so you can quit and continue your survival whenever you want!"
	+ "  ||  You can use the number keys or scroll wheel to change the equipped item."
	+ "  ||  Easy mode is ez! Try Hard mode for the real challenge.";

helpX = room_width;

//Menu options
enum menu{
	new,
	load,
	quit
}

options = 3;

oHeight = 32;

//Animation
for(var i=0; i<options; i++){
	rChar[i] = randomChar();
}

//Menu stats
enum mst{
	name
}

menuStats[menu.new, mst.name] = "New";
if (file_exists("jcsave")) menuStats[menu.load, mst.name] = "Load";
else menuStats[menu.load, mst.name] = "<No Save Found>";
menuStats[menu.quit, mst.name] = "Quit";

draw_set_font(ftMenu);

largeW = max(string_width(menuStats[menu.new, mst.name]),
			string_width(menuStats[menu.load, mst.name]),
			string_width(menuStats[menu.quit, mst.name]));

//Menu vars
menuOption = 0;
menuMode = 0;

char = 0;

//Resolution
window_set_size(CAMW*SCALE, CAMH*SCALE);
surface_resize(application_surface, CAMW*SCALE, CAMH*SCALE);

//Fade
alpha = 1;

//Background
hue = 0;