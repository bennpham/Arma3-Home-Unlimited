if (isServer) then {
	switch (_this select 0) do {
		case 0: {pht6_parameter_enemyWeapSmgs = 0};
		case 1: {pht6_parameter_enemyWeapSmgs = 1}; // WW2 SMGs only (Requires Massi)
        case 2: {pht6_parameter_enemyWeapSmgs = 2}; // All SMGs
	};
	true;
};