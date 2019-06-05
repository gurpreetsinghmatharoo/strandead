var Exp = instance_place(x, y, oExplosion);

if (Exp){
	if (object_index==oPlayer) hp-=20;
	else hp--;
	
	//Knockback
	var bDir = point_direction(Exp.main.x, Exp.main.y, x, y);
	var bDist = point_distance(Exp.main.x, Exp.main.y, x, y);
	//var bRad = sprite_get_width(sExplosion)/2;
	//var bSpd = kbSpeed * (bRad-bDist)/bRad;
	var bSpd = 4;
	hspBoost = lengthdir_x(bSpd, bDir);
	vspBoost = lengthdir_y(bSpd, bDir);
}