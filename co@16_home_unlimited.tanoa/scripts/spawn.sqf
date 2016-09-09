if (isServer) then {

_ppos_x = (position p1) select 0;
_ppos_y = (position p1) select 1;
_dist = pht6_parameter_startDistance;

_coordList = [];


if ( !( surfaceIsWater [_ppos_x, _ppos_y + _dist + 50]) ) then
{
   	_coordList pushBack [0,_dist];
};
if ( !( surfaceIsWater [_ppos_x + _dist + 50, _ppos_y + _dist + 50]) ) then
{
   	_coordList pushBack [_dist,_dist];
};
if ( !( surfaceIsWater [_ppos_x + _dist + 50, _ppos_y]) ) then
{
   	_coordList pushBack [_dist,0];
};
if ( !( surfaceIsWater [_ppos_x + _dist + 50, _ppos_y - _dist - 50]) ) then
{
   	_coordList pushBack [_dist,-_dist];
};
if ( !( surfaceIsWater [_ppos_x, _ppos_y - _dist - 50]) ) then
{
   	_coordList pushBack [0,-_dist];
};
if ( !( surfaceIsWater [_ppos_x - _dist - 50, _ppos_y - _dist - 50]) ) then
{
   	_coordList pushBack [-_dist,-_dist];
};
if ( !( surfaceIsWater [_ppos_x - _dist - 50, _ppos_y]) ) then
{
   	_coordList pushBack [-_dist,0];
};
if ( !( surfaceIsWater [_ppos_x - _dist - 50, _ppos_y + _dist + 50]) ) then
{
   	_coordList pushBack [-_dist,_dist];
};

_coordinates = _coordList call bis_fnc_selectRandom;

_destPos = [(_coordinates select 0) + _ppos_x, (_coordinates select 1) + _ppos_y, 0]; 
_safePos = [_destPos, 0, 50, 3, 0, 500, 0] call BIS_fnc_findSafePos; 

enemy_grp = createCenter east;  
enemy_grp = createGroup east;  

_leader = enemy_grp createUnit ["O_Soldier_F", _safePos, [], 3, "NONE"];  
_unit1 = enemy_grp createUnit ["O_Soldier_F", _safePos, [], 3, "NONE"];  
_unit2 = enemy_grp createUnit ["O_Soldier_F", _safePos, [], 3, "NONE"];  
_unit3 = enemy_grp createUnit ["O_Soldier_F", _safePos, [], 3, "NONE"];  

[_leader, "loadout\enemy.sqf"] call PHT6_fnc_safeAddLoadout;
[_unit1, "loadout\enemy.sqf"] call PHT6_fnc_safeAddLoadout;
[_unit2, "loadout\enemy.sqf"] call PHT6_fnc_safeAddLoadout;
[_unit3, "loadout\enemy.sqf"] call PHT6_fnc_safeAddLoadout;

if (pht6_parameter_enemySkill == 1000) then
{
    _leader setSkill random 1;
    _unit1 setSkill random 1;
    _unit2 setSkill random 1;
    _unit3 setSkill random 1;
} else {
    {_x setSkill pht6_parameter_enemySkill} forEach [_leader,_unit1,_unit2,_unit3];
};

_leader = leader enemy_grp;        

enemy_wp1 = enemy_grp addWaypoint [position p1, 0];   
enemy_wp1 setWaypointType "SAD";  
enemy_wp1 setWaypointStatements ["true", ""];

enemy_wp2 = enemy_grp addWaypoint [position p1, 0];   
enemy_wp2 setWaypointType "CYCLE";  
enemy_wp2 setWaypointStatements ["true", ""];

};