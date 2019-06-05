/// @function getTile
/// @description 
/// @arg x
/// @arg y

//Args
var _x = argument[0];
var _y = argument[1];

var tilemap = layer_tilemap_get_id("Tiles_Background");

//Get
var Tile = tilemap_get_at_pixel(tilemap, _x, _y);

if (Tile==10){
	return tile.grass;
}
else{
	return tile.dirt;
}