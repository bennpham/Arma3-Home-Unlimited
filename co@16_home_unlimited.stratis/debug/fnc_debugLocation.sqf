/*
 * Use to spawn units in a certain spawn location to replicate 
 * 	how a player would spawn. This is use alongside a camera 
 * 	to see whether or not the units spawn in the right places.
 * If the units are leaking through the walls or are not inside 
 * 	buildings where they should be, then something is wrong.
 * 
 * SINGLEPLAYER ONLY FOR TESTING PURPOSES
 */

// [location] call Debug_fnc_debugLocation;

_location = _this select 0;

_locX = (getPosASL _location) select 0;
_locY = (getPosASL _location) select 1;
_locZ = (getPosASL _location) select 2;

if (!isMultiplayer) then {
    _unit1 = "B_Protagonist_VR_F" createVehicle [_locX + 0, _locY + 0, _locZ];
    _unit2 = "B_Protagonist_VR_F" createVehicle [_locX + 1, _locY + 0, _locZ];
    _unit3 = "B_Protagonist_VR_F" createVehicle [_locX + 2, _locY + 0, _locZ];
    _unit4 = "B_Protagonist_VR_F" createVehicle [_locX + 3, _locY + 0, _locZ];
    _unit5 = "B_Protagonist_VR_F" createVehicle [_locX + 0, _locY + 1, _locZ];
    _unit6 = "B_Protagonist_VR_F" createVehicle [_locX + 1, _locY + 1, _locZ];
    _unit7 = "B_Protagonist_VR_F" createVehicle [_locX + 2, _locY + 1, _locZ];
    _unit8 = "B_Protagonist_VR_F" createVehicle [_locX + 3, _locY + 1, _locZ];
    _unit9 = "B_Protagonist_VR_F" createVehicle [_locX + 0, _locY + 2, _locZ];
    _unit10 = "B_Protagonist_VR_F" createVehicle [_locX + 1, _locY + 2, _locZ];
    _unit11 = "B_Protagonist_VR_F" createVehicle [_locX + 2, _locY + 2, _locZ];
    _unit12 = "B_Protagonist_VR_F" createVehicle [_locX + 3, _locY + 2, _locZ];
    _unit13 = "B_Protagonist_VR_F" createVehicle [_locX + 0, _locY + 3, _locZ];
    _unit14 = "B_Protagonist_VR_F" createVehicle [_locX + 1, _locY + 3, _locZ];
    _unit15 = "B_Protagonist_VR_F" createVehicle [_locX + 2, _locY + 3, _locZ];
    _unit16 = "B_Protagonist_VR_F" createVehicle [_locX + 3, _locY + 3, _locZ];
    
    _startx = 0; 
    {
		_x setDir getDir _location;
    	_x setPosASL [_locX + _startx, _locY, _locZ];
        _startx = _startx + 1;
    } forEach [_unit1,_unit2,_unit3,_unit4];
    
    _startx = 0; 
    {
		_x setDir getDir _location;
    	_x setPosASL [_locX + _startx, _locY+1, _locZ];
        _startx = _startx + 1;
    } forEach [_unit5,_unit6,_unit7,_unit8];
    
    _startx = 0; 
    {
		_x setDir getDir _location;
    	_x setPosASL [_locX + _startx, _locY+2, _locZ];
        _startx = _startx + 1;
    } forEach [_unit9,_unit10,_unit11,_unit12];
    
    _startx = 0; 
    {
		_x setDir getDir _location;
    	_x setPosASL [_locX + _startx, _locY+3, _locZ];
        _startx = _startx + 1;
    } forEach [_unit13,_unit14,_unit15,_unit16]; 
};