/// @description 
if (hp<=0){
	if (playerXSign==0) playerXSign = sign(oPlayer.x-x);
	
	fall += (fall<4)/16;
	
	if (abs(upperRot)<90) upperRot += fall*playerXSign;
	else{
		instance_destroy();
		audio_play_sound(sndTreeFall, 8, false);
		global.shake = 5;
	}
}
else if (hp<maxHp){
	if (playerXSign==0) playerXSign = sign(oPlayer.x-x);
	upperRot = lerp(upperRot, (maxHp-hp)*playerXSign*4, 0.2);
}

scaleX = lerp(scaleX, 1, 0.1);
scaleY = lerp(scaleY, 1, 0.1);

//if (scaleX>0.95) scaleX = 1;
//if (scaleY>0.95) scaleY = 1;

//Transparency
if (point_distance(x, y-32, oPlayer.x, oPlayer.y)<48 && oPlayer.y < y-16 && !global.hardMode){
	image_alpha = lerp(image_alpha, 0.5, 0.1);
}
else{
	image_alpha = lerp(image_alpha, 1, 0.1);
}