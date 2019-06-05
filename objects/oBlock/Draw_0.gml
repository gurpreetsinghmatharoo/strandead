/// @description 
if (sprite_exists(sprite_index)) {
	//draw_self();
	var maxHP = global.items[blockID, stat.hp];
	
	var ind = (maxHP-hp)*((sprite_get_number(sDamage))/maxHP);
	
	draw_sprite_pattern_ext(sprite_index, image_index, x, y, sDamage, ind, 0, 0, 1, 1);
}

//draw_text(x, y, hp);