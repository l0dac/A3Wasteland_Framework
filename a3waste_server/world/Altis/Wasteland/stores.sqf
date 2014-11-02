private ["_data", "_store_positions"];



// Store General
_storeGeneral_npcInfo	 = [[[11527.8,9425.66,3.59929], 60, "U_IG_Guerilla2_2", []],
							[[20780.7,6800.25,3.64345], 67, "U_IG_Guerilla2_2", []],
							[[18082.9,15242.2,3.66354], 50,  "U_IG_Guerilla2_2", []],
							[[9266.16,15867.3,0.388695], 76, "U_IG_Guerilla2_2", []],
							[[4565.2,21377.1,0.946716], 330, "U_IG_Guerilla2_2", []]];


_storeGeneral_objectPos =   [[["Land_CashDesk_F", [11529.2,9426.39,3.39511], 230]],
								[["Land_CashDesk_F", [20781.9,6800.71,3.3951], 240]],
								[["Land_CashDesk_F", [18084.1,15242.9,3.38244],  226]],
								[["Land_CashDesk_F", [9267.53,15867.4,0.41597], 263]],
								[["Land_CashDesk_F", [4564.39,21378.3,0.534912], 131]]];

_storeGeneral = [_storeGeneral_npcInfo, _storeGeneral_objectPos];


// Store Weapons
_storeWeapons_npcInfo	 = [[[3367.8,13201.7,0.00144053],    325, "U_B_SpecopsUniform_sgg" , []],
							[[16706.5,12779.9,0.00144005],   35, "U_B_SpecopsUniform_sgg", []],
							[[25785.3,21363.5,3.55448], 134, "U_I_CombatUniform_tshirt", []],
							[[9435.77,20267.6,0.00144196],   73, "U_IG_Guerilla1_1", []]];

_storeWeapons_objectPos =   [[],
								[],
								[],
								[]];
_storeWeapons = [_storeWeapons_npcInfo, _storeWeapons_objectPos];


// Store Vehicles
_storeVehicles_npcInfo	 = [[[26718.7,24601.9,0.00143814],    310, "U_Competitor", []],
							[[22959.5,18879.8,0.00143576],  130, "U_Competitor", ["Boats"]],
							[[20748.2,7272.63,0.00143623], 125, "U_Competitor", ["Boats"]],
							[[14485.9,16339.9,0.00143433], 200, "U_Competitor", ["Boats"]],
							[[3975.46,15073.5,0.00174665], 240, "U_Competitor", ["Planes"]]
						  ];

_storeVehicles_objectPos =  [[],
								[],
								[],
								[],
								[]];

_storeVehicles = [_storeVehicles_npcInfo, _storeVehicles_objectPos];


_data = [_storeGeneral,
		_storeWeapons,
		_storeVehicles];
_data