if (isServer) then {
	switch (_this select 0) do {
		case 0: {pht6_parameter_spawnType = 0}; // Random Marker-based Nearest Building
		case 1: {pht6_parameter_spawnType = 1}; // Random Marker-based Nearest Building (Avoid Water)
        case 2: {pht6_parameter_spawnType = 2}; // Random Locations ["NameCityCapital"]
        case 3: {pht6_parameter_spawnType = 3}; // Random Locations ["NameCityCapital","NameCity"]
        case 4: {pht6_parameter_spawnType = 4}; // Random Locations ["NameCityCapital","NameCity","NameVillage"]
        case 5: {pht6_parameter_spawnType = 5}; // Random Locations ["NameCityCapital","NameCity","NameVillage","NameLocal"]
        case 6: {pht6_parameter_spawnType = 6}; // Random Locations ["NameMarine"]
        case 7: {pht6_parameter_spawnType = 7}; // Random Creator Defined Buildings
	};
	true;
};