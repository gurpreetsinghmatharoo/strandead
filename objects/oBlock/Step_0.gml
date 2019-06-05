/// @description 
var size = global.items[blockID, stat.size];

//Boolet hit
//var bulletCol = bulletCollision();
//if (bulletCol){
//	hp--;
	
//	bulletCol.time = bulletCol.life-2;
//	bulletCol.active = false;
//}

//Enemy collision
var enemy = collision_rectangle(x-1, y-1, x+size+2, y+size+2, oEnemy, false, true);

if (enemy && !hurtTimer){
	hp--;
	hurtTimer = 200;
}

hurtTimer -= hurtTimer>0;

//Ded
if (hp<=0){
	instance_destroy();
}

//Bullet
var bulletCol = bulletCollision();

if (bulletCol){
	bulletCol.time = bulletCol.life-2;
	bulletCol.active = false;
}