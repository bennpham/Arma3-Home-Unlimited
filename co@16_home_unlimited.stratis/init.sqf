setViewDistance 1000;
call compile preprocessFileLineNumbers "fhqtt.sqf";
call compile preProcessFileLineNumbers "briefing.sqf";
enableSentences false;

if (isClass(configfile >> "CfgPatches" >> "task_force_radio")) then {
    tf_no_auto_long_range_radio = true;
};

[] spawn PHT6_fnc_hoMain;
call compile preProcessFileLineNumbers "scripts\infotext.sqf";