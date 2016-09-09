class pht6_param_playerArmor
{
	title = "PLAYER: Armor";
	values[] = {0,1,2,3,4};
	texts[] = {"Very Light", "Light", "Medium", "Heavy", "Very Heavy"};
	default = 2;
	function = "PHT6_fnc_hoPlayerArmor";
};

class pht6_param_playerFAK
{
	title = "PLAYER: First Aid Kits";
	values[] = {0,1,2,3,4,5,6,7,8,9,10};
	texts[] = {"0","1","2","3","4","5","6","7","8","9","10"};
	default = 3;
	function = "PHT6_fnc_hoPlayerFAK";
};

class pht6_param_playerThrowableGrenade
{
	title = "PLAYER: THROWABLE: Grenades";
	values[] = {0,1,2,3,4,5,6,7,8,9,10};
	texts[] = {"0","1","2","3","4","5","6","7","8","9","10"};
	default = 0;
	function = "PHT6_fnc_hoPlayerThrowableGrenades";
};

class pht6_param_playerThrowableMiniGrenade
{
	title = "PLAYER: THROWABLE: Mini Grenades";
	values[] = {0,1,2,3,4,5,6,7,8,9,10};
	texts[] = {"0","1","2","3","4","5","6","7","8","9","10"};
	default = 0;
	function = "PHT6_fnc_hoPlayerThrowableMiniGrenades";
};

class pht6_param_playerThrowableSmoke
{
	title = "PLAYER: THROWABLE: Smoke Grenades";
	values[] = {0,1,2,3,4,5,6,7,8,9,10};
	texts[] = {"0","1","2","3","4","5","6","7","8","9","10"};
	default = 0;
	function = "PHT6_fnc_hoPLayerThrowableSmokeGrenades";
};

class pht6_param_playerThrowableChemlight
{
	title = "PLAYER: THROWABLE: Chem Lights";
	values[] = {0,1,2,3,4,5,6,7,8,9,10};
	texts[] = {"0","1","2","3","4","5","6","7","8","9","10"};
	default = 2;
	function = "PHT6_fnc_hoPlayerThrowableChemLights";
};

class pht6_param_playerWeapPistols
{
	title = "PLAYER: WEAPON: Pistols";
	values[] = {0,1};
	texts[] = {"NONE", "ALL PISTOLS"};
	default = 1;
	function = "PHT6_fnc_hoPlayerWeapPistols";
};

class pht6_param_playerWeapSmgs
{
	title = "PLAYER: WEAPON: SMGs";
	values[] = {0,1,2};
	texts[] = {"NONE", "WWII SMGs Only (Requires MASSI)", "ALL SMGs"};
	default = 0;
	function = "PHT6_fnc_hoPlayerWeapSmgs";
};

class pht6_param_playerWeapShotguns
{
	title = "PLAYER: WEAPON: Shotguns";
	values[] = {0,1,2};
	texts[] = {"NONE", "NO AA-12", "ALL SHOTGUNS"};
	default = 0;
	function = "PHT6_fnc_hoPlayerWeapShotguns";
};

class pht6_param_playerWeapRifles
{
	title = "PLAYER: WEAPON: Rifles";
	values[] = {0,1,2,3};
	texts[] = {"NONE", "Assault Rifles ONLY", "Lee Enfield ONLY (Requires CUP or Massi)", "ALL RIFLES"};
	default = 0;
	function = "PHT6_fnc_hoPlayerWeapRifles";
};