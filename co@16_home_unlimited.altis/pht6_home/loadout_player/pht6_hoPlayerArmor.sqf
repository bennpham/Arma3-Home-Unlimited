if (isServer) then {
	switch (_this select 0) do {
		case 0: {pht6_parameter_playerArmor = 0};
		case 1: {pht6_parameter_playerArmor = 1};
        case 2: {pht6_parameter_playerArmor = 2};
        case 3: {pht6_parameter_playerArmor = 3};
        case 4: {pht6_parameter_playerArmor = 4};
	};
	true;
};