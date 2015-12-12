/*
 * Use to check whether for each distance parameter, units can be 
 * 	spawn at those location. If surfaceIsWater surrounding all 
 * 	directions of those spawn at X distance, then it means that 
 * 	units will not be able to spawn there and the spawn location
 * 	is buggy and should be remove.
 * The name of the location you choose to test will appear if 
 * 	it'll be surrounded by all water.
 * 
 * SINGLEPLAYER ONLY FOR TESTING PURPOSES
 */

// [location] call Debug_fnc_debugWater;

_location = _this select 0;

_locX = (getPosASL _location) select 0;
_locY = (getPosASL _location) select 1;

_locationInWater = false;

if (!isMultiplayer) then 
{
	_dist0 = 50;
	_dist1 = 100;
	_dist2 = 150;
	_dist3 = 200;
	_dist4 = 300;
	_dist5 = 400;
	_dist6 = 500;
	_dist7 = 600;
	_dist8 = 700;
	_dist9 = 800; 
	
	{
		_N = surfaceIsWater [_locX, _locY + _x + 50];
		_NE = surfaceIsWater [_locX + _x + 50, _locY + _x + 50];
		_E = surfaceIsWater [_locX + _x + 50, _locY];
		_SE = surfaceIsWater [_locX + _x + 50, _locY - _x - 50];
		_S = surfaceIsWater [_locX, _locY - _x - 50];
		_SW = surfaceIsWater [_locX - _x - 50, _locY - _x - 50];
		_W = surfaceIsWater [_locX - _x - 50, _locY];
		_NW = surfaceIsWater [_locX - _x - 50, _locY + _x + 50];
	    
	    if (_N && _NE && _E && _SE && _S && _SW && _W && _NW) exitWith 
	    {
	    	hint (str(_location));
	        _locationInWater = true;
            _locationInWater
	    };
	    
	} forEach [_dist0,_dist1,_dist2,_dist3,_dist4,_dist5,_dist6,_dist7,_dist8,_dist9];
    
    _locationInWater
};