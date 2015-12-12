if (isServer) then {
	switch (_this select 0) do {
		case 0: {pht6_parameter_enemySkill = 1000};
 		case 1: {pht6_parameter_enemySkill = 0.0};
  		case 2: {pht6_parameter_enemySkill = 0.1};
  		case 3: {pht6_parameter_enemySkill = 0.2};
  		case 4: {pht6_parameter_enemySkill = 0.3};
        case 5: {pht6_parameter_enemySkill = 0.4};
        case 6: {pht6_parameter_enemySkill = 0.5};
        case 7: {pht6_parameter_enemySkill = 0.6};
        case 8: {pht6_parameter_enemySkill = 0.7};
        case 9: {pht6_parameter_enemySkill = 0.8};
        case 10: {pht6_parameter_enemySkill = 0.9};
        case 11: {pht6_parameter_enemySkill = 1.0};
	};
	true;
};