/// @function draw_textbox
/// @description Description of the function.
/// @arg x
/// @arg y
/// @arg text
/// @arg w

//Args
var _x = argument[0];
var _y = argument[1];
var _text = argument[2];
var _w = argument[3];

var _marg = 8;

//Draw
draw_9slice(_x - _marg, _y - _marg, string_width_ext(_text, -1, _w) + _marg*2, string_height_ext(_text, -1, _w) + _marg*2, sMessage, 0);

draw_text_ext(_x, _y, _text, -1, _w);