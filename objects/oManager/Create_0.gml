/// @description 
//show_debug_overlay(true);

#region Inventory
//Inventory properties
enum pr{
	item,
	count,
	hp,
	craftable
}

//Item types
enum type{
	item,
	mat
}

//Item properties
enum stat{
	sprite,
	recipe,
	hp,
	reloadTime,
	spd,
	attack,
	name,
	size,
	mousestate,
	sound
}

#region Item stats
//Items
enum item{
	pistol,
	shotgun,
	assault,
	grenade,
	
	axe,
	pickaxe,
	
	//only food from here on!
	healthpotion,
	
	//only blocks from here on!
	woodblock32,
	metalblock32
}

//Pistol
global.items[item.pistol, stat.sprite] = sPistol;
global.items[item.pistol, stat.recipe] = [[mat.metal, 4], [mat.gunpowder, 2]];
global.items[item.pistol, stat.hp] = 50;
global.items[item.pistol, stat.reloadTime] = 50;
global.items[item.pistol, stat.name] = "Pistol";
global.items[item.pistol, stat.mousestate] = 2;
global.items[item.pistol, stat.sound] = sndPistol;

//Shotgun
global.items[item.shotgun, stat.sprite] = sShotgun;
global.items[item.shotgun, stat.recipe] = [[mat.metal, 12], [mat.gunpowder, 6]];
global.items[item.shotgun, stat.hp] = 30;
global.items[item.shotgun, stat.reloadTime] = 50;
global.items[item.shotgun, stat.name] = "Shotgun";
global.items[item.shotgun, stat.mousestate] = 2;
global.items[item.shotgun, stat.sound] = sndShotgun;
global.shotgunRange = 20;
global.shotgunShots = 3;

//Assault
global.items[item.assault, stat.sprite] = sAssault;
global.items[item.assault, stat.recipe] = [[mat.metal, 16], [mat.gunpowder, 10]];
global.items[item.assault, stat.hp] = 60;
global.items[item.assault, stat.reloadTime] = 10;
global.items[item.assault, stat.name] = "Assault Rifle";
global.items[item.assault, stat.mousestate] = 1;
global.items[item.assault, stat.sound] = sndRifle;

//Grenade Launcher
global.items[item.grenade, stat.sprite] = sGrenadeL;
global.items[item.grenade, stat.recipe] = [[mat.metal, 10], [mat.gunpowder, 20]];
global.items[item.grenade, stat.hp] = 16;
global.items[item.grenade, stat.reloadTime] = 30;
global.items[item.grenade, stat.name] = "Grenade Launcher";
global.items[item.grenade, stat.mousestate] = 2;
global.items[item.grenade, stat.sound] = sndGrenade;

//Axe
global.items[item.axe, stat.sprite] = sAxe;
global.items[item.axe, stat.recipe] = [[mat.wood, 4], [mat.metal, 2]];
global.items[item.axe, stat.hp] = 50;
global.items[item.axe, stat.reloadTime] = 20;
global.items[item.axe, stat.name] = "Axe";
global.items[item.axe, stat.mousestate] = 2;
global.items[item.axe, stat.sound] = sndAxeSwing;

//Pickaxe
global.items[item.pickaxe, stat.sprite] = sPickaxe;
global.items[item.pickaxe, stat.recipe] = [[mat.wood, 6], [mat.metal, 3]];
global.items[item.pickaxe, stat.hp] = 50;
global.items[item.pickaxe, stat.reloadTime] = 20;
global.items[item.pickaxe, stat.name] = "Pickaxe";
global.items[item.pickaxe, stat.mousestate] = 2;
global.items[item.pickaxe, stat.sound] = sndAxeSwing;

//Wood Block 32
global.items[item.woodblock32, stat.sprite] = sWoodBlock32;
global.items[item.woodblock32, stat.recipe] = [[mat.wood, 4]];
global.items[item.woodblock32, stat.hp] = 5;
global.items[item.woodblock32, stat.reloadTime] = 20;
global.items[item.woodblock32, stat.name] = "Wood Block";
global.items[item.woodblock32, stat.size] = 32;
global.items[item.woodblock32, stat.mousestate] = 2;

//Metal Block 32
global.items[item.metalblock32, stat.sprite] = sMetalBlock32;
global.items[item.metalblock32, stat.recipe] = [[mat.metal, 4]];
global.items[item.metalblock32, stat.hp] = 8;
global.items[item.metalblock32, stat.reloadTime] = 20;
global.items[item.metalblock32, stat.name] = "Metal Block";
global.items[item.metalblock32, stat.size] = 32;
global.items[item.metalblock32, stat.mousestate] = 2;

