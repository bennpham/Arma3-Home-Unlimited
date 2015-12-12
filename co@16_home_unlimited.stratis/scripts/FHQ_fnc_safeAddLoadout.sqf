_unit = _this select 0;
_scriptName = _this select 1;

if (!local _unit) exitWith {};

_isHandled = _unit getVariable "FHQ_loadout_handled";
    
if (isNil "_isHandled") then 
{        
    _unit setVariable ["FHQ_loadout_handled", true, true];
	_unit spawn compile preprocessFileLineNumbers _scriptName;
};