/// @description 
//Poof particle
part_particles_create(global.partSys, x, y, global.brownPoof, 1);

repeat(8){
	part_particles_create(global.partSys, x - irandom(playerXSign*64), y + irandom_range(-4, 4), global.brownPoof, 1);
}

//Wood
repeat(irandom_range(1, 3))
	spawnItem(x - irandom(playerXSign*32), bbox_bottom + irandom_range(-4, 4), mat.wood, type.mat);
	
//Leaves
repeat(irandom_range(5, 10))
	spawnItem(x - playerXSign*64 + irandom_range(-16, 16), y + irandom_range(-4, 4), mat.leaf, type.mat);