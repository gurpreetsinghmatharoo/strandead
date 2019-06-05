/// @function itemPosition
/// @description Description of the function.
/// @arg item
/// @arg [minimum_count]
/// @arg [useMaterialInventory]

//Args
var _item = argument[0];
var _count = argument_count > 1 ? argument[1] : 1;
var _mat = argument_count > 2 ? argument[2] : false;

//List to use
var _list = _mat ? global.materialInv : global.inv;

//Function
for(var i=0; i<ds_list_size(_list); i++){
	var arr = _list[| i];
	
	if (arr!=undefined && is_array(arr)){
		if (arr[pr.item]==_item && arr[pr.count]>=_count){
			return i;
		}
	}
}

return -1;