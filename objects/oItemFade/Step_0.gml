/// @description 
sprite_index = global.materials[itemID, stat.sprite];

var dist = point_distance(x, y, tX, tY);

image_alpha = dist/maxDist;

if (dist <= speed){
	instance_destroy();
}