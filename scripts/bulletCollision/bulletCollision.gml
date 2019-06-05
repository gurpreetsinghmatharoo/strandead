/// @function bulletCollision
/// @description Description of the function.
/// @arg [x]
/// @arg [y]

//Move
var xp = x;
var yp = y;
x = argument_count > 0 ? argument[0] : xp;
y = argument_count > 1 ? argument[1] : yp;

//Bullet
with(oBullet){
	if (collision_line(x1, y1, x2, y2, other, false, false) && active){
		return id;
	}
}

//Move back
x = xp;
y = yp;

return false;