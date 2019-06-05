/// @arg width
/// @arg heigh
/// @arg x
/// @arg y

//Vars
var guiW = display_get_gui_width();
var guiH = display_get_gui_height();

//Window
image_xscale = guiW*argument[0];
image_yscale = guiH*argument[1];
x = guiW*argument[2];
y = guiH*argument[3];

//Properties
cellSize = 32;

//Misc
time = 0;
scroll = 0;

//Main
itemID = -1;