/// @description 
global.menuSurf = surface_create(CAMW*SCALE, CAMH*SCALE);

surface_copy(global.menuSurf, 0, 0, application_surface);

global.menuA = 1;