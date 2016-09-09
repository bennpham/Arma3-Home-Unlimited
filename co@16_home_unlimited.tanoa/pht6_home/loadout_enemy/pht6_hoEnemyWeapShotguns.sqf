if (isServer) then {
	switch (_this select 0) do {
		case 0: {pht6_parameter_enemyWeapShotguns = 0};
		case 1: {pht6_parameter_enemyWeapShotguns = 1}; // Shotguns No AA12
        case 2: {pht6_parameter_enemyWeapShotguns = 2}; // All Shotguns
	};
	true;
};