class pht6_param_spawnType
{
    title = "Spawn Type";
    values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37};
    texts[] = {"Random Marker-Based Nearest Building", "Random Marker-Based Nearest Building (Avoid Water)", "Random Locations: City Capital", "Random Locations: [City Capital, City]", "Random Locations: [City Capital, City, Village]", "Random Locations: [City Capital, City, Village, Local]", "Random Locations: Marine", "Random Creator Defined Buildings","B25","Banana Plantation","Blue Pearl Cargos","Blue Pearl Ship","Cliffs","Comms Bravo Peak","Fortress Ruins","G4M","Georgetown Artillery Site","Georgetown Bunkers","Georgetown Office Building","Harcourt Shopping Center","Hotel Resort","Katkoula Pizzaria","Kotomo Mountain Fortress","La Rochelle Artillery Bunker ","Lijnhaven Port Shopping Center","Liquor Town","Northwest Artillery Base","Plantation","Railroad Hobos","Saint Julien Bunker","Southern Ruins","Southwest Caves","Tanoa Sugar Company","Tanouka Mansion","Tavu Beach Bunkers","Tavu Bunkers","Tuvanaka","Western Islands Bunker"};
    default = 5;
	function = "PHT6_fnc_hoSpawnType";
};

class pht6_param_spawnRange
{
    title = "Spawn Range (used for Random Locations Spawn Type)";
    values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25};
    texts[] = {"0m","100m","200m","300m","400m","500m","600m","700m","800m","900m","1000m","1100m","1200m","1300m","1400m","1500m","1600m","1700m","1800m","1900m","2000m","2100m","2200m","2300m","2400m","2500m"};
    default = 3;
	function = "PHT6_fnc_hoSpawnRange";
};

class pht6_param_enemyCount
{
    title = "Amount of enemies";
    values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29};
    texts[] = {"4","8","12","16","20","24","28","32","36","40","44","48","52","56","60","64","68","72","76","80","84","88","92","96","100","104","108","112","116","120"};
    default = 14;
	function = "PHT6_fnc_hoEnemyCount";
};

class pht6_param_enemySkill
{
    title = "Enemy's Skill";
    values[] = {0,1,2,3,4,5,6,7,8,9,10,11};
    texts[] = {"RANDOM","0.0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1.0"};
    default = 0;
	function = "PHT6_fnc_hoEnemySkill";
};

class pht6_param_startRange
{
    title = "Enemy's distance from your home";
    values[] = {0,1,2,3,4,5,6,7,8,9};
    texts[] = {"~50m","~100m","~150m","~200m","~300m","~400m","~500m","~600m","~700m","~800m"};
    default = 4;
	function = "PHT6_fnc_hoStartRange";
};

class pht6_param_enemyMask
{
    title = "Enemy's Mask";
    values[] = {0,1};
    texts[] = {"Balaclava or Shemags Only (Fully Masked)", "ALL MASKS"};
    default = 0;
	function = "PHT6_fnc_hoEnemyMask";
};

class pht6_param_radio
{
    title = "TFAR Radios";
    values[] = {0,1};
    texts[] = {"Disable", "Enable"};
    default = 1;
	function = "PHT6_fnc_hoRadio";
};