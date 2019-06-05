/// @description 
//Window
window_set_size(CAMW*SCALE, CAMH*SCALE);
surface_resize(application_surface, CAMW*SCALE, CAMH*SCALE);

window_set_position(display_get_width()/2-(CAMW*SCALE)/2, display_get_height()/2-(CAMH*SCALE)/2);

//Splash
image[0] = sSplash;
name[0] = "Matharoo";

image[1] = sBumi;
name[1] = "BumiBomber";

image[2] = sIodine;
name[2] = "Iodine";

splash = 0;

alpha = 0;
adir = 0;

alarm[0] = room_speed;

//pause = true;