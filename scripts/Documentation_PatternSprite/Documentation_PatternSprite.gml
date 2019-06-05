/*
******************
Patterned Sprite
    -by matharoo
******************

Using this asset, you can draw a sprite in a pattern.

**FUNCTIONS**

-----------------------------------------------------
draw_sprite_pattern(spr, subimg, x, y, pattern);

This is just like the draw_sprite function but with
an extra argument, for the pattern sprite. The sprite
will simply be drawn with the pattern
sprite specified.
-----------------------------------------------------

-----------------------------------------------------
draw_sprite_ext_pattern(spr, subimg, x, y, pattern, 
                 xscale, yscale, rot, colour, alpha);

This is the draw_sprite_ext version of the function
above, with transforming arguments for the sprite to be drawn.
-----------------------------------------------------

-----------------------------------------------------
draw_sprite_pattern_ext(spr, subimg, x, y, pattern, 
    pattern_subimg, pattern_xoffset, pattern_yoffset, 
    pattern_xscale, pattern_yscale);

This function allows transforming arguments for the
pattern sprite.
-----------------------------------------------------

-----------------------------------------------------
draw_sprite_ext_pattern_ext(spr, subimg, x, y, pattern, 
    xscale, yscale, rot, colour, alpha, pattern_subimg, 
    pattern_xoffset, pattern_yoffset, pattern_xscale, 
    pattern_yscale);

This function is a mix of draw_sprite_ext_pattern
and draw_sprite_pattern_ext. It allows transforming
arguments for both the main sprite and the pattern
sprite.
-----------------------------------------------------

**HOW TO CREATE PATTERNS**

The asset comes with 3 premade patterns. You can create custom ones as well!
The pattern basically functions as an alpha mask; so the sprite will appear
where the alpha is 1, and disappear where it is 0.

**IMPORTANT**

Go to Tools > Texture Groups and make sure "Automatically Crop" is DISABLED.

*/
