/// @description 
if (sprite_exists(sprite_index)){
	draw_self();

	shader_set(shWhite);
	shader_set_uniform_f(uniAlpha, hurt);

	draw_self();

	shader_reset();
}