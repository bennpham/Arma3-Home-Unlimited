if (isServer) then {
	switch (_this select 0) do {
		case 0: {pht6_parameter_enemyWeapPistols = 0};
		case 1: {pht6_parameter_enemyWeapPistols = 1};
	};
	true;
};