/// @description 
//if (keyboard_check_pressed(vk_space)){
//	pause = false;
//	alarm[0] = room_speed;
//}

//if (pause) exit;

//Alpha
alpha = abs(dsin(adir));
adir += 180/room_speed;

//Skip
if (mouse_check_button_pressed(mb_left)){
	alpha = 0;
	splash++;
}

//Draw
if (splash<array_length_1d(image)){
	draw_set_font(ftMenu);

	var spr = image[splash];
	var nm = name[splash];
	var sW = sprite_get_width(spr);
	var nW = string_width(nm);
	var dist = 8;

	var w = sW + dist + nW;

	var sX = (room_width/2)  - (w/2);

	draw_sprite_ext(spr, 0, sX, room_height/2, 1, 1, 0, -1, alpha);

	draw_set_valign(fa_middle);
	draw_text_color(sX + sW + dist, room_height/2, nm, -1, -1, -1, -1, alpha);
	draw_set_valign(fa_top);
}