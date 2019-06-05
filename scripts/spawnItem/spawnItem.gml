/// @function spawnItem
/// @description Description of the function.
/// @arg x
/// @arg y
/// @arg item
/// @arg type

//Args
var _x = argument[0];
var _y = argument[1];
var _item = argument[2];
var _type = argument[3];

//Function
var inst = instance_create_layer(_x, _y, "Instances", oItem);
inst.itemID = _item;
inst.itemType = _type;
inst.z = 20;

//Index & rotation of leaf
if (_type==type.mat && _item==mat.leaf){
	inst.image_index = irandom(sprite_get_number(sLeaf)-1);
	inst.image_angle = random(360);
}