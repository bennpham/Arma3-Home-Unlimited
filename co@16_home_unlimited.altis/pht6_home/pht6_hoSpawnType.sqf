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
		case 8: {pht6_parameter_spawnType = 8}; // Abdera
		case 9: {pht6_parameter_spawnType = 9}; // Agios Dionysios
		case 10: {pht6_parameter_spawnType = 10}; // Athira
		case 11: {pht6_parameter_spawnType = 11}; // Athira Factory
		case 12: {pht6_parameter_spawnType = 12}; // Cap Strigla
		case 13: {pht6_parameter_spawnType = 13}; // Charkia
		case 14: {pht6_parameter_spawnType = 14}; // Ghost Hotel
		case 15: {pht6_parameter_spawnType = 15}; // Kastro Castle
		case 16: {pht6_parameter_spawnType = 16}; // Kavala
		case 17: {pht6_parameter_spawnType = 17}; // Kavala Office Complex
		case 18: {pht6_parameter_spawnType = 18}; // Kavala Hospital
		case 19: {pht6_parameter_spawnType = 19}; // Neochori
		case 20: {pht6_parameter_spawnType = 20}; // Oreokastro Church
		case 21: {pht6_parameter_spawnType = 21}; // Paros
		case 22: {pht6_parameter_spawnType = 22}; // Pyrgos
		case 23: {pht6_parameter_spawnType = 23}; // Pyrgos Office Complex
		case 24: {pht6_parameter_spawnType = 24}; // Sofia
		case 25: {pht6_parameter_spawnType = 25}; // Syrta
		case 26: {pht6_parameter_spawnType = 26}; // Thronos
		case 27: {pht6_parameter_spawnType = 27}; // Zaros Church
	};
	true;
};