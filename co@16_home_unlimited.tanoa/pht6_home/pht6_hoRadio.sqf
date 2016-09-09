if (isServer) then {
	switch (_this select 0) do {
		case 0: {pht6_parameter_radio = 0};
 		case 1: {pht6_parameter_radio = 1};
	};
	true;
};