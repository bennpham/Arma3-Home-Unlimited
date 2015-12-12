if (isServer) then {
	switch (_this select 0) do {
		case 0: {pht6_parameter_playerWeapPistols = 0};
		case 1: {pht6_parameter_playerWeapPistols = 1};
	};
	true;
};