/// @description 
if (global.pause) exit;

//Set sprite
sprite_index = global.enemies[enemyID, stat.sprite];

//Follow player
spd = 0;

var enemyCol = instance_place(x, y, oEnemy);
if (enemyCol){
	var eDir = point_direction(x, y, enemyCol.x, enemyCol.y);
	
	spd = moveSpeed;
	dir = eDir-180;
}
else if (instance_exists(oPlayer)) pathfinding(oPlayer.x, oPlayer.y, moveSpeed, oCollision);

var pDir = point_direction(x, y, oPlayer.x, oPlayer.y);
var pDist = point_distance(x, y, oPlayer.x, oPlayer.y);

//Dodge
var range = 256;
	
//if (bulletCollision(x + lengthdir_x(pDist, pDir), y + lengthdir_y(pDist, pDir))){
if (pDist < range && instance_exists(oBullet) && 
	collision_line(oPlayer.x, oPlayer.y, oPlayer.x + lengthdir_x(range, oPlayer.mouseDir), 
		oPlayer.y + lengthdir_y(range, oPlayer.mouseDir), id, false, false)){
	dir = pDir+dashDir;
	spd = 2.5 * (1 + global.hardMode);
		
	hspBoost = lengthdir_x(1 + global.hardMode, dir);
	vspBoost = lengthdir_y(1 + global.hardMode, dir);
}
	
//Dash towards player
if (pDist < 48 && pDist>32){
	hspBoost = lengthdir_x(2, pDir);
	vspBoost = lengthdir_y(2, pDir);
}

//if (place_meeting(x, y, oEnemy) || place_meeting(x, y, oCollision)){
//	mp_potential_step(random(1000), random(1000), moveSpeed, false);
//}
//else if (instance_exists(oPlayer) && distance_to_object(oPlayer)>16){
//	mp_potential_step(oPlayer.x, oPlayer.y, moveSpeed, true);
//}
//else{
//	spd = moveSpeed;
//	dir = point_direction(x, y, oPlayer.x, oPlayer.y);
//}

//Movement
hsp = lengthdir_x(spd, dir) + hspBoost;
vsp = lengthdir_y(spd, dir) + vspBoost;

//Collisions
if (place_meeting(x+hsp, y, oCollision)){
    hsp = 0;
}

if (place_meeting(x, y+vsp, oCollision)){
    vsp = 0;
}

if (place_meeting(x+hsp, y+vsp, oCollision)){
    hsp = 0;
}

x = round(x + hsp);
y = round(y + vsp);

//Boost
hspBoost = lerp(hspBoost, 0, 0.1);
vspBoost = lerp(vspBoost, 0, 0.1);

//Bullet hit
var bulletCol = bulletCollision();

if (bulletCol){
	//Knockback
	var bDir = point_direction(bulletCol.x1, bulletCol.y1, bulletCol.x2, bulletCol.y2);
	hspBoost = lengthdir_x(kbSpeed, bDir);
	vspBoost = lengthdir_y(kbSpeed, bDir);
	
	//HP
	hp -= 1;
	hurt = 1;
	
	//Bullet
	bulletCol.time = bulletCol.life-2;
	bulletCol.active = false;
}

//Explosion
expCollision();

//Ded
if (hp<=0){
	instance_destroy();
}

//Hurt
hurt -= (hurt>0)/10;

//Animation
image_xscale = abs(hsp) ? sign(hsp) : image_xscale;