//Health Potion
global.items[item.healthpotion, stat.sprite] = sHealthPotion;
global.items[item.healthpotion, stat.recipe] = [[mat.leaf, 20]];
global.items[item.healthpotion, stat.hp] = 10;
global.items[item.healthpotion, stat.reloadTime] = 40;
global.items[item.healthpotion, stat.name] = "Health Potion";
global.items[item.healthpotion, stat.mousestate] = 2;

#endregion

#region Materials
enum mat{
	metal,
	gunpowder,
	wood,
	leaf
}

//Metal
global.materials[mat.metal, stat.sprite] = sMetal;
global.materials[mat.metal, stat.hp] = 1;
global.materials[mat.metal, stat.name] = "Metal";
//Gunpowder
global.materials[mat.gunpowder, stat.sprite] = sGunpowder;
global.materials[mat.gunpowder, stat.hp] = 1;
global.materials[mat.gunpowder, stat.name] = "Gunpowder";
//Wood
global.materials[mat.wood, stat.sprite] = sWood;
global.materials[mat.wood, stat.hp] = 1;
global.materials[mat.wood, stat.name] = "Wood";
//Leaf
global.materials[mat.leaf, stat.sprite] = sLeaf;
global.materials[mat.leaf, stat.hp] = 1;
global.materials[mat.leaf, stat.name] = "Leaf";
#endregion

//Inventory
global.inv = ds_list_create();
global.materialInv = ds_list_create();
global.craftInv = ds_list_create();
global.selectedItem = -1;

//Starting items
addInv(item.axe);
addInv(item.pistol);
addInv(mat.metal, 8, true);
addInv(mat.wood, 4, true);
#endregion

#region Enemies
enum en{
	rida,
	kami
}
#macro ENEMIES 2

global.enemies[en.rida, stat.sprite] = sRida;
global.enemies[en.rida, stat.hp] = 3;
global.enemies[en.rida, stat.spd] = 1;
global.enemies[en.rida, stat.attack] = 20;

global.enemies[en.kami, stat.sprite] = sKami;
global.enemies[en.kami, stat.hp] = 4;
global.enemies[en.kami, stat.spd] = 1;
global.enemies[en.kami, stat.attack] = 25;

//Data
enemyCD = 0;
enemyCooldown = 1300;

#endregion

#region Camera
view_enabled = true;
view_visible[0] = true;

var width = CAMW, height = CAMH, scale = SCALE;

var cam = camera_create_view(0, 0, width, height, 0, -1, -1, -1, width/2, height/2);
view_set_camera(0, cam);

window_set_size(width*scale, height*scale);
surface_resize(application_surface, width*scale, height*scale);
display_set_gui_size(width, height);

//Shake
global.shake = 0;
#endregion

#region Create GUI
instance_create_layer(8, 8, "GUI", oMenuButton);
instance_create_layer(0, 0, "GUI", oInvQuickMenu);
#endregion

#region GUI
defFont = ftGUI;
draw_set_font(defFont);

//Health
hpShow = 100;
#endregion

#region Vars
//Game
global.points = 0;
global.dead = false;

//Developer Mode
devMode = 0;
//addInv(item.pickaxe);
//addInv(item.shotgun);
//addInv(item.assault);
//addInv(item.grenade);
//addInv(item.woodblock32, 20);
//addInv(item.metalblock32, 20);

if (devMode) show_debug_overlay(1);

//Pausing
global.pause = false;

//GUI
global.mouseX = 0;
global.mouseY = 0;

//Resources
maxTrees = instance_number(oTree);
maxMines = instance_number(oMetalMine);

timerTrees = 1000;
timerMines = 1000;

//Tile types
enum tile{
	grass,
	dirt
}
#endregion

#region Misc
//Shadows
instance_create_layer(0, 0, "Shadows", oShadows);
#endregion

#region Audio
//#macro A 0
//#macro B 1
//#macro C 2
//#macro D 3

//Audio groups
audio_group_load(G1);
audio_group_load(G2);
audio_group_load(G3);
audio_group_load(G4);
audio_group_load(SFX);

//Vars
track = audio_play_sound(Music_1, 8, true);
//global.intLevel = 0;
//global.audioPiece = choose("A", "B", "C", "D");

//audGrp[0] = G1;
////audGrp[1] = G2;
////audGrp[2] = G3;
////audGrp[3] = G4;
//tPrev = -1;

//for(var i=0; i<array_length_1d(audGrp); i++){
//	//Play
//	var aud = asset_get_index("Music_" + string(i+1));
//	track[i] = audio_play_sound(aud, 8, false);
	
//	//Mute
//	if (i!=global.intLevel){
//		audio_group_set_gain(audGrp[i], 0, 0);
//	}
//	//else{
//	//	global.track = aInst;
//	//}

//	playNew[i] = true;
//}

audio_group_set_gain(SFX, 0.4, 0);
#endregion

#region Hard Mode
global.hardMode = instance_exists(oHard);

if (global.hardMode){
	//Make enemies more frequent
	enemyCooldown = 500;
	
	instance_destroy(oHard);
}
#endregion

#region Load
if (instance_exists(oLoad)){
	//Map
	var map = ds_map_secure_load("jcsave");
	
	//Player
	oPlayer.x = map[? "playerX"];
	oPlayer.y = map[? "playerY"];
	oPlayer.hp = map[? "playerHP"];
	
	//Inventory
	global.selectedItem = map[? "selectedItem"];
	ds_list_read(global.inv, map[? "inv"]);
	ds_list_read(global.materialInv, map[? "materialInv"]);
	
	//Main
	enemyCD = map[? "enemyCD"];
	enemyCooldown = map[? "enemyCooldown"];
	global.points = map[? "points"];
	global.hardMode = map[? "hardMode"];
	
	//Blocks
	for(var i=0; i<map[? "blockCount"]; i++){
		var xx = map[? "block" + string(i) + "x"];
		var yy = map[? "block" + string(i) + "y"];
		var hp = map[? "block" + string(i) + "hp"];
		var blockID = map[? "block" + string(i) + "blockID"];
		
		var inst = instance_create_layer(xx, yy, "Instances", oBlock);
		inst.blockID = blockID;
		inst.hp = hp;
	}
	
	//Trees
	instance_destroy(oTree, false);
	
	for(var i=0; i<map[? "treeCount"]; i++){
		var xx = map[? "tree" + string(i) + "x"];
		var yy = map[? "tree" + string(i) + "y"];
		var hp = map[? "tree" + string(i) + "hp"];
		var upperRot = map[? "tree" + string(i) + "upperRot"];
		
		var inst = instance_create_layer(xx, yy, "Instances", oTree);
		inst.upperRot = upperRot;
		inst.hp = hp;
	}
	
	//Trees
	instance_destroy(oMetalMine, false);
	
	for(var i=0; i<map[? "mineCount"]; i++){
		var xx = map[? "mine" + string(i) + "x"];
		var yy = map[? "mine" + string(i) + "y"];
		var hp = map[? "mine" + string(i) + "hp"];
		
		var inst = instance_create_layer(xx, yy, "Mining", oMetalMine);
		inst.hp = hp;
	}
	
	//Enemies
	for(var i=0; i<map[? "enemyCount"]; i++){
		var xx = map[? "enemy" + string(i) + "x"];
		var yy = map[? "enemy" + string(i) + "y"];
		var hp = map[? "enemy" + string(i) + "hp"];
		var enemyID = map[? "enemy" + string(i) + "enemyID"];
		
		var inst = spawnEnemy(xx, yy, enemyID);
		inst.hp = hp;
	}
	
	//Items
	for(var i=0; i<map[? "itemCount"]; i++){
		var xx = map[? "item" + string(i) + "x"];
		var yy = map[? "item" + string(i) + "y"];
		var itemType = map[? "item" + string(i) + "itemType"];
		var itemID = map[? "item" + string(i) + "itemID"];
		
		var inst = spawnItem(xx, yy, itemID, itemType);
	}
	
	//Destroy
	instance_destroy(oLoad);
	ds_map_destroy(map);
	
	//First time
	//global.firstTime = false;
}
else{
	//global.firstTime = true;
}

//First time vars
global.firstTime = !file_exists("jcsave");
global.guiHelp = 3;

//Save file
global.reset = false;
#endregion

#region Particles
global.partSys = part_system_create();
part_system_depth(global.partSys, -10000);

//Brown poof
global.brownPoof = part_type_create();
part_type_sprite(global.brownPoof, sBrownPoof, 0, 0, 0);
part_type_life(global.brownPoof, 30, 50);
part_type_size(global.brownPoof, 0.5, 0.5, 0.05, 0);
part_type_orientation(global.brownPoof, 0, 360, 0.1, 0, 0);
part_type_alpha3(global.brownPoof, 1, 1, 0);

//Pink poof
global.pinkPoof = part_type_create();
part_type_sprite(global.pinkPoof, sBrownPoof1, 0, 0, 0);
part_type_life(global.pinkPoof, 30, 50);
part_type_size(global.pinkPoof, 0.5, 0.5, 0.05, 0);
part_type_orientation(global.pinkPoof, 0, 360, 0.1, 0, 0);
part_type_alpha3(global.pinkPoof, 1, 1, 0);

//Health
global.healthPart = part_type_create();
part_type_sprite(global.healthPart, sHealthPart, 0, 0, 0);
part_type_life(global.healthPart, 30, 50);
part_type_direction(global.healthPart, 90, 90, 0, 0);
part_type_size(global.healthPart, 2, 2, -0.05, 0);
part_type_speed(global.healthPart, 1, 2, -0.05, 0);
part_type_alpha3(global.healthPart, 0, 1, 0);

//Test
//addInv(item.healthpotion, 10);
//oPlayer.hp = 10;
#endregion