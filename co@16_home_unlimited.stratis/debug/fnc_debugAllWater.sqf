/*
 * Checks all Location Area placed on Arma 3 (spawn locations) to see 
 * 	whether or not they are bad spawns (spawn in water only on certain 
 * 	occassions). If the spawns are bad, the names of the spawn locations 
 * 	will be copied to your clipboard so you can paste it to any text 
 * 	editor to see which spawns are bad.
 * 
 * SINGLEPLAYER ONLY FOR TESTING PURPOSES
 */
 
// [] call Debug_fnc_debugAllWater;

_locationArray = allMissionObjects "LocationArea_F";
_badLocations = "";

if (!isMultiplayer) then 
{
	{
	    if ([_x] call Debug_fnc_debugWater) then
	    {
	        _badLocations = _badLocations + str(_x) + toString [13,10];
	    };
	} forEach _locationArray;
};

hint _badLocations;
copyToClipboard _badLocations;