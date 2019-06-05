/// @description  draw_sprite_pattern(sprite, subimg, x, y, pattern);
/// @function  draw_sprite_pattern
/// @param sprite
/// @param  subimg
/// @param  x
/// @param  y
/// @param  pattern
//all args: spr, sub, x, y, pat, xsc, ysc, ang, col, alpha, psub, px, py, pxs, pys
//arg
var spr = argument[0];
var sub = argument[1];
var X = argument[2];
var Y = argument[3];
var pSpr = argument[4];

//extra args
var xsc = 1, ysc = 1, ang = 0, col = c_white, alpha = 1;

if (argument_count>5){
    xsc = argument[5];
    ysc = argument[6];
    ang = argument[7];
    col = argument[8];
    alpha = argument[9];
}

//pat args
var pSub = 0, pX = 0, pY = 0, pXs = 1, pYs = 1, pCol = c_white, pAlpha = 1;

if (argument_count>10){
    pSub = argument[10];
    pX = argument[11];
    pY = argument[12];
    pXs = argument[13];
    pYs = argument[14];
}

//offset
var sprXoff, sprYoff;
sprXoff = abs(sprite_get_xoffset(spr)*xsc);
sprYoff = abs(sprite_get_yoffset(spr)*ysc);

//surf size
var surfW = abs(sprite_get_width(spr)*xsc);
var surfH = abs(sprite_get_height(spr)*ysc);

//quit if 0 size
if (round(surfW)==0 || round(surfH)==0){
    return 0;
}

//spr pos if negative size
var sprX = 0;
var sprY = 0;

if (xsc<0){
    sprX = surfW;
}
if (ysc<0){
    sprY = surfH;
}

//surface
var surf = surface_create(surfW, surfH);

surface_set_target(surf);
draw_clear_alpha(0, 0);

//draw pattern
draw_sprite_tiled_ext(pSpr, pSub, pX, pY, abs(pXs), abs(pYs), pCol, pAlpha);

//draw sprite
gpu_set_blendmode_ext(bm_dest_alpha, bm_zero);
draw_sprite_ext(spr, sub, sprX+(sprXoff*sign(xsc)), sprY+(sprYoff*sign(ysc)), xsc, ysc, ang, col, alpha);
gpu_set_blendmode(bm_normal);

//reset
surface_reset_target();

//draw surface
draw_surface(surf, X-sprXoff, Y-sprYoff);
surface_free(surf);
