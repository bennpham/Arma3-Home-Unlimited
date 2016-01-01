private ["_unit", "_backpack", "_vest"];

/* Replace _this below if you want to call this script differently */
_unit = _this;

if (!isNull _unit) then {
    removeAllWeapons _unit;
    removeAllItems _unit;
    removeBackpackGlobal _unit;
    removeAllAssignedItems _unit;
    removeUniform _unit;
    removeVest _unit;
    removeHeadgear _unit;
    removeGoggles _unit;

    /* Other gear, goggles, vest, uniform */
    _listOfUniforms = ["U_Competitor", "U_C_Scientist", "U_C_Poor_1", "U_C_Poor_2", "U_Marshal", "U_C_WorkerCoveralls", "U_I_G_Story_Protagonist_F", "U_I_G_resistanceLeader_F", "U_C_Journalist", "U_NikosBody", "U_OrestesBody", "U_Rangemaster","U_BG_Guerilla2_2","U_BG_Guerilla2_1","U_BG_Guerilla2_3"];
    
    if (isClass(configFile >> "CfgPatches" >> "mas_afr_rebl")) then
	{
        _masAfrConflictUniforms = ["U_mas_afr_O_rebel1","U_mas_afr_O_rebel2","U_mas_afr_O_rebel3","U_mas_afr_O_rebel4","U_mas_afr_O_rebel5","U_mas_afr_O_rebel6","U_mas_afr_O_rebel7","U_mas_afr_O_rebel8","U_mas_afr_O_rebel9","U_mas_afr_O_rebel10"];
        _listOfUniforms append _masAfrConflictUniforms;
    };
    
    if (isClass(configFile >> "CfgPatches" >> "CUP_Creatures_Military_USMC")) then 
    {
    	_CUPUSMCUniforms = ["CUP_B_USMC_Navy_Blue", "CUP_B_USMC_Navy_Brown", "CUP_B_USMC_Navy_Green", "CUP_B_USMC_Navy_Red", "CUP_B_USMC_Navy_Violet", "CUP_B_USMC_Navy_White", "CUP_B_USMC_Navy_Yellow"];
        _listOfUniforms append _CUPUSMCUniforms;  
    };
    
    _randomUniform = _listOfUniforms call bis_fnc_selectRandom; 
    _unit forceaddUniform _randomUniform;
    
    _haveHeadgear = [0,1] call bis_fnc_selectRandom;
    if (_haveHeadgear == 1) then
    {
        _listOfHeadgears = ["H_Bandanna_blu","H_Bandanna_gry","H_Bandanna_khk","H_Bandanna_sgg","H_Bandanna_sand","H_Bandanna_surfer","H_Bandanna_surfer_blk","H_Bandanna_surfer_grn","H_Beret_blk","H_Beret_grn","H_Beret_red","H_Cap_blk","H_Cap_blu","H_Cap_grn","H_Cap_red","H_Cap_surfer","H_Cap_tan","H_Hat_blue", "H_Hat_brown", "H_Hat_checker", "H_Hat_grey","H_Hat_tan","H_StrawHat","H_StrawHat_dark","H_Watchcap_blk","H_Watchcap_khk","H_Watchcap_sgg"];
	    if (isClass(configFile >> "CfgPatches" >> "rhs_main")) then
		{
	        _rhsHeadgear = ["rhs_beanie_green","rhs_beanie"];
	        _listOfHeadgears append _rhsHeadgear;
	    };
	    _randomHeadgear = _listOfHeadgears call bis_fnc_selectRandom;
		_unit addHeadgear _randomHeadgear;
    };
    
    _haveGlasses = [0,1] call bis_fnc_selectRandom;
    if (_haveGlasses == 1) then
    {
    	_listOfGlasses = ["G_Aviator","G_Lady_Blue","G_Lady_Dark","G_Lady_Mirror","G_Lady_Red","G_Shades_Black","G_Shades_Blue","G_Shades_Green","G_Shades_Red","G_Spectacles","G_Spectacles_Tinted","G_Sport_Blackred","G_Sport_Blackwhite","G_Sport_Blackyellow","G_Sport_Checkered","G_Sport_Greenblack","G_Sport_Red","G_Squares","G_Squares_Tinted"];
        if (isClass(configFile >> "CfgPatches" >> "rhsusf_main")) then
		{
	        _rhsusfGlasses = ["rhs_googles_black","rhs_googles_orange","rhs_googles_clear","rhs_googles_yellow"];
	        _listOfGlasses append _rhsusfGlasses;
	    };
        _randomGlasses = _listOfGlasses call bis_fnc_selectRandom;
        _unit addGoggles _randomGlasses;  
    };
    
    waitUntil { !( isNil {pht6_parameter_playerArmor} )}; 
    
    switch (pht6_parameter_playerArmor) do {
		case 0: {
            		_randomVest = ["V_Chestrig_blk","V_Chestrig_oli","V_Chestrig_khk"] call bis_fnc_selectRandom;
            		_unit addVest _randomVest;
        };
        case 1: {
            		_randomVest = ["V_HarnessO_gry","V_HarnessO_brn"] call bis_fnc_selectRandom;
            		_unit addVest _randomVest;
        };
        case 2: {
            		_randomVest = ["V_TacVest_blk","V_TacVest_brn","V_TacVest_khk","V_TacVest_oli"] call bis_fnc_selectRandom;
            		_unit addVest _randomVest;
        };
        case 3: {
            		_randomVest = ["V_PlateCarrier1_blk","V_PlateCarrier1_rgr"] call bis_fnc_selectRandom;
            		_unit addVest _randomVest;
        };    
        case 4: {
            		_unit addVest "V_PlateCarrier3_rgr";
        };    
    };
	    
    /* Magazines and weapons in main inventory */
	_listOfWeapons = [];
    
    waitUntil 
    { 
    	(!( isNil {pht6_parameter_radio} )) AND
		(!( isNil {pht6_parameter_playerWeapPistols} )) AND
		(!( isNil {pht6_parameter_playerWeapSmgs} )) AND
        (!( isNil {pht6_parameter_playerWeapShotguns} )) AND
        (!( isNil {pht6_parameter_playerWeapRifles} )) AND 
        (!( isNil {pht6_parameter_playerFAK} )) AND 
        (!( isNil {pht6_parameter_playerThrowableGrenades} )) AND 
        (!( isNil {pht6_parameter_playerThrowableMiniGrenades} )) AND 
        (!( isNil {pht6_parameter_playerThrowableSmokeGrenades} )) AND 
        (!( isNil {pht6_parameter_playerThrowableChemLights} )) 
	}; 
    
    if (pht6_parameter_playerWeapPistols == 1) then 
    {
    	_listVanillaPistols = ["hgun_ACPC2_F", "hgun_P07_F", "hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_02_F", "hgun_Rook40_F"];
        _listOfWeapons append _listVanillaPistols;     
    };
    
    if (pht6_parameter_playerWeapSmgs == 2) then 
    {
        _listVanillaSMGs = ["hgun_PDW2000_F", "SMG_01_F", "SMG_02_F"];
        _listOfWeapons append _listVanillaSMGs;
    };
    
    if (pht6_parameter_playerWeapRifles == 1 OR pht6_parameter_playerWeapRifles == 3) then
    {
    	_listVanillaARs = ["arifle_Katiba_C_F", "arifle_Mk20C_plain_F", "arifle_MXC_F", "arifle_MXC_Black_F", "arifle_SDAR_F", "arifle_TRG21_F", "arifle_TRG20_F"];
        _listOfWeapons append _ListVanillaARs;
    };
	
	if (isClass(configFile >> "CfgPatches" >> "CUP_Weapons_WeaponsCore") && pht6_parameter_playerWeapPistols == 1) then
	{
        _listCUPPistols = ["CUP_hgun_Colt1911","CUP_hgun_Compact","CUP_hgun_Duty_M3X","CUP_hgun_Phantom_Flashlight","CUP_hgun_glock17_flashlight","CUP_hgun_M9","CUP_hgun_Makarov","CUP_hgun_PB6P9_snds","CUP_hgun_TaurusTracker455","CUP_hgun_TaurusTracker455_gold"];
		_listOfWeapons append _listCUPPistols;
	};
    
    if (isClass(configFile >> "CfgPatches" >> "CUP_Weapons_WeaponsCore") && pht6_parameter_playerWeapSmgs == 2) then
	{
        _listCUPSMGs = ["CUP_hgun_SA61","CUP_hgun_MicroUzi","CUP_smg_bizon","CUP_smg_EVO","CUP_smg_MP5A5"];
		_listOfWeapons append _listCUPSMGs;
	};
    
    if (isClass(configFile >> "CfgPatches" >> "CUP_Weapons_WeaponsCore") && pht6_parameter_playerWeapShotguns == 2) then
	{
        _listCUPShotguns = ["CUP_sgun_AA12","CUP_sgun_M1014","CUP_sgun_Saiga12K"];
		_listOfWeapons append _listCUPShotguns;
	};
    
    if (isClass(configFile >> "CfgPatches" >> "CUP_Weapons_WeaponsCore") && pht6_parameter_playerWeapShotguns == 1) then
	{
        _listCUPRShotguns = ["CUP_sgun_M1014","CUP_sgun_Saiga12K"];
		_listOfWeapons append _listCUPRShotguns;
	};
    
    if (isClass(configFile >> "CfgPatches" >> "CUP_Weapons_WeaponsCore") && (pht6_parameter_playerWeapRifles == 1 OR pht6_parameter_playerWeapRifles == 3)) then
	{
        _listCUPAssaultRifles = ["CUP_arifle_AKS","CUP_arifle_AKS_Gold","CUP_arifle_AKS74U","CUP_arifle_G36C","CUP_arifle_M16A2","CUP_arifle_M4A1","CUP_arifle_Sa58V","CUP_arifle_Mk16_CQC","CUP_arifle_XM8_Compact"];
		_listOfWeapons append _listCUPAssaultRifles;
	};     
    
    if (isClass(configFile >> "CfgPatches" >> "CUP_Weapons_WeaponsCore") && (pht6_parameter_playerWeapRifles == 2 OR pht6_parameter_playerWeapRifles == 3)) then
	{
		_listOfWeapons pushBack "CUP_srifle_LeeEnfield";
	};
    
    if (isClass(configFile >> "CfgPatches" >> "fhq_m4_a3") && (pht6_parameter_playerWeapRifles == 1 OR pht6_parameter_playerWeapRifles == 3)) then
	{
        _listFHQM4 = ["FHQ_M4A1_BLK","FHQ_M4A1_AFG_BLK"];
		_listOfWeapons append _listFHQM4;
	};
    
    if (isClass(configFile >> "CfgPatches" >> "rhsusf_main") && (pht6_parameter_playerWeapRifles == 1 OR pht6_parameter_playerWeapRifles == 3)) then
	{
        _listRHSUSFRifles = ["RHS_WEAP_M16A4","RHS_WEAP_M16A4_CARRYHANDLE","RHS_WEAP_M16A4_GRIP","RHS_WEAP_M16A4_CARRYHANDLE_GRIP","RHS_WEAP_M4A1","RHS_WEAP_M4A1_CARRYHANDLE","RHS_WEAP_M4A1_GRIP","RHS_WEAP_M4A1_CARRYHANDLE_GRIP"];
		_listOfWeapons append _listRHSUSFRifles;
	};   
         
	if (isClass(configFile >> "CfgPatches" >> "rhsusf_main") && (pht6_parameter_playerWeapShotguns == 1 OR pht6_parameter_playerWeapShotguns == 2)) then
    {
        _listRHSUSFShotguns = ["rhs_weap_M590_8RD","rhs_weap_M590_5RD"];
        _listOfWeapons append _listRHSUSFShotguns; 
    };
    
    if (isClass(configFile >> "CfgPatches" >> "rhsusf_main") && pht6_parameter_playerWeapPistols == 1) then
    {
        _listRHSUSFPistols = ["RHSUSF_WEAP_GLOCK17G4","RHSUSF_WEAP_M1911A1","rhsusf_weap_m9"];
        _ListOfWeapons append _listRHSUSFPistols; 
    };
    
    if (isClass(configFile >> "CfgPatches" >> "rhs_main") && (pht6_parameter_playerWeapRifles == 1 OR pht6_parameter_playerWeapRifles == 3)) then
	{
        _listRHSRifles = ["rhs_weap_ak74m_folded","rhs_weap_akms"];
		_listOfWeapons append _listRHSRifles;
	};
    
    if (isClass(configFile >> "CfgPatches" >> "rhs_main") && pht6_parameter_playerWeapPistols == 1) then
    {
        _listRHSPistols = ["rhs_weap_pya","rhs_weap_makarov_pmm"];
        _listOfWeapons append _listRHSPistols;
    };
    
    if (isClass(configFile >> "CfgPatches" >> "mas_weapons") && pht6_parameter_playerWeapPistols == 1) then 
    {
    	_listMassiPistols = ["hgun_mas_acp_F","hgun_mas_bhp_F","hgun_mas_glock_F","hgun_mas_grach_F","hgun_mas_m23_F","hgun_mas_m9_F","hgun_mas_mak_F","hgun_mas_p226_F","hgun_mas_usp_F","hgun_mas_usp_l_F"];
        _listOfWeapons append _listMassiPistols;
    };
    
    if (isClass(configFile >> "CfgPatches" >> "mas_weapons") && pht6_parameter_playerWeapSmgs == 2) then 
    {
    	_listMassiSmgs = ["arifle_mas_bizon","arifle_mas_mp40","arifle_mas_mp40_o","arifle_mas_mp5","hgun_mas_mp7_F","arifle_mas_sten","hgun_mas_uzi_F","hgun_mas_mp7p_F","hgun_mas_sa61_F"];
        _listOfWeapons append _listMassiSmgs;  
    };
    
    if (isClass(configFile >> "CfgPatches" >> "mas_weapons") && pht6_parameter_playerWeapShotguns == 2) then 
    {
    	_listMassiShotguns = ["arifle_mas_aa12","arifle_mas_m1014","arifle_mas_saiga"];
        _listOfWeapons append _listMassiShotguns;  
    };
    
    if (isClass(configFile >> "CfgPatches" >> "mas_weapons") && pht6_parameter_playerWeapShotguns == 1) then 
    {
    	_listMassiRegShotguns = ["arifle_mas_m1014","arifle_mas_saiga"];
        _listOfWeapons append _listMassiRegShotguns;  
    };
    
    if (isClass(configFile >> "CfgPatches" >> "mas_weapons") && (pht6_parameter_playerWeapRifles == 1 OR pht6_parameter_playerWeapRifles == 3)) then 
    {
    	_listMassiAssaultRifles = ["arifle_mas_akms","arifle_mas_aks74u","arifle_mas_aks74u_c","arifle_mas_arx","arifle_mas_g36c","arifle_mas_hk416c","arifle_mas_m4vlt","arifle_mas_m4c","arifle_mas_mk16"];
        _listOfWeapons append _listMassiAssaultRifles;  
    };
    
    if (isClass(configFile >> "CfgPatches" >> "mas_weapons") && pht6_parameter_playerWeapSmgs == 1) then 
    {
    	_listMassiOldSmgs = ["arifle_mas_mp40","arifle_mas_mp40_o","arifle_mas_sten"];
        _listOfWeapons append _listMassiOldSmgs;  
    };
    
    if (isClass(configFile >> "CfgPatches" >> "mas_weapons") && (pht6_parameter_playerWeapRifles == 2 OR pht6_parameter_playerWeapRifles == 3)) then 
    {
        _listOfWeapons pushBack "arifle_mas_lee";  
    };
    
    if (isClass(configFile >> "CfgPatches" >> "hlc_wp_mp5") && pht6_parameter_playerWeapSmgs == 2) then
	{
        _listHLCMP5s = ["hlc_smg_mp5k","hlc_smg_mp5k_PDW","hlc_smg_mp5a2","hlc_smg_mp5a3","hlc_smg_mp5a4","hlc_smg_mp5n","hlc_smg_mp510"];
		_listOfWeapons append _listHLCMP5s;
	};
    
    if (isClass(configFile >> "CfgPatches" >> "hlc_wp_ak") && (pht6_parameter_playerWeapShotguns == 1 OR pht6_parameter_playerWeapShotguns == 2)) then
	{
		_listOfWeapons pushBack "hlc_rifle_saiga12k";
	};
    
    if (isClass(configFile >> "CfgPatches" >> "hlc_wp_ak") && (pht6_parameter_playerWeapRifles == 1 OR pht6_parameter_playerWeapRifles == 3)) then
	{
        _listHLCAKs = ["hlc_rifle_aks74u","hlc_rifle_ak47","hlc_rifle_akm","hlc_rifle_aku12"];
		_listOfWeapons append _listHLCAKs;
	};
    
    if (isClass(configFile >> "CfgPatches" >> "hlc_wp_AR15") && (pht6_parameter_playerWeapRifles == 1 OR pht6_parameter_playerWeapRifles == 3)) then
	{
        _listHLCAR15s = ["hlc_rifle_honeybadger","hlc_rifle_vendimus","hlc_rifle_RU5562","hlc_rifle_RU556","hlc_rifle_bcmjack","hlc_rifle_Bushmaster300","hlc_rifle_Colt727","hlc_rifle_M4","hlc_rifle_CQBR"];
		_listOfWeapons append _listHLCAR15s;
	};
    
	_randomWeapon = _listOfWeapons call bis_fnc_selectRandom;

    /* Magazines and weapons in vest and uniform */
	_vest = vestContainer _unit;
    
    if (pht6_parameter_playerThrowableGrenades > 0) 		then {_unit addMagazineGlobal "HandGrenade";		};
    if (pht6_parameter_playerThrowableMiniGrenades > 0) 	then {_unit addMagazineGlobal "MiniGrenade";		};
    if (pht6_parameter_playerThrowableSmokeGrenades > 0) 	then {_unit addMagazineGlobal "SmokeShell";			};
    if (pht6_parameter_playerThrowableChemLights > 0) 		then {_unit addMagazineGlobal "Chemlight_yellow";	};
    
    if (_randomWeapon == "hgun_ACPC2_F") then
    {
        _unit addMagazineGlobal "9Rnd_45ACP_Mag";
        _unit addWeaponGlobal _randomWeapon;
        _vest addMagazineCargoGlobal ["9Rnd_45ACP_Mag", 8];
    };
    
    if (_randomWeapon == "hgun_P07_F" OR _randomWeapon == "hgun_Rook40_F") then
    {
        _unit addMagazineGlobal "16Rnd_9x21_Mag";
        _unit addWeaponGlobal _randomWeapon;
        _vest addMagazineCargoGlobal ["16Rnd_9x21_Mag", 8];
    };
    
    if (_randomWeapon == "hgun_Pistol_heavy_01_F") then
    {
        _unit addMagazineGlobal "11Rnd_45ACP_Mag";
        _unit addWeaponGlobal _randomWeapon;        
        _vest addMagazineCargoGlobal ["11Rnd_45ACP_Mag", 8];
    };
    
    if (_randomWeapon == "hgun_Pistol_heavy_02_F") then
    {
        _unit addMagazineGlobal "6Rnd_45ACP_Cylinder";
        _unit addWeaponGlobal _randomWeapon;        
        _vest addMagazineCargoGlobal ["6Rnd_45ACP_Cylinder", 8];
    };
    
    if (_randomWeapon == "hgun_PDW2000_F" OR _randomWeapon == "SMG_02_F") then
    {
        _unit addMagazineGlobal "30Rnd_9x21_Mag";
        _unit addWeaponGlobal _randomWeapon;
        _unit addPrimaryWeaponItem "acc_flashlight";
        _vest addMagazineCargoGlobal ["30Rnd_9x21_Mag", 7];
    };
    
    if (_randomWeapon == "SMG_01_F") then
    {
        _unit addMagazineGlobal "30Rnd_45ACP_Mag_SMG_01";
        _unit addWeaponGlobal _randomWeapon;        
        _vest addMagazineCargoGlobal ["30Rnd_45ACP_Mag_SMG_01", 7];
    };
    
    if (_randomWeapon == "arifle_Katiba_C_F") then 
    {
        _unit addMagazineGlobal "30Rnd_65x39_caseless_green";
        _unit addWeaponGlobal _randomWeapon;    	 
        _unit addPrimaryWeaponItem "acc_flashlight";
        _vest addMagazineCargoGlobal ["30Rnd_65x39_caseless_green", 6];
    };
    
    if (_randomWeapon == "arifle_Mk20C_plain_F" OR _randomWeapon == "arifle_TRG21_F" OR _randomWeapon == "arifle_TRG20_F" OR _randomWeapon == "arifle_SDAR_F") then 
    {
        _unit addMagazineGlobal "30Rnd_556x45_Stanag";
        _unit addWeaponGlobal _randomWeapon;    	 
        _unit addPrimaryWeaponItem "acc_flashlight";
        _vest addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 6];
    };
    
    if (_randomWeapon == "arifle_MXC_F" OR _randomWeapon == "arifle_MXC_Black_F") then 
    {
        _unit addMagazineGlobal "30Rnd_65x39_caseless_mag";
        _unit addWeaponGlobal _randomWeapon;    	  
        _unit addPrimaryWeaponItem "acc_flashlight";
        _vest addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 6];
    };
    
    if (isClass(configFile >> "CfgPatches" >> "CUP_Weapons_WeaponsCore")) then
    {
    	if (_randomWeapon == "CUP_hgun_Colt1911") then 
	    {
            _unit addMagazineGlobal "CUP_7Rnd_45ACP_1911";
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["CUP_7Rnd_45ACP_1911", 8];
	    };
	    
	    if (_randomWeapon == "CUP_hgun_Compact") then 
	    {
            _unit addMagazineGlobal "CUP_10Rnd_9x19_Compact";
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["CUP_10Rnd_9x19_Compact", 8];
	    };
	    
	    if (_randomWeapon == "CUP_hgun_Duty_M3X") then 
	    {
            _unit addMagazineGlobal "16Rnd_9x21_Mag";
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["16Rnd_9x21_Mag", 8];
	    };
	    
	    if (_randomWeapon == "CUP_hgun_Phantom_Flashlight") then 
	    {
            _unit addMagazineGlobal "CUP_18Rnd_9x19_Phantom";
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["CUP_18Rnd_9x19_Phantom", 8];
	    };
	    
	    if (_randomWeapon == "CUP_hgun_glock17_flashlight") then 
	    {
            _unit addMagazineGlobal "CUP_17Rnd_9x19_glock17";
            _unit addWeaponGlobal _randomWeapon;
	        _vest addMagazineCargoGlobal ["CUP_17Rnd_9x19_glock17", 8];
	    };
	    
	    if (_randomWeapon == "CUP_hgun_M9") then 
	    {
            _unit addMagazineGlobal "CUP_15Rnd_9x19_M9";
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["CUP_15Rnd_9x19_M9", 8];
	    };
	    
	    if (_randomWeapon == "CUP_hgun_Makarov" OR _randomWeapon == "CUP_hgun_PB6P9" OR _randomWeapon == "CUP_hgun_PB6P9_snds") then 
	    {
            _unit addMagazineGlobal "CUP_8Rnd_9x18_Makarov_M";
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["CUP_8Rnd_9x18_Makarov_M", 8];
	    };
	    
	    if (_randomWeapon == "CUP_hgun_TaurusTracker455" OR _randomWeapon == "CUP_hgun_TaurusTracker455_gold") then 
	    {
            _unit addMagazineGlobal "CUP_6Rnd_45ACP_M";
            _unit addWeaponGlobal _randomWeapon;	  
	        _vest addMagazineCargoGlobal ["CUP_6Rnd_45ACP_M", 8];
	    };
	    
	    if (_randomWeapon == "CUP_hgun_SA61") then 
	    {
            _unit addMagazineGlobal "CUP_20Rnd_B_765x17_Ball_M";
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["CUP_20Rnd_B_765x17_Ball_M", 7];
	    };
	    
	    if (_randomWeapon == "CUP_hgun_MicroUzi") then 
	    {
            _unit addMagazineGlobal "CUP_30Rnd_9x19_UZI";
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["CUP_30Rnd_9x19_UZI", 7];
	    };
	    
	    if (_randomWeapon == "CUP_smg_bizon") then
	    {
            _unit addMagazineGlobal "CUP_64Rnd_9x19_Bizon_M";
            _unit addWeaponGlobal _randomWeapon;	        
	        _vest addMagazineCargoGlobal ["CUP_64Rnd_9x19_Bizon_M", 4];
	    };
	    
	    if (_randomWeapon == "CUP_smg_EVO") then
	    {
            _unit addMagazineGlobal "CUP_30Rnd_9x19_EVO";
            _unit addWeaponGlobal _randomWeapon;	        
	        _unit addPrimaryWeaponItem "CUP_acc_Flashlight";
	        _vest addMagazineCargoGlobal ["CUP_30Rnd_9x19_EVO", 7];
	    };
	    
	    if (_randomWeapon == "CUP_smg_MP5A5") then
	    {
            _unit addMagazineGlobal "CUP_30Rnd_9x19_MP5";
            _unit addWeaponGlobal _randomWeapon;	        
	        _vest addMagazineCargoGlobal ["CUP_30Rnd_9x19_MP5", 7];
	    };
	    
	    if (_randomWeapon == "CUP_sgun_AA12") then
	    {
            _unit addMagazineGlobal "CUP_20Rnd_B_AA12_Pellets";
            _unit addWeaponGlobal _randomWeapon;	        
	        _vest addMagazineCargoGlobal ["CUP_20Rnd_B_AA12_Pellets", 3];
	        _vest addMagazineCargoGlobal ["CUP_20Rnd_B_AA12_74Slug", 2];
	    };
	    
	    if (_randomWeapon == "CUP_sgun_M1014") then
	    {
            _unit addMagazineGlobal "CUP_8Rnd_B_Beneli_74Pellets";
            _unit addWeaponGlobal _randomWeapon;	        
	        _vest addMagazineCargoGlobal ["CUP_8Rnd_B_Beneli_74Pellets", 4];
	        _vest addMagazineCargoGlobal ["CUP_8Rnd_B_Beneli_74Slug", 3];
	    };
	    
	    if (_randomWeapon == "CUP_sgun_Saiga12K") then
	    {
            _unit addMagazineGlobal "CUP_8Rnd_B_Saiga12_74Pellets_M";
            _unit addWeaponGlobal _randomWeapon;	        
	        _vest addMagazineCargoGlobal ["CUP_8Rnd_B_Saiga12_74Pellets_M", 4];
	        _vest addMagazineCargoGlobal ["CUP_8Rnd_B_Saiga12_74Slug_M", 3];
	    };
	    
	    if (_randomWeapon == "CUP_arifle_AKS" OR _randomWeapon == "CUP_arifle_AKS_Gold") then 
	    {
            _unit addMagazineGlobal "CUP_30Rnd_762x39_AK47_M";  
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["CUP_30Rnd_762x39_AK47_M", 6];
	    };
	    
	    if (_randomWeapon == "CUP_arifle_AKS74U") then 
	    {
            _unit addMagazineGlobal "CUP_30Rnd_545x39_AK_M";  
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["CUP_30Rnd_545x39_AK_M", 6];
	    };
	    
	    if (_randomWeapon == "CUP_arifle_Sa58V") then 
	    {
            _unit addMagazineGlobal "CUP_30Rnd_Sa58_M";  
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["CUP_30Rnd_Sa58_M", 6];
	    };
	    
	    if (_randomWeapon == "CUP_arifle_G36C" OR _randomWeapon == "CUP_arifle_M16A2" OR _randomWeapon == "CUP_arifle_M4A1" OR _randomWeapon == "CUP_arifle_Mk16_CQC" OR _randomWeapon == "CUP_arifle_XM8_Compact") then 
	    {
            _unit addMagazineGlobal "30Rnd_556x45_Stanag";
            _unit addWeaponGlobal _randomWeapon;	    	  
	        _vest addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 6];
	    };
	    
	    if (_randomWeapon == "CUP_srifle_LeeEnfield") then 
	    {
            _unit addMagazineGlobal "CUP_10x_303_M";  
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["CUP_10x_303_M", 6];
	    };    
    };
    
    if (isClass(configFile >> "CfgPatches" >> "rhsusf_main")) then 
    {
	    if (_randomWeapon == "RHS_WEAP_M16A4" OR _randomWeapon == "RHS_WEAP_M16A4_CARRYHANDLE" OR _randomWeapon == "RHS_WEAP_M16A4_GRIP" OR _randomWeapon == "RHS_WEAP_M16A4_CARRYHANDLE_GRIP" OR _randomWeapon == "RHS_WEAP_M4A1" OR _randomWeapon == "RHS_WEAP_M4A1_CARRYHANDLE" OR _randomWeapon == "RHS_WEAP_M4A1_GRIP" OR _randomWeapon == "RHS_WEAP_M4A1_CARRYHANDLE_GRIP") then 
	    {
            _unit addMagazineGlobal "30Rnd_556x45_Stanag";
            _unit addWeaponGlobal _randomWeapon;	    	  
	        _unit addPrimaryWeaponItem "acc_flashlight";
	        _vest addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 6];
	    };    
	    
		if (_randomWeapon == "rhs_weap_M590_8RD") then
	    {
            _unit addMagazineGlobal "rhsusf_8Rnd_00Buck";
            _unit addWeaponGlobal _randomWeapon;	        
	        _vest addMagazineCargoGlobal ["rhsusf_8Rnd_00Buck", 4];
	        _vest addMagazineCargoGlobal ["rhsusf_8Rnd_Slug", 3];
	    };
	    
	    if (_randomWeapon == "rhs_weap_M590_5RD") then
	    {
            _unit addMagazineGlobal "rhsusf_5Rnd_00Buck";
            _unit addWeaponGlobal _randomWeapon;	        
	        _vest addMagazineCargoGlobal ["rhsusf_5Rnd_00Buck", 5];
	        _vest addMagazineCargoGlobal ["rhsusf_5Rnd_Slug", 4];
	    };
	    
	    if (_randomWeapon == "RHSUSF_WEAP_GLOCK17G4") then 
	    {
            _unit addMagazineGlobal "rhsusf_mag_17Rnd_9x19_FMJ";
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["rhsusf_mag_17Rnd_9x19_FMJ", 4];
	        _vest addMagazineCargoGlobal ["rhsusf_mag_17Rnd_9x19_JHP", 4];
	    };
	    
	    if (_randomWeapon == "RHSUSF_WEAP_M1911A1") then 
	    {
            _unit addMagazineGlobal "rhsusf_mag_7x45acp_MHP";
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["rhsusf_mag_7x45acp_MHP", 8];
	    };     
        
	    if (_randomWeapon == "rhsusf_weap_m9") then 
	    {
            _unit addMagazineGlobal "rhsusf_mag_15Rnd_9x19_FMJ";
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["rhsusf_mag_15Rnd_9x19_FMJ", 4];
	        _vest addMagazineCargoGlobal ["rhsusf_mag_15Rnd_9x19_JHP", 4];
	    };      
    };

    
    if (isClass(configFile >> "CfgPatches" >> "rhs_main")) then 
    {
	    if (_randomWeapon == "rhs_weap_ak74m_folded") then 
	    {
            _unit addMagazineGlobal "rhs_30Rnd_545x39_AK";  
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["rhs_30Rnd_545x39_AK", 6];
	    };
	    
	    if (_randomWeapon == "rhs_weap_akms") then 
	    {
            _unit addMagazineGlobal "rhs_30Rnd_762x39mm";  
            _unit addWeaponGlobal _randomWeapon;
	        _vest addMagazineCargoGlobal ["rhs_30Rnd_762x39mm", 6];
	    };
	    
	    if (_randomWeapon == "rhs_weap_pya") then 
	    {
            _unit addMagazineGlobal "rhs_mag_9x19_17";
            _unit addWeaponGlobal _randomWeapon;
	        _vest addMagazineCargoGlobal ["rhs_mag_9x19_17", 8];
	    };
	    
	    if (_randomWeapon == "rhs_weap_makarov_pmm") then 
	    {
            _unit addMagazineGlobal "rhs_mag_9x18_12_57N181S";
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["rhs_mag_9x18_12_57N181S", 8];
	    };  
    };
    
    if (isClass(configFile >> "CfgPatches" >> "mas_weapons")) then 
    {
		if (_randomWeapon == "hgun_mas_acp_F") then
	    {
            _unit addMagazineGlobal "8Rnd_mas_45acp_Mag";
            _unit addWeaponGlobal _randomWeapon;	        
	        _unit addHandgunItem "acc_mas_flash_gun";
	        _vest addMagazineCargoGlobal ["8Rnd_mas_45acp_Mag", 8];
	    };
	    
	    if (_randomWeapon == "hgun_mas_bhp_F" OR _randomWeapon == "hgun_mas_p226_F") then
	    {
            _unit addMagazineGlobal "13Rnd_mas_9x21_Mag";
            _unit addWeaponGlobal _randomWeapon;	        
	        _unit addHandgunItem "acc_mas_flash_gun";
	        _vest addMagazineCargoGlobal ["13Rnd_mas_9x21_Mag", 8];
	    };
	    
	    if (_randomWeapon == "hgun_mas_glock_F" OR _randomWeapon == "hgun_mas_grach_F") then
	    {
            _unit addMagazineGlobal "17Rnd_mas_9x21_Mag";
            _unit addWeaponGlobal _randomWeapon;	        
	        _unit addHandgunItem "acc_mas_flash_gun";
	        _vest addMagazineCargoGlobal ["17Rnd_mas_9x21_Mag", 8];
	    };
	    
	    if (_randomWeapon == "hgun_mas_m23_F") then
	    {
            _unit addMagazineGlobal "10Rnd_mas_45acp_Mag";
            _unit addWeaponGlobal _randomWeapon;	        
	        _unit addHandgunItem "acc_mas_flash_gun";
	        _vest addMagazineCargoGlobal ["10Rnd_mas_45acp_Mag", 8];
	    };
	    
	    if (_randomWeapon == "hgun_mas_m9_F") then
	    {
            _unit addMagazineGlobal "15Rnd_mas_9x21_Mag";
            _unit addWeaponGlobal _randomWeapon;	        
	        _unit addHandgunItem "acc_mas_flash_gun";
	        _vest addMagazineCargoGlobal ["15Rnd_mas_9x21_Mag", 8];
	    };
	    
	    if (_randomWeapon == "hgun_mas_mak_F") then
	    {
            _unit addMagazineGlobal "8Rnd_mas_9x18_Mag";
            _unit addWeaponGlobal _randomWeapon;	        
	        _vest addMagazineCargoGlobal ["8Rnd_mas_9x18_Mag", 8];
	    };
	    
	    if (_randomWeapon == "hgun_mas_usp_F" OR _randomWeapon == "hgun_mas_usp_l_F") then
	    {
            _unit addMagazineGlobal "12Rnd_mas_45acp_Mag";
            _unit addWeaponGlobal _randomWeapon;	        
	        _unit addHandgunItem "acc_mas_flash_gun";
	        _vest addMagazineCargoGlobal ["12Rnd_mas_45acp_Mag", 8];
	    };
	    
	    if (_randomWeapon == "arifle_mas_bizon") then
	    {
            _unit addMagazineGlobal "64Rnd_mas_9x18_mag";
            _unit addWeaponGlobal _randomWeapon;	        
	        _unit addPrimaryWeaponItem "acc_flashlight";
	        _vest addMagazineCargoGlobal ["64Rnd_mas_9x18_mag", 4];
	    };
	    
	    if (_randomWeapon == "arifle_mas_mp40" OR _randomWeapon == "arifle_mas_mp40_o" OR _randomWeapon == "arifle_mas_sten" OR _randomWeapon == "arifle_mas_mp5") then
	    {
            _unit addMagazineGlobal "30Rnd_9x21_Mag";
            _unit addWeaponGlobal _randomWeapon;	        
	        _vest addMagazineCargoGlobal ["30Rnd_9x21_Mag", 7];
	    };
	    
	    if (_randomWeapon == "arifle_mas_mp5") then
	    {
            _unit addMagazineGlobal "30Rnd_9x21_Mag";
            _unit addWeaponGlobal _randomWeapon;	        
	        _unit addPrimaryWeaponItem "acc_flashlight";
	        _vest addMagazineCargoGlobal ["30Rnd_9x21_Mag", 7];
	    };
	    
	    if (_randomWeapon == "hgun_mas_mp7_F") then
	    {
            _unit addMagazineGlobal "40Rnd_mas_46x30_Mag";
            _unit addWeaponGlobal _randomWeapon;	        
	        _unit addPrimaryWeaponItem "acc_flashlight";
	        _vest addMagazineCargoGlobal ["40Rnd_mas_46x30_Mag", 7];
	    };
	    
	    if (_randomWeapon == "hgun_mas_uzi_F") then
	    {
            _unit addMagazineGlobal "25Rnd_mas_9x19_Mag";
            _unit addWeaponGlobal _randomWeapon;	        
	        _vest addMagazineCargoGlobal ["25Rnd_mas_9x19_Mag", 7];
	    };
	    
	    if (_randomWeapon == "hgun_mas_mp7p_F") then
	    {
            _unit addMagazineGlobal "40Rnd_mas_46x30_Mag";
            _unit addWeaponGlobal _randomWeapon;	        
	        _unit addHandGunItem "acc_flashlight";
	        _vest addMagazineCargoGlobal ["40Rnd_mas_46x30_Mag", 7];
	    };
	    
	    if (_randomWeapon == "hgun_mas_sa61_F") then
	    {
            _unit addMagazineGlobal "20Rnd_mas_765x17_Mag";
            _unit addWeaponGlobal _randomWeapon;	        
	        _vest addMagazineCargoGlobal ["20Rnd_mas_765x17_Mag", 7];
	    };
	    
	    if (_randomWeapon == "arifle_mas_aa12") then
	    {
            _unit addMagazineGlobal "20Rnd_mas_12Gauge_Pellets";
            _unit addWeaponGlobal _randomWeapon;	        
	        _unit addPrimaryWeaponItem "acc_flashlight";
	        _vest addMagazineCargoGlobal ["20Rnd_mas_12Gauge_Pellets", 3];
	        _vest addMagazineCargoGlobal ["20Rnd_mas_12Gauge_Slug", 2];
	    };
	    
	    if (_randomWeapon == "arifle_mas_m1014") then
	    {
            _unit addMagazineGlobal "7Rnd_mas_12Gauge_Pellets";
            _unit addWeaponGlobal _randomWeapon;	        
	        _unit addPrimaryWeaponItem "acc_flashlight";
	        _vest addMagazineCargoGlobal ["7Rnd_mas_12Gauge_Pellets", 4];
	        _vest addMagazineCargoGlobal ["7Rnd_mas_12Gauge_Slug", 3];
	    };
	    
	    if (_randomWeapon == "arifle_mas_saiga") then
	    {
            _unit addMagazineGlobal "10Rnd_mas_12Gauge_Pellets";
            _unit addWeaponGlobal _randomWeapon;	        
	        _unit addPrimaryWeaponItem "acc_flashlight";
	        _vest addMagazineCargoGlobal ["10Rnd_mas_12Gauge_Pellets", 4];
	        _vest addMagazineCargoGlobal ["10Rnd_mas_12Gauge_Slug", 3];
	    };
	    
	    if (_randomWeapon == "arifle_mas_akms") then 
	    {
            _unit addMagazineGlobal "30Rnd_mas_762x39_mag";
            _unit addWeaponGlobal _randomWeapon;	    	  
	        _vest addMagazineCargoGlobal ["30Rnd_mas_762x39_mag", 6];
	    };
	    
	    if (_randomWeapon == "arifle_mas_aks74u" OR _randomWeapon == "arifle_mas_aks74u_c") then 
	    {
            _unit addMagazineGlobal "30Rnd_mas_545x39_mag";
            _unit addWeaponGlobal _randomWeapon;	    	  
	        _unit addPrimaryWeaponItem "acc_flashlight";
	        _vest addMagazineCargoGlobal ["30Rnd_mas_545x39_mag", 6];
	    };
	    
	    if (_randomWeapon == "arifle_mas_arx" OR _randomWeapon == "arifle_mas_g36c" OR _randomWeapon == "arifle_mas_hk416c" OR _randomWeapon == "arifle_mas_m4vlt" OR _randomWeapon == "arifle_mas_m4c" OR _randomWeapon == "arifle_mas_mk16") then 
	    {
            _unit addMagazineGlobal "30Rnd_mas_556x45_Stanag";
            _unit addWeaponGlobal _randomWeapon;	    	  
	        _unit addPrimaryWeaponItem "acc_flashlight";
	        _vest addMagazineCargoGlobal ["30Rnd_mas_556x45_Stanag", 6];
	    };
	    
	    if (_randomWeapon == "arifle_mas_lee") then 
	    {
            _unit addMagazineGlobal "5Rnd_mas_762x51_Stanag";
            _unit addWeaponGlobal _randomWeapon;	    	  
	        _unit addPrimaryWeaponItem "acc_flashlight";
	        _vest addMagazineCargoGlobal ["5Rnd_mas_762x51_Stanag", 11];
	    };    
    };
    
    if (isClass(configFile >> "CfgPatches" >> "hlc_wp_mp5")) then
    {
    	if (_randomWeapon == "hlc_smg_mp5k") then
	    {
            _unit addWeaponGlobal _randomWeapon;
	        _unit addMagazineGlobal "hlc_30Rnd_9x19_B_MP5";
	        _vest addMagazineCargoGlobal ["hlc_30Rnd_9x19_B_MP5", 7];
	    };
	    
	    if (_randomWeapon == "hlc_smg_mp5k_PDW" OR _randomWeapon == "hlc_smg_mp5a2" OR _randomWeapon == "hlc_smg_mp5a3") then 
	    {
            _unit addMagazineGlobal "hlc_30Rnd_9x19_B_MP5";  
            _unit addWeaponGlobal _randomWeapon;	    	
	        _vest addMagazineCargoGlobal ["hlc_30Rnd_9x19_B_MP5", 7];
	    };
	    
	    if (_randomWeapon == "hlc_smg_mp5a4" OR _randomWeapon == "hlc_smg_mp5n" OR _randomWeapon == "hlc_smg_mp510") then 
	    {
            _unit addMagazineGlobal "hlc_30Rnd_9x19_B_MP5";
            _unit addWeaponGlobal _randomWeapon;	    	  
	        _unit addPrimaryWeaponItem "acc_flashlight";
	        _vest addMagazineCargoGlobal ["hlc_30Rnd_9x19_B_MP5", 7];
	    };    
    };
    
    if (isClass(configFile >> "CfgPatches" >> "hlc_wp_ak")) then 
    {
	    if (_randomWeapon == "hlc_rifle_saiga12k") then
	    {
            _unit addMagazineGlobal "hlc_10rnd_12g_buck_S12";
            _unit addWeaponGlobal _randomWeapon;	        
	        _vest addMagazineCargoGlobal ["hlc_10rnd_12g_buck_S12", 4];
	        _vest addMagazineCargoGlobal ["hlc_10rnd_12g_slug_S12", 3];
	    };
	    
	    if (_randomWeapon == "hlc_rifle_aku12") then 
	    {
            _unit addMagazineGlobal "hlc_30Rnd_545x39_B_AK";
            _unit addWeaponGlobal _randomWeapon;	    	  
	        _unit addPrimaryWeaponItem "acc_flashlight";
	        _vest addMagazineCargoGlobal ["hlc_30Rnd_545x39_B_AK", 6];
	    };
	    
	    if (_randomWeapon == "hlc_rifle_aks74u") then 
	    {
            _unit addMagazineGlobal "hlc_30Rnd_545x39_B_AK";
            _unit addWeaponGlobal _randomWeapon;	    	  
	        _vest addMagazineCargoGlobal ["hlc_30Rnd_545x39_B_AK", 6];
	    };
	    
	    if (_randomWeapon == "hlc_rifle_ak47" OR _randomWeapon == "hlc_rifle_akm") then 
	    {
            _unit addMagazineGlobal "hlc_30Rnd_762x39_b_ak";
            _unit addWeaponGlobal _randomWeapon;	    	  
	        _vest addMagazineCargoGlobal ["hlc_30Rnd_762x39_b_ak", 6];
	    };    
    };
    
    if (isClass(configFile >> "CfgPatches" >> "hlc_wp_AR15")) then 
    {
	    if (_randomWeapon == "hlc_rifle_honeybadger") then 
	    {
            _unit addMagazineGlobal "29rnd_300BLK_STANAG";
            _unit addWeaponGlobal _randomWeapon;	    	  
	        _unit addPrimaryWeaponItem "acc_flashlight";
	        _vest addMagazineCargoGlobal ["29rnd_300BLK_STANAG", 6];
	    };
	    
	    if (_randomWeapon == "hlc_rifle_vendimus" OR _randomWeapon == "hlc_rifle_Bushmaster300") then 
	    {
            _unit addMagazineGlobal "29rnd_300BLK_STANAG";
            _unit addWeaponGlobal _randomWeapon;	    	  
	        _vest addMagazineCargoGlobal ["29rnd_300BLK_STANAG", 6];
	    };
	    
	    if (_randomWeapon == "hlc_rifle_RU5562" OR _randomWeapon == "hlc_rifle_RU556" OR _randomWeapon == "hlc_rifle_bcmjack" OR _randomWeapon == "hlc_rifle_M4" OR _randomWeapon == "hlc_rifle_CQBR") then 
	    {
            _unit addMagazineGlobal "hlc_30rnd_556x45_EPR";
            _unit addWeaponGlobal _randomWeapon;	    	  
	        _unit addPrimaryWeaponItem "acc_flashlight";
	        _vest addMagazineCargoGlobal ["hlc_30rnd_556x45_EPR", 6];
	    };
	    
	    if (_randomWeapon == "hlc_rifle_Colt727") then 
	    {
            _unit addMagazineGlobal "30Rnd_556x45_Stanag";
            _unit addWeaponGlobal _randomWeapon;	    	  
	        _vest addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 6];
	    };    
    };
    
	/* Assigned items (maps, radios, NV Goggles, etc */
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    if (pht6_parameter_radio == 1) then {
        _unit linkItem "ItemRadio";
    };
    
    if (pht6_parameter_playerFAK > 0) then {
        _vest addItemCargoGlobal ["FirstAidKit", pht6_parameter_playerFAK];
    };
    if (pht6_parameter_playerThrowableGrenades > 0) then {
        _vest addMagazineCargoGlobal ["HandGrenade", pht6_parameter_playerThrowableGrenades-1];
    };
    if (pht6_parameter_playerThrowableMiniGrenades > 0) then {
        _vest addMagazineCargoGlobal ["MiniGrenade", pht6_parameter_playerThrowableMiniGrenades-1];
    };
    if (pht6_parameter_playerThrowableSmokeGrenades > 0) then {
        _vest addMagazineCargoGlobal ["SmokeShell", pht6_parameter_playerThrowableSmokeGrenades-1];
    };
    if (pht6_parameter_playerThrowableChemLights > 0) then {
        _vest addMagazineCargoGlobal ["Chemlight_yellow", pht6_parameter_playerThrowableChemLights-1];
    };
    
    _unit selectWeapon "this";
    reload _unit;  
};
