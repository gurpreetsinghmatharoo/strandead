/// @description 
//Move
x2 += lengthdir_x(spd, dir);
y2 += lengthdir_y(spd, dir);

if (time>0){
	x1 += lengthdir_x(spd, dir)/2;
	y1 += lengthdir_y(spd, dir)/2;
}

//Life
time++;
if (time>life){
	instance_destroy();
}