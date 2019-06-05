/// @description 
hp = 4;
maxHp = hp;

scaleX = 1;
scaleY = 1;

//Cutting
upperRot = 0;
fall = 0;
playerXSign = 0;

upperH = sprite_yoffset;
var surfUpper = surface_create(sprite_width, upperH);
lowerH = sprite_height-sprite_yoffset;
var surfLower = surface_create(sprite_width, lowerH);

//Upper
surface_set_target(surfUpper);
draw_clear_alpha(0, 0);
draw_sprite(sprite_index, 0, sprite_xoffset, sprite_yoffset);
surface_reset_target();

sprUpper = sprite_create_from_surface(surfUpper, 0, 0, sprite_width, upperH, false, false, sprite_width/2, upperH);
surface_free(surfUpper);

//Lower
surface_set_target(surfLower);
draw_clear_alpha(0, 0);
draw_sprite(sprite_index, 0, sprite_xoffset, sprite_yoffset-upperH);
surface_reset_target();

sprLower = sprite_create_from_surface(surfLower, 0, 0, sprite_width, lowerH, false, false, sprite_width/2, 0);
surface_free(surfLower);
