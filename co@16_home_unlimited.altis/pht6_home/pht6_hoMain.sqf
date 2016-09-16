if (isServer) then {
    
	waitUntil { 
		(!( isNil {pht6_parameter_enemyCount} )) AND
		(!( isNil {pht6_parameter_startDistance} )) AND 
    	(!( isNil {pht6_parameter_enemySkill} )) AND 
        (!( isNil {pht6_parameter_spawnType} )) AND 
        (!( isNil {pht6_parameter_spawnRange} ))
	}; 
    
    
    // INT VALUE representing spawnType value where mission maker 
    //		defined spawn locations start
    _MISSIONMAKERSELECTEDSPAWNLOCATIONVALUE = 7;
    _SPAWN_PLAYER_PREDEFINED_VALUE = 4; 
    _STARTPOS_MAX_VALID_DISTANCE = 50; 


/*--- Get Unit names for all playable units ---*/
	_ALLPLAYERUNITS = [];
	{
    	if (side _x == Resistance) then {
           	_ALLPLAYERUNITS pushback _x;
        };
	} forEach allunits; 
    
	
/*--- Prevent rare occasion of players death ---*/
		{_x allowDamage false} forEach _ALLPLAYERUNITS;
        
                
/*--- Initialize Values ---*/

	// All Preplaced Positions
	_locationArray = allMissionObjects "Sign_Sphere10cm_F";
	_randomLocation = _locationArray call bis_fnc_selectRandom; 
    _minSize = 0;
    _maxSize = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");
    _minSizeX = _minSize;
    _minSizeY = _minSize;
    _maxSizeX = _maxSize;
    _maxSizeY = _maxSize;
    
    // Any Random Locations Positions
    _randomCityLocationPos = [];
    switch (pht6_parameter_spawnType) do {
    	case 2: {_randomCityLocationPos = position (nearestLocations [position p1, ["NameCityCapital"], _maxSize] call bis_fnc_selectRandom);};
        case 3: {_randomCityLocationPos = position (nearestLocations [position p1, ["NameCityCapital","NameCity"], _maxSize] call bis_fnc_selectRandom);};
        case 4: {_randomCityLocationPos = position (nearestLocations [position p1, ["NameCityCapital","NameCity","NameVillage"], _maxSize] call bis_fnc_selectRandom);};
        case 5: {_randomCityLocationPos = position (nearestLocations [position p1, ["NameCityCapital","NameCity","NameVillage","NameLocal"], _maxSize] call bis_fnc_selectRandom);};
        case 6: {_randomCityLocationPos = position (nearestLocations [position p1, ["NameMarine"], _maxSize] call bis_fnc_selectRandom);};
		// Fixed Preplaced Positions
		case 8: {_randomLocation = location_abdera;};
		case 9: {_randomLocation = location_agios_dionysios;};
		case 10: {_randomLocation = location_athira;};
		case 11: {_randomLocation = location_athira_factory;};
		case 12: {_randomLocation = location_cap_strigla;};
		case 13: {_randomLocation = location_charkia;};
		case 14: {_randomLocation = location_ghost_hotel_1;};
		case 15: {_randomLocation = location_kastro_castle;};
		case 16: {_randomLocation = location_kavala;};
		case 17: {_randomLocation = location_kavala_office_complex;};
		case 18: {_randomLocation = location_kavala_hospital;};
		case 19: {_randomLocation = location_neochori;};
		case 20: {_randomLocation = location_oreokastro_church;};
		case 21: {_randomLocation = location_paros;};
		case 22: {_randomLocation = location_pyrgos;};
		case 23: {_randomLocation = location_pyrgos_office_complex;};
		case 24: {_randomLocation = location_sofia;};
		case 25: {_randomLocation = location_syrta;};
		case 26: {_randomLocation = location_thronos;};
		case 27: {_randomLocation = location_zaros_church;};
    };
    
    // Change _minSize & _maxSize if Marker Not In Water Parameter is Enabled to not place spawn marker in ocean
    if (pht6_parameter_spawnType == 1) then {
        while {surfaceIsWater [_minSizeX, _maxSize/2]} do {
            _minSizeX = _minSizeX + 100;
        };
        while {surfaceIsWater [_maxSizeX, _maxSize/2]} do {
         	_maxSizeX = _maxSizeX - 100;  
        };
        while {surfaceIsWater [_maxSize/2, _minSizeY]} do {
          	_minSizeY = _minSizeY + 100;  
        };
        while {surfaceIsWater [_maxSize/2, _maxSizeY]} do {
          	_maxSizeY = _maxSizeY - 100;  
        };
    };
    _randomSpawnPos = [0,0];
    // Random Spawn Position based on Random Marker-based
    if (pht6_parameter_spawnType <= 1) then {
    	_randomSpawnPos = [(random _maxSizeX - _minSizeX) + _minSizeX, (random _maxSizeY - _minSizeY) + _minSizeY];
    };
    // Random Spawn Position based on Random Locations
    if (pht6_parameter_spawnType >= 2 && pht6_parameter_spawnType < _MISSIONMAKERSELECTEDSPAWNLOCATIONVALUE) then {
        _randLocX = random pht6_parameter_spawnRange;
        _randLocY = random pht6_parameter_spawnRange;
        _randLocXisPositive = [true,false] call BIS_fnc_selectRandom;
        _randLocYisPositive = [true,false] call BIS_fnc_selectRandom;
        _randomSpawnPos = _randomCityLocationPos;
        if (_randLocXisPositive) then {
            _randomSpawnPos = [(_randomSpawnPos select 0) + _randLocX, (_randomSpawnPos select 1)];
        } else {
            _randomSpawnPos = [(_randomSpawnPos select 0) - _randLocX, (_randomSpawnPos select 1)];
        };
        if (_randLocYisPositive) then {
            _randomSpawnPos = [(_randomSpawnPos select 0), (_randomSpawnPos select 1) + _randLocY];
        } else {
            _randomSpawnPos = [(_randomSpawnPos select 0), (_randomSpawnPos select 1) - _randLocY];
        };
    };
	_randomSpawn = createMarker ["randomSpawn", _randomSpawnPos];
	_randomSpawn setMarkerShape "ICON";
	_randomSpawn setMarkerType "Empty";
	_randomSpawn setMarkerSize [1,1];
    _randomBuilding = nearestBuilding getMarkerPos "randomSpawn";
    _buildingPosArray = [_randomBuilding] call BIS_fnc_buildingPositions;
    
    _playerPositionsCompleteRandom = [_buildingPosArray call BIS_fnc_selectRandom];
    
    _mrkText = "";
    
    
/*--- Marker Player Location ---*/       
	if (pht6_parameter_spawnType >= _MISSIONMAKERSELECTEDSPAWNLOCATIONVALUE) then
    {        
    	_mrkText = createMarker ["objective", position _randomLocation];
		_mrkText setMarkerShape "ICON";
		_mrkText setMarkerType "Empty";
		_mrkText setMarkerSize [1,1];                
    } 
    else 
    { 
    	_mrkText = createMarker ["objective", _playerPositionsCompleteRandom select 0];
		_mrkText setMarkerShape "ICON";
		_mrkText setMarkerType "Empty";
		_mrkText setMarkerSize [1,1];
    };
    
    
/*--- Player Task ---*/
    [{true},["task1","Defend your <font color = '#FF8000'><marker name ='objective'>home</marker></font> from home invaders that are trying to murder you and your family.","Defend Your Home","home",getmarkerpos "objective","assigned"]] call FHQ_TT_addTasks;


/*--- Spawn Players ---*/

	waitUntil { time > 0 };

	// Predefined User Positions
	if (pht6_parameter_spawnType >= _MISSIONMAKERSELECTEDSPAWNLOCATIONVALUE) then 
    {
        _playerNum = 0;
        for "_yPos" from 0 to ( ceil ((count _ALLPLAYERUNITS)/_SPAWN_PLAYER_PREDEFINED_VALUE) - 1 ) do {
            _unitsPerRow = 3;
            if ( ((count _ALLPLAYERUNITS) - _playerNum - 1) < 3 ) then {
              	_unitPerRow = (count _ALLPLAYERUNITS) - _playerNum - 1;
            };
            for "_xPos" from 0 to _unitsPerRow do {
                (_ALLPLAYERUNITS select _playerNum) setDir getDir _randomLocation;
                (_ALLPLAYERUNITS select _playerNum) setPosASL [(getPosASL _randomLocation select 0) + _xPos,(getPosASL _randomLocation select 1)+_yPos,(getPosASL _randomLocation select 2)];
                _playerNum = _playerNum + 1;
            };
        };     
    }
    // Completely Randomized Spawn Locations
    else 
    {
        for "_i" from 1 to ((count _ALLPLAYERUNITS) - 1) do
        {
            _buildingPos = _buildingPosArray call BIS_fnc_selectRandom;  
            
            // Checks to handle and deal with units stacking
            // Positions that overlap are randomized 1 spaces away from each other to avoid overlap
            _booleanFairDistanceCheck = true;
            while {_booleanFairDistanceCheck} do 
            {
                _breakCheck = true;
                {
	                if ( floor(_buildingPos distance2D _x) < 1 ) exitWith 
	                {
	                    _dir = [ [0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1] ] call BIS_fnc_selectRandom;
                        _dirX = _dir select 0;
 						_dirY = _dir select 1;
                        _x = _buildingPos select 0;
                        _y = _buildingPos select 1;
                        _z = _buildingPos select 2;
                        _buildingPos = [_x + _dirX, _y + _dirY, _z];
                        _breakCheck = false;
	                }
	            } forEach _playerPositionsCompleteRandom;
                if (_breakCheck) then 
                {
                	_booleanFairDistanceCheck = false;  
                };
            };  
	        _playerPositionsCompleteRandom pushBack _buildingPos;
        };
        
        _startPos = 0;
        {
            _x setPosATL (_playerPositionsCompleteRandom select _startPos);
            _startPos = _startPos + 1;
        } forEach _ALLPLAYERUNITS;
    };
    
    
/*--- Get Unit names for all playable units again to make sure they're loaded properly ---*/
	_ALLPLAYERUNITS = [];
	{
    	if (side _x == Resistance) then {
           	_ALLPLAYERUNITS pushback _x;
        };
	} forEach allunits; 
    
    
/*--- Check all Players are at correct spawn ---*/
	// Will cause overlap at the moment, but I'm assuming this should be fine for error check.
    // Player is still at allowDamage false, so I don't think death accidents are high, but if I'm wrong then this needs fine tuning.
	{
	    while {(_x distance2D getMarkerPos "objective") > _STARTPOS_MAX_VALID_DISTANCE} do {
            if (pht6_parameter_spawnType >= _MISSIONMAKERSELECTEDSPAWNLOCATIONVALUE) then {
                _x setDir getDir _randomLocation;
                _x setPosASL [(getPosASL _randomLocation select 0),(getPosASL _randomLocation select 1),(getPosASL _randomLocation select 2)];
            } else {
                _x setPosATL (_playerPositionsCompleteRandom call BIS_fnc_selectRandom);
            };
	    };
    } forEach _ALLPLAYERUNITS;
    

/*--- Spawn Enemies ---*/

	_counter = pht6_parameter_enemyCount;
    
    while {_counter > 0} do
    {
    	call compile preprocessFileLineNumbers "scripts\spawn.sqf";
        _counter = _counter - 4;
	    {
	        if ( ((p1 distance2D _x) > (pht6_parameter_startDistance + 100)) && (side _x == east)) then 
	        {
	            deleteVehicle _x;
                _counter = _counter + 1;
	        };
	    } forEach allunits;
    };

	
/*--- Delete All Locations once everything is done to Improve Performance ---*/
	{deleteVehicle _x} forEach _locationArray;
    

/*--- Turn off allowDamage once everything is done ---*/

	waitUntil { time > 10 };
	{_x allowDamage true} forEach _ALLPLAYERUNITS;
	{zeus_mod1 addCuratorEditableObjects [[_x],true]} forEach allUnits;
	{zeus_mod2 addCuratorEditableObjects [[_x],true]} forEach allUnits;
	{zeus_mod3 addCuratorEditableObjects [[_x],true]} forEach allUnits;
	{zeus_mod4 addCuratorEditableObjects [[_x],true]} forEach allUnits;
	{zeus_mod5 addCuratorEditableObjects [[_x],true]} forEach allUnits;
	{zeus_mod6 addCuratorEditableObjects [[_x],true]} forEach allUnits;
	{zeus_mod7 addCuratorEditableObjects [[_x],true]} forEach allUnits;
	{zeus_mod8 addCuratorEditableObjects [[_x],true]} forEach allUnits;
	{zeus_mod9 addCuratorEditableObjects [[_x],true]} forEach allUnits;
	{zeus_mod10 addCuratorEditableObjects [[_x],true]} forEach allUnits;
	
}; 