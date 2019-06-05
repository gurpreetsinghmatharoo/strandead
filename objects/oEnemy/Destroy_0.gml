/// @description 
//Items
repeat(irandom_range(1, 4)){
	spawnItem(x, bbox_bottom, choose(mat.gunpowder, mat.metal, mat.wood), type.mat);
}

//Poof
repeat(4){
	var xx = x + irandom_range(-8, 8);
	var yy = irandom_range(bbox_top+4, bbox_bottom-4);
	
	part_particles_create(global.partSys, xx, yy, global.pinkPoof, 1);
}

//Points
global.points += attack;