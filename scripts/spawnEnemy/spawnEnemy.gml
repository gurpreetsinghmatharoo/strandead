/// @function spawnEnemy
/// @description Description of the function.
/// @arg x
/// @arg y
/// @arg type

//Args
var _x = argument[0];
var _y = argument[1];
var _type = argument[2];

//Function
var inst = instance_create_layer(_x, _y, "Instances", oEnemy);
inst.enemyID = _type;
inst.hp = global.enemies[_type, stat.hp];
inst.moveSpeed = global.enemies[_type, stat.spd];
inst.attack = global.enemies[_type, stat.attack];

return inst;