
mouseIn = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);
mouseLMB = mouse_check_button(mb_left) + (mouse_check_button_pressed(mb_left) - mouse_check_button_released(mb_left));
mouseRMB = mouse_check_button(mb_right) + (mouse_check_button_pressed(mb_right) - mouse_check_button_released(mb_right));

//Cancel click if mouse on GUI
if (position_meeting(global.mouseX, global.mouseY, oGUI) && object_get_parent(object_index)!=oGUI){
	mouseLMB = 0;
	mouseRMB = 0;
}