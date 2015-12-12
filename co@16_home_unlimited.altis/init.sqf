setViewDistance 1000;
call compile preprocessFileLineNumbers "fhqtt.sqf";
call compile preProcessFileLineNumbers "briefing.sqf";
enableSentences false;

[] spawn PHT6_fnc_hoMain;
call compile preProcessFileLineNumbers "scripts\infotext.sqf";