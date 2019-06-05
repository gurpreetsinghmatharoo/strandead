/// @function setIntensity
/// @description Description of the function.
/// @arg level

global.intLevel = argument[0];

for(var i=0; i<array_length_1d(oManager.audGrp); i++){
	//Fade
	if (i!=global.intLevel){
		audio_group_set_gain(oManager.audGrp[i], 0, 2000);
	}
	else{
		audio_group_set_gain(oManager.audGrp[i], 1, 2000);
	}
}