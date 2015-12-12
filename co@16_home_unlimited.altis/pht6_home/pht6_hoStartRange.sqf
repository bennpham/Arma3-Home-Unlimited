if (isServer) then {
	switch (_this select 0) do {
		case 0: {pht6_parameter_startDistance = 50};
		case 1: {pht6_parameter_startDistance = 100};
		case 2: {pht6_parameter_startDistance = 150};
		case 3: {pht6_parameter_startDistance = 200};
		case 4: {pht6_parameter_startDistance = 300};
        case 5: {pht6_parameter_startDistance = 400};
        case 6: {pht6_parameter_startDistance = 500};
        case 7: {pht6_parameter_startDistance = 600};
        case 8: {pht6_parameter_startDistance = 700};
        case 9: {pht6_parameter_startDistance = 800};
	};
	true;
};