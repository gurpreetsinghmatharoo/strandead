/// @description 
var guiW = display_get_gui_width();
var guiH = display_get_gui_height();

//Pause darken
if (global.pause || global.dead){
	draw_set_alpha(0.6);
	draw_set_color(c_black);
	draw_rectangle(0, 0, guiW, guiH, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
}

//Death
if (global.dead){
	draw_text_center(guiW/2, guiH/2, "Score: " + string(global.points) + "\n\nHit Enter to continue", 2, 2, 0, c_white, 1);
}

//Health
if (instance_exists(oPlayer)){
	hpShow = lerp(hpShow, oPlayer.hp, 0.2);
}

var hbX = 36;
var hbY = 7;
var hbW = 91;
var hbH = 19;

draw_sprite(sHealthGUI, 0, guiW - (hbW+hbX), hbY);
draw_healthbar(guiW-hbX, hbY, guiW-hbX-hbW, hbY+hbH, hpShow, -1, playerHpColor, playerHpColor, 1, 0, 0);

//Points
draw_set_halign(fa_right);
if (!global.dead) draw_text(guiW - hbX, hbY*2 + hbH, "Score: " + string(global.points));
draw_set_halign(fa_left);

//Debug
if (devMode){
	//draw_text(5, 5, "Enemy Cooldown: " + string(enemyCooldown));
	
	//var str = "Music_" + global.audioPiece + string(global.intLevel+1);
	//var aud = asset_get_index(str);
	var trk = track;
	//var str = audio_get_name(trk);
	
	//draw_text(5, guiH-32, str);
	draw_healthbar(0, guiH-16, guiW, guiH, (audio_sound_get_track_position(trk)/audio_sound_length(trk))*100, -1, c_green, c_green, 0, 0, 1);
}

//Menu Surface
if (surface_exists(global.menuSurf)){
	draw_surface_ext(global.menuSurf, 0, 0, 1/SCALE, 1/SCALE, 0, -1, global.menuA);
	
	global.menuA -= 0.02;
	
	if (global.menuA<0.05){
		surface_free(global.menuSurf);
	}
}
