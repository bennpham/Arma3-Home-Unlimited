class pht6_param_enemyArmor
{
	title = "ENEMY: Armor";
	values[] = {0,1,2,3,4};
	texts[] = {"Very Light", "Light", "Medium", "Heavy", "Very Heavy"};
	default = 0;
	function = "PHT6_fnc_hoEnemyArmor";
};

class pht6_param_enemyFAK
{
	title = "ENEMY: First Aid Kits";
	values[] = {0,1,2,3,4,5,6,7,8,9,10};
	texts[] = {"0","1","2","3","4","5","6","7","8","9","10"};
	default = 1;
	function = "PHT6_fnc_hoEnemyFAK";
};

class pht6_param_enemyThrowableGrenade
{
	title = "ENEMY: THROWABLE: Grenades";
	values[] = {0,1,2,3,4,5,6,7,8,9,10};
	texts[] = {"0","1","2","3","4","5","6","7","8","9","10"};
	default = 1;
	function = "PHT6_fnc_hoEnemyThrowableGrenades";
};

class pht6_param_enemyThrowableMinigrenade
{
	title = "ENEMY: THROWABLE: Mini Grenades";
	values[] = {0,1,2,3,4,5,6,7,8,9,10};
	texts[] = {"0","1","2","3","4","5","6","7","8","9","10"};
	default = 1;
	function = "PHT6_fnc_hoEnemyThrowableMiniGrenades";
};

class pht6_param_enemyThrowableSmoke
{
	title = "ENEMY: THROWABLE: Smoke Grenades";
	values[] = {0,1,2,3,4,5,6,7,8,9,10};
	texts[] = {"0","1","2","3","4","5","6","7","8","9","10"};
	default = 1;
	function = "PHT6_fnc_hoEnemyThrowableSmokeGrenades";
};

class pht6_param_enemyThrowableChemlight
{
	title = "ENEMY: THROWABLE: Chem Lights";
	values[] = {0,1,2,3,4,5,6,7,8,9,10};
	texts[] = {"0","1","2","3","4","5","6","7","8","9","10"};
	default = 1;
	function = "PHT6_fnc_hoEnemyThrowableChemLights";
};

class pht6_param_enemyWeapPistols
{
	title = "ENEMY: WEAPON: Pistols";
	values[] = {0,1};
	texts[] = {"NONE", "ALL PISTOLS"};
	default = 1;
	function = "PHT6_fnc_hoEnemyWeapPistols";
};

class pht6_param_enemyWeapSmgs
{
	title = "ENEMY: WEAPON: SMGs";
	values[] = {0,1,2};
	texts[] = {"NONE", "WWII SMGs Only (Requires MASSI)", "ALL SMGs"};
	default = 2;
	function = "PHT6_fnc_hoEnemyWeapSmgs";
};

class pht6_param_enemyWeapShotguns
{
	title = "ENEMY: WEAPON: Shotguns";
	values[] = {0,1,2};
	texts[] = {"NONE", "NO AA-12", "ALL SHOTGUNS"};
	default = 2;
	function = "PHT6_fnc_hoEnemyWeapShotguns";
};

class pht6_param_enemyWeapRifles
{
	title = "ENEMY: WEAPON: Rifles";
	values[] = {0,1,2,3};
	texts[] = {"NONE", "Assault Rifles ONLY", "Lee Enfield ONLY (Requires CUP or Massi)", "ALL RIFLES"};
	default = 3;
	function = "PHT6_fnc_hoEnemyWeapRifles";
};