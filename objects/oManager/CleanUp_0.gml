/// @description 
//Stop music
audio_stop_all();

//Exit
if (global.reset || global.dead) exit;

//Save data
var map = ds_map_create();

//Player
map[? "playerX"] = oPlayer.x;
map[? "playerY"] = oPlayer.y;
map[? "playerHP"] = oPlayer.hp;

//Inventory
map[? "selectedItem"] = global.selectedItem;
map[? "inv"] = ds_list_write(global.inv);
map[? "materialInv"] = ds_list_write(global.materialInv);

//Main
map[? "enemyCD"] = enemyCD;
map[? "enemyCooldown"] = enemyCooldown;
map[? "points"] = global.points;
map[? "hardMode"] = global.hardMode;

//Blocks
map[? "blockCount"] = instance_number(oBlock);

for(var i=0; i<map[? "blockCount"]; i++){
	var inst = instance_find(oBlock, i);
	
	map[? "block" + string(i) + "x"] = inst.x;
	map[? "block" + string(i) + "y"] = inst.y;
	map[? "block" + string(i) + "hp"] = inst.hp;
	map[? "block" + string(i) + "blockID"] = inst.blockID;
}

//Trees
map[? "treeCount"] = instance_number(oTree);

for(var i=0; i<map[? "treeCount"]; i++){
	var inst = instance_find(oTree, i);
	
	map[? "tree" + string(i) + "x"] = inst.x;
	map[? "tree" + string(i) + "y"] = inst.y;
	map[? "tree" + string(i) + "hp"] = inst.hp;
	map[? "tree" + string(i) + "upperRot"] = inst.upperRot;
}

//Mines
map[? "mineCount"] = instance_number(oMetalMine);

for(var i=0; i<map[? "mineCount"]; i++){
	var inst = instance_find(oMetalMine, i);
	
	map[? "mine" + string(i) + "x"] = inst.x;
	map[? "mine" + string(i) + "y"] = inst.y;
	map[? "mine" + string(i) + "hp"] = inst.hp;
}

//Enemies
map[? "enemyCount"] = instance_number(oEnemy);

for(var i=0; i<map[? "enemyCount"]; i++){
	var inst = instance_find(oEnemy, i);
	
	map[? "enemy" + string(i) + "x"] = inst.x;
	map[? "enemy" + string(i) + "y"] = inst.y;
	map[? "enemy" + string(i) + "hp"] = inst.hp;
	map[? "enemy" + string(i) + "enemyID"] = inst.enemyID;
}

//Items
map[? "itemCount"] = instance_number(oItem);

for(var i=0; i<map[? "itemCount"]; i++){
	var inst = instance_find(oItem, i);
	
	map[? "item" + string(i) + "x"] = inst.x;
	map[? "item" + string(i) + "y"] = inst.y;
	map[? "item" + string(i) + "itemID"] = inst.itemID;
	map[? "item" + string(i) + "itemType"] = inst.itemType;
}

//Save
ds_map_secure_save(map, "jcsave");
ds_map_destroy(map);