/// @description 
//Mouse
global.mouseXPrev = global.mouseX;
global.mouseYPrev = global.mouseY;
global.mouseX = device_mouse_x_to_gui(0);
global.mouseY = device_mouse_y_to_gui(0);

getMouse();