/// @description 
//Pause
if (global.pause){
	exit;
}

#region Interaction
//Hurt
var enemyCol = instance_place(x, y, oEnemy);
if (enemyCol){
	hp -= enemyCol.attack * (1 + global.hardMode);
	
	var eDir = point_direction(enemyCol.x, enemyCol.y, x, y);
	hspBoost = lengthdir_x(kbSpeed, eDir);
	vspBoost = lengthdir_y(kbSpeed, eDir);
	
	hurtTime = 30;
}

//Explosion
expCollision();

hurtTime -= hurtTime>0;
#endregion

if (!dead){

#region Movement
var hor, ver;
hor = (keyboard_check(ord("D")) || keyboard_check(vk_right))-(keyboard_check(ord("A")) || keyboard_check(vk_left));
ver = (keyboard_check(ord("S")) || keyboard_check(vk_down))-(keyboard_check(ord("W")) || keyboard_check(vk_up));

hsp = lerp(hsp, hor*moveSpeed, 0.5);
vsp = lerp(vsp, ver*moveSpeed, 0.5);

//Round to 0
if (abs(hsp)<0.5){
	hsp = 0;
}
if (abs(vsp)<0.5){
	vsp = 0;
}

hsp += round(hspBoost);
vsp += round(vspBoost);

//Collisions
if (place_meeting(x+hsp, y, oCollision)){
    while(!place_meeting(x+sign(hsp), y, oCollision)){
		x += sign(hsp);	
    }

    hsp = 0;
}

if (place_meeting(x, y+vsp, oCollision)){
    while(!place_meeting(x, y+sign(vsp), oCollision)){
		y += sign(vsp);	
    }

    vsp = 0;
}

if (place_meeting(x + hsp, y + vsp, oCollision)){
	hsp = 0;
}

x = round(x + hsp);
y = round(y + vsp);
#endregion

#region Using item
if (global.selectedItem>=0){
	var selectedArr = global.inv[| global.selectedItem];
	var selItem = selectedArr[pr.item];

	if (mouseLMB>=global.items[selItem, stat.mousestate] && cooldown==0){
		var itemSprite = global.items[selItem, stat.sprite];
		var dist = sprite_get_width(itemSprite)/2;
		var dir = mouseDir;
		var reloadT = global.items[selItem, stat.reloadTime];
		
		var success = true;
	
		switch(selItem){
			case item.pistol: case item.assault:
				//Rotation
				//itemAngleRaw = -20;
			
				//if (abs(angle_difference(mouseDir, 0))<=90){
				//	itemAngleRaw *= -1;
				//}
				
				//Set scale
				itemScale = itemBig;
			
				//Spawn bullet
				var bullet = instance_create_layer(x + lengthdir_x(dist, dir), y + lengthdir_y(dist, dir), "Instances", oBullet);
				bullet.spd = 40;
				bullet.dir = mouseDir;
				bullet.life = 10;
			
				//Move back
				hspBoost = lengthdir_x(1, dir-180);
				vspBoost = lengthdir_y(1, dir-180);
				
				//Sound
				audio_play_sound(global.items[selItem, stat.sound], 8, false);
				if (selItem==item.pistol) alarm[0] = reloadT/2;
			break;
		
			case item.shotgun:
				//Set scale
				itemScale = itemBig;
			
				//Spawn bullet
				repeat(global.shotgunShots){
					var bullet = instance_create_layer(x + lengthdir_x(dist, dir), y + lengthdir_y(dist, dir), "Instances", oBullet);
					bullet.spd = 40;
					bullet.dir = mouseDir + random_range(-global.shotgunRange, global.shotgunRange);
					bullet.life = 10;
				}
			
				//Move back
				hspBoost = lengthdir_x(1, dir-180);
				vspBoost = lengthdir_y(1, dir-180);
				
				//Sound
				audio_play_sound(global.items[selItem, stat.sound], 8, false);
				alarm[0] = reloadT/2;
			break;
		
			case item.grenade:
				//Set scale
				itemScale = itemBig;
			
				//Spawn grenade
				var bomb = instance_create_layer(x + lengthdir_x(dist, dir), bbox_bottom + lengthdir_y(dist, dir), "Instances", oGrenade);
				bomb.spd = 4;
				bomb.dir = mouseDir;
				bomb.z = y - bbox_bottom;
				bomb.grav = -2;
			
				//Move back
				hspBoost = lengthdir_x(1, dir-180);
				vspBoost = lengthdir_y(1, dir-180);
				
				//Sound
				audio_play_sound(global.items[selItem, stat.sound], 8, false);
				//alarm[0] = reloadT/2;
			break;
		
			//Axes
			case item.axe: case item.pickaxe:
				//Move pickaxe
				itemAngleRaw = 120;
			
				if (abs(angle_difference(mouseDir, 0))<=90){
					itemAngleRaw *= -1;
				}
			
				//Axe cuts trees and breaks wood blocks
				if (selItem==item.axe){
					//Tree
					var treeCol = collision_circle(x + lengthdir_x(dist, dir+itemAngleRaw/2), y + lengthdir_y(dist, dir+itemAngleRaw/2), dist, oTree, false, false);
					//Block
					if (treeCol==noone){
						treeCol = collision_circle(x + lengthdir_x(dist, dir+itemAngleRaw/2), y + lengthdir_y(dist, dir+itemAngleRaw/2), dist, oBlock, false, false);
						if (treeCol && treeCol.blockID!=item.woodblock32){
							treeCol = noone;
						}
					}
				
					if (treeCol){
						treeCol.hp--;
					}
					else{
						success = false;
					}
				}
			
				//Pickaxe mines metal and breaks metal blocks
				else if (selItem==item.pickaxe){
					var mineCol = collision_circle(x + lengthdir_x(dist, dir+itemAngleRaw/2), y + lengthdir_y(dist, dir+itemAngleRaw/2), dist, oMetalMine, false, false);
					//Block
					if (mineCol==noone){
						mineCol = collision_circle(x + lengthdir_x(dist, dir+itemAngleRaw/2), y + lengthdir_y(dist, dir+itemAngleRaw/2), dist, oBlock, false, false);
						if (mineCol && mineCol.blockID!=item.metalblock32){
							mineCol = noone;
						}
					}
				
					if (mineCol){
						mineCol.hp--;
					}
					else{
						success = false;
					}
				}
				
				//Sound
				audio_play_sound(global.items[selItem, stat.sound], 8, false);
				
				if (success) audio_play_sound(selItem==item.axe ? sndWoodImpact : sndMetalImpact, 8, false);
			break;
		
			case item.woodblock32: case item.metalblock32:
				//Data
				var size = global.items[selItem, stat.size];
		
				//Location to place
				var bX = (mouse_x div 32) * size;
				var bY = (mouse_y div 32) * size;
			
				//Place
				if (!collision_rectangle(bX, bY+9, bX+size-1, bY+size+8, oCollision, 0, 0) &&
					!collision_rectangle(bX, bY+9, bX+size-1, bY+size+8, oEnemy, 0, 0) &&
					!collision_rectangle(bX, bY+9, bX+size-1, bY+size+8, oPlayer, 0, 0)){
					var blockInst = instance_create_layer(bX, bY, "Instances", oBlock);
					blockInst.blockID = selItem;
					blockInst.hp = global.items[selItem, stat.hp];
				}
				else{
					success = false;
				}
			break;
			
			case item.healthpotion:
				if (hp<100) hp += global.items[selItem, stat.hp];
				else success = false;
				
				//Particles
				if (success){
					repeat(10){
						var dist = irandom_range(2, 16);
						var dir = random(360);
						
						part_particles_create(global.partSys, 
							x + lengthdir_x(dist, dir),
							y + lengthdir_y(dist, dir),
							global.healthPart, 1);
					}
					
					audio_play_sound(sndHealth, 8, false);
				}
			break;
		}
		
		if (success){
			//Reduce health
			addInv(selItem, 0, 0, -1);
	
			//Set cooldown
			cooldown = reloadT;
		}
	}
}

//Cooldown
cooldown -= cooldown>0;
#endregion

}

else{
	hsp = 0;
	vsp = 0;
}

#region Misc.
//Reset item properties
itemScale = lerp(itemScale, 1, 0.2);
itemAngleRaw += angle_difference(0, itemAngleRaw)*0.1;
itemAngle += angle_difference(itemAngleRaw, itemAngle)*0.5;

//Boost
hspBoost = lerp(hspBoost, 0, 0.1);
vspBoost = lerp(vspBoost, 0, 0.1);

//Die
if (hp<=0){
	dead++;
}

//Dead
if (dead>room_speed){
	global.dead = true;
	
	//High score
	if (!file_exists("hiscore")){
		var map = ds_map_create();
		
		map[? "hiscore" + string(global.hardMode)] = global.points;
		map[? "hiscore" + string(!global.hardMode)] = 0;
		
		ds_map_secure_save(map, "hiscore");
		ds_map_destroy(map);
	}
	else{
		var map = ds_map_secure_load("hiscore");
		
		var hiscore = map[? "hiscore" + string(global.hardMode)];
		
		if (global.points > hiscore) map[? "hiscore" + string(global.hardMode)] = global.points;
		
		ds_map_secure_save(map, "hiscore");
		ds_map_destroy(map);
	}
}

//Sprites
if (!dead) image_xscale = -1 + (abs(angle_difference(mouseDir, 0))<=90)*2;

if (dead){
	sprite_index = sPlayerDead;
}
else if (hurtTime){
	sprite_index = sPlayerHurt;
	if (hsp!=0) image_xscale = -sign(hsp);
}
else if (abs(hsp) || abs(vsp)){
	sprite_index = sPlayerWalk;
	
	//Walking direction
	if (sign(hsp)==image_xscale || hsp==0){
		image_speed = 1;
	}
	else{
		image_speed = -1;
	}
}
else{
	sprite_index = sPlayerIdle;
}

mask_index = sPlayerIdle;
#endregion