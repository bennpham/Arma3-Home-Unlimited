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
		case 8: {pht6_parameter_spawnType = 8}; // B25
		case 9: {pht6_parameter_spawnType = 9}; // Banana Plantation
		case 10: {pht6_parameter_spawnType = 10}; // Blue Pearl Cargos
		case 11: {pht6_parameter_spawnType = 11}; // Blue Pearl Ship
		case 12: {pht6_parameter_spawnType = 12}; // Cliffs
		case 13: {pht6_parameter_spawnType = 13}; // Comms Bravo Peak
		case 14: {pht6_parameter_spawnType = 14}; // Fortress Ruins
		case 15: {pht6_parameter_spawnType = 15}; // G4M
		case 16: {pht6_parameter_spawnType = 16}; // Georgetown Artillery Site
		case 17: {pht6_parameter_spawnType = 17}; // Georgetown Bunkers
		case 18: {pht6_parameter_spawnType = 18}; // Georgetown Office Building
		case 19: {pht6_parameter_spawnType = 19}; // Harcourt Shopping Center
		case 20: {pht6_parameter_spawnType = 20}; // Hotel Resort
		case 21: {pht6_parameter_spawnType = 21}; // Katkoula Pizzaria
		case 22: {pht6_parameter_spawnType = 22}; // Kotomo Mountain Fortress
		case 23: {pht6_parameter_spawnType = 23}; // La Rochelle Artillery Bunker 
		case 24: {pht6_parameter_spawnType = 24}; // Lijnhaven Port Shopping Center
		case 25: {pht6_parameter_spawnType = 25}; // Liquor Town
		case 26: {pht6_parameter_spawnType = 26}; // Northwest Artillery Base
		case 27: {pht6_parameter_spawnType = 27}; // Plantation
		case 28: {pht6_parameter_spawnType = 28}; // Railroad Hobos
		case 29: {pht6_parameter_spawnType = 29}; // Saint Julien Bunker
		case 30: {pht6_parameter_spawnType = 30}; // Southern Ruins
		case 31: {pht6_parameter_spawnType = 31}; // Southwest Caves
		case 32: {pht6_parameter_spawnType = 32}; // Tanoa Sugar Company
		case 33: {pht6_parameter_spawnType = 33}; // Tanouka Mansion
		case 34: {pht6_parameter_spawnType = 34}; // Tavu Beach Bunkers
		case 35: {pht6_parameter_spawnType = 35}; // Tavu Bunkers
		case 36: {pht6_parameter_spawnType = 36}; // Tuvanaka
		case 37: {pht6_parameter_spawnType = 37}; // Western Islands Bunker
	};
	true;
};