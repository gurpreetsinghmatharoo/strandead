/// @description 
if (grav<4) grav += 0.1;

z += grav;

spd -= 0.06;

//Movement
hsp = lengthdir_x(spd, dir);
vsp = lengthdir_y(spd, dir);

x += hsp;
y += vsp;

image_angle -= sign(hsp) * 3;

//Explode
if (z > 0 || place_meeting(x, y, oCollision) || place_meeting(x, y, oEnemy)){
	instance_destroy();
	
	var main = instance_create_layer(x, y, "Instances", oExplosion);
	main.main = main;
	audio_play_sound(sndExplosion, 8, false);
	global.shake = 8;
	
	var dist = 16;
	for(var i=0; i<360; i+=90){
		var inst = instance_create_layer(x + lengthdir_x(dist, i), y + lengthdir_y(dist, i), "Instances", oExplosion);
		inst.main = main;
	}
}