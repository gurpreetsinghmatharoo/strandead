/// @function addInv
/// @description Description of the function.
/// @arg item
/// @arg [addAmount]
/// @arg [useMaterialInventory]
/// @arg [addHealth]

//Args
var _item = argument[0];
var _add = argument_count > 1 ? argument[1] : 1;
var _mat = argument_count > 2 ? argument[2] : false;
var _health = argument_count > 3 ? argument[3] : 0;

//List to use
var _list = _mat ? global.materialInv : global.inv;

//Data
var statArr = _mat ? global.materials : global.items;
var itemHealth = statArr[_item, pr.hp];

//Function
var itemPos = itemPosition(_item, 1, _mat);

if (itemPos<0){
	var arr = [_item, _add, itemHealth];

	ds_list_add(_list, arr);
}
else{
	var arr = _list[| itemPos];
	
	arr[@ pr.count] += _add;
	arr[@ pr.hp] += _health;
	
	//Delete blocks
	if (_health<0 && _item>=item.healthpotion){
		arr[@ pr.hp] = 0;
	}
	
	//Health
	if (arr[pr.hp]<=0){
		arr[@ pr.count]--;
		arr[@ pr.hp] = itemHealth;
	}
	
	//Count
	if (arr[pr.count]<=0){
		ds_list_delete(_list, itemPos);
		
		//Selected?
		if (!_mat && global.selectedItem==itemPos){
			global.selectedItem = -1;
		}
	}
}