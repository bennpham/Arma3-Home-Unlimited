if (isServer) then {
	switch (_this select 0) do {
		case 0: {pht6_parameter_playerWeapRifles = 0};
		case 1: {pht6_parameter_playerWeapRifles = 1}; // Assault Rifles ONLY
        case 2: {pht6_parameter_playerWeapRifles = 2}; // Lee Enfield ONLY (Requires CUP or Massi)
        case 3: {pht6_parameter_playerWeapRifles = 3}; // Assault Rifles OR Lee Enfields
	};
	true;
};