/// @function pathfinding
/// @description Description of the function.
/// @arg x
/// @arg y
/// @arg speed
/// @arg collision

//Args
var _x = argument[0];
var _y = argument[1];
var _speed = argument[2];
var _col = argument[3];

//Function
var Hsp, Vsp, Dir;
Dir = point_direction(x, y, _x, _y);

//Collision
for(var d=0; d<360; d+=45){
	Hsp = lengthdir_x(_speed, Dir+d);
	Vsp = lengthdir_y(_speed, Dir+d);
	
	if (!place_meeting(x+Hsp, y+Vsp, _col)){
		dir += angle_difference(Dir+d, dir)/5;
		spd = _speed;
		break;
	}
}