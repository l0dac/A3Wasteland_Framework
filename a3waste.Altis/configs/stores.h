class CfgShopList
{
	handguns[] = {
			{"hgun_P07_F", 50},
			{"hgun_Rook40_F", 50},
			{"hgun_ACPC2_F", 75},
			{"hgun_Pistol_heavy_02_F", 75},
			{"hgun_Pistol_heavy_01_F", 100}
			};

	smgs[] = 	{
			{"hgun_PDW2000_F", 100},
			{"SMG_02_F", 125},
			{"SMG_01_F", 125}
			};

	rifles[] =	{
			// Underwater Gun
			{"arifle_SDAR_F", 100},

			// Assault Rifles
			{"arifle_Mk20C_plain_F", 150},
			{"arifle_Mk20C_F", 175},
			{"arifle_Mk20_plain_F", 200},
			{"arifle_Mk20_F", 200},
			{"arifle_Mk20_GL_plain_F", 250},
			{"arifle_Mk20_GL_F", 250},

			{"arifle_TRG20_F", 150},
			{"arifle_TRG21_F", 200},
			{"arifle_TRG21_GL_F", 250},

			{"arifle_Katiba_C_F", 150},
			{"arifle_Katiba_F", 200},
			{"arifle_Katiba_GL_F", 250},

			{"arifle_MXC_F", 150},
			{"arifle_MXC_Black_F", 175},
			{"arifle_MX_F", 200},
			{"arifle_MX_Black_F", 225},
			{"arifle_MX_GL_F", 250},
			{"arifle_MX_GL_Black_F", 275},

			// Markman Rifles
			{"arifle_MXM_F", 300},
			{"arifle_MXM_Black_F", 325},
			{"srifle_DMR_01_F", 400},
			{"srifle_EBR_F", 450},

			// Sniper Rifles
			{"srifle_LRR_SOS_F", 1000},
			{"srifle_LRR_camo_SOS_F", 1150},
			{"srifle_GM6_SOS_F", 1100},
			{"srifle_GM6_camo_SOS_F", 1250}
			};

	lmgs[] = 	{
			{"arifle_MX_SW_F", 300},
			{"arifle_MX_SW_Black_F", 325},
			{"LMG_Mk200_F", 375},
			{"LMG_Zafir_F", 450}
			};

	launchers[] = {
			{"launch_RPG32_F", 400},
			{"launch_Titan_short_F", 500},
			{"launch_NLAW_F", 600},
			{"launch_Titan_F", 600}
			};

	static_guns[] = {
			// {"Vehicle Ammo Crate", "Box_NATO_AmmoVeh_F", 2500},
			{"B_static_AT_F", 4000}, // Static launchers only have 4 ammo, hence the lower price
			{"O_static_AT_F", 4000},
			{"I_static_AT_F", 4000},
			{"B_static_AA_F", 4500},
			{"O_static_AA_F", 4500},
			{"I_static_AA_F", 4500},
			{"B_HMG_01_F", 5000},
			{"O_HMG_01_F", 5000},
			{"I_HMG_01_F", 5000},
			{"B_HMG_01_high_F", 5500},
			{"O_HMG_01_high_F", 5500},
			{"I_HMG_01_high_F", 5500},
			{"B_GMG_01_F", 7500},
			{"O_GMG_01_F", 7500},
			{"I_GMG_01_F", 7500},
			{"B_GMG_01_high_F", 8000},
			{"O_GMG_01_high_F", 8000},
			{"I_GMG_01_high_F", 8000},
			{"B_Mortar_01_F", 12500},
			{"O_Mortar_01_F", 12500},
			{"I_Mortar_01_F", 12500}
			};

	throw_put[] = {
			{"MiniGrenade", 50},
			{"HandGrenade", 100},
			{"APERSTripMine_Wire_Mag", 200},
			{"APERSBoundingMine_Range_Mag", 250},
			{"APERSMine_Range_Mag", 300},
			{"ClaymoreDirectionalMine_Remote_Mag", 350},
			{"SLAMDirectionalMine_Wire_Mag", 350},
			{"ATMine_Range_Mag", 400},
			{"DemoCharge_Remote_Mag", 450},
			{"SatchelCharge_Remote_Mag", 500},
			{"SmokeShell", 50},
			{"SmokeShellPurple", 50},
			{"SmokeShellBlue", 50},
			{"SmokeShellGreen", 50},
			{"SmokeShellYellow", 50},
			{"SmokeShellOrange", 50},
			{"SmokeShellRed", 50}
			};

	ammo[] = {
			{"16Rnd_9x21_Mag", 10},
			{"30Rnd_9x21_Mag", 15},
			{"6Rnd_45ACP_Cylinder", 5},
			{"9Rnd_45ACP_Mag", 10},
			{"11Rnd_45ACP_Mag", 15},
			{"30Rnd_45ACP_MAG_SMG_01", 20},
			{"30Rnd_45ACP_Mag_SMG_01_tracer_green", 15},
			{"20Rnd_556x45_UW_mag", 10},
			{"30Rnd_556x45_Stanag", 20},
			{"30Rnd_556x45_Stanag_Tracer_Green", 15},
			{"30Rnd_556x45_Stanag_Tracer_Yellow", 15},
			{"30Rnd_556x45_Stanag_Tracer_Red", 15},
			{"30Rnd_65x39_caseless_mag", 20},
			{"30Rnd_65x39_caseless_mag_Tracer", 15},
			{"30Rnd_65x39_caseless_green", 20},
			{"30Rnd_65x39_caseless_green_mag_Tracer", 15},
			{"100Rnd_65x39_caseless_mag", 75},
			{"100Rnd_65x39_caseless_mag_Tracer", 50},
			{"200Rnd_65x39_cased_Box", 150},
			{"200Rnd_65x39_cased_Box_Tracer", 125},
			{"10Rnd_762x51_Mag", 15},
			{"20Rnd_762x51_Mag", 25},
			{"150Rnd_762x51_Box", 150},
			{"150Rnd_762x51_Box_Tracer", 125},
			{"7Rnd_408_Mag", 50},
			{"5Rnd_127x108_Mag", 50},
			{"5Rnd_127x108_APDS_Mag", 60},
			{"RPG32_F", 250},              // Direct damage: high      | Splash damage: low    | Guidance: none
			{"RPG32_HE_F", 250},      // Direct damage: medium    | Splash damage: medium | Guidance: none
			{"NLAW_F", 400},                // Direct damage: very high | Splash damage: low    | Guidance: laser, ground vehicles
			{"Titan_AT", 350},             // Direct damage: high      | Splash damage: low    | Guidance: mouse, laser, ground vehicles
			{"Titan_AP", 350},        // Direct damage: low       | Splash damage: high   | Guidance: mouse, laser
			{"Titan_AA", 350},              // Direct damage: low       | Splash damage: medium | Guidance: aircraft
			{"1Rnd_HE_Grenade_shell", 125},
			{"3Rnd_HE_Grenade_shell", 250},
			{"1Rnd_Smoke_Grenade_shell", 50},
			{"1Rnd_SmokePurple_Grenade_shell", 50},
			{"1Rnd_SmokeBlue_Grenade_shell", 50},
			{"1Rnd_SmokeGreen_Grenade_shell", 50},
			{"1Rnd_SmokeYellow_Grenade_shell", 50},
			{"1Rnd_SmokeOrange_Grenade_shell", 50},
			{"1Rnd_SmokeRed_Grenade_shell", 50},
			{"3Rnd_Smoke_Grenade_shell", 100},
			{"3Rnd_SmokePurple_Grenade_shell", 100},
			{"3Rnd_SmokeBlue_Grenade_shell", 100},
			{"3Rnd_SmokeGreen_Grenade_shell", 100},
			{"3Rnd_SmokeYellow_Grenade_shell", 100},
			{"3Rnd_SmokeOrange_Grenade_shell", 100},
			{"3Rnd_SmokeRed_Grenade_shell", 100},
			{"UGL_FlareWhite_F", 25},
			{"UGL_FlareGreen_F", 25},
			{"UGL_FlareYellow_F", 25},
			{"UGL_FlareRed_F", 25},
			{"UGL_FlareCIR_F", 25},
			{"3Rnd_UGL_FlareWhite_F", 50},
			{"3Rnd_UGL_FlareGreen_F", 50},
			{"3Rnd_UGL_FlareYellow_F", 50},
			{"3Rnd_UGL_FlareRed_F", 50},
			{"3Rnd_UGL_FlareCIR_F", 50}
			};

	accessories[] = {
			{"muzzle_snds_L", 50},
			{"muzzle_snds_acp", 75},
			{"muzzle_snds_M", 100},
			{"muzzle_snds_H", 100},
			{"muzzle_snds_H_MG", 125},
			{"muzzle_snds_B", 125},
			{"acc_flashlight", 25},
			{"acc_pointer_IR", 25},
			{"optic_Yorris", 50},
			{"optic_MRD", 50},
			{"optic_aco_smg", 50},
			{"optic_Holosight_smg", 50},
			{"optic_Aco", 75},
			{"optic_Aco_grn", 75},
			{"optic_Holosight", 75},
			{"optic_MRCO", 100},
			{"optic_Arco", 125},
			{"optic_Hamr", 150},
			{"optic_DMS", 175},
			{"optic_LRPS", 175},
			{"optic_SOS", 200},
			{"optic_NVS", 500},
			{"optic_tws", 1500},
			{"optic_tws_mg", 2000},
			{"optic_Nightstalker", 2500}
			};

	headgear[] = {
			{"H_HelmetB", 50},
			{"H_HelmetB_camo", 50},
			{"H_HelmetB_light", 50},
			{"H_HelmetB_paint", 50},
			{"H_HelmetSpecB", 50},
			{"H_HelmetSpecB_blk", 50},
			{"H_HelmetSpecB_paint1", 50},
			{"H_HelmetSpecB_paint2", 50},
			{"H_HelmetB_plain_blk", 50},
			{"H_HelmetO_ocamo", 50},
			{"H_HelmetO_oucamo", 50},
			{"H_HelmetLeaderO_ocamo", 50},
			{"H_HelmetLeaderO_oucamo", 50},
			{"H_HelmetSpecO_blk", 50},
			{"H_HelmetIA", 50},
			{"H_CrewHelmetHeli_B", 50},
			{"H_CrewHelmetHeli_O", 50},
			{"H_CrewHelmetHeli_I", 50},
			{"H_PilotHelmetHeli_B", 50},
			{"H_PilotHelmetHeli_O", 50},
			{"H_PilotHelmetHeli_I", 50},
			{"H_HelmetCrew_B", 50},
			{"H_HelmetCrew_O", 50},
			{"H_HelmetCrew_I", 50},
			{"H_PilotHelmetFighter_B", 50},
			{"H_PilotHelmetFighter_O", 50},
			{"H_PilotHelmetFighter_I", 50},
			{"H_MilCap_blue", 25},
			{"H_MilCap_gry", 25},
			{"H_MilCap_oucamo", 25},
			{"H_MilCap_rucamo", 25},
			{"H_MilCap_mcamo", 25},
			{"H_MilCap_ocamo", 25},
			{"H_MilCap_dgtl", 25},
			{"H_Cap_headphones", 25},
			{"H_Bandanna_cbr", 10},
			{"H_Bandanna_camo", 10},
			{"H_Bandanna_gry", 10},
			{"H_Bandanna_khk", 10},
			{"H_Bandanna_mcamo", 10},
			{"H_Bandanna_sgg", 10},
			{"H_Bandanna_surfer", 10},
			{"H_Watchcap_blk", 10},
			{"H_Watchcap_sgg", 10},
			{"H_Watchcap_cbr", 10},
			{"H_Watchcap_khk", 10},
			{"H_Watchcap_camo", 10},
			{"H_Beret_blk", 10},
			{"H_Beret_Colonel", 10},
			{"H_Beret_02", 10},
			{"H_Booniehat_khk", 10},
			{"H_Booniehat_tan", 10},
			{"H_Booniehat_mcamo", 10},
			{"H_Booniehat_dgtl", 10},
			{"H_Hat_blue", 10},
			{"H_Hat_brown", 10},
			{"H_Hat_camo", 10},
			{"H_Hat_checker", 10},
			{"H_Hat_grey", 10},
			{"H_Hat_tan", 10},
			{"H_Cap_blk", 10},
			{"H_Cap_blu", 10},
			{"H_Cap_grn", 10},
			{"H_Cap_oli", 10},
			{"H_Cap_red", 10},
			{"H_Cap_tan", 10},
			{"H_Cap_grn_BI", 10},
			{"H_Cap_blk_CMMG", 10},
			{"H_Cap_blk_ION", 10},
			{"H_Cap_blk_Raven", 10},
			{"H_Cap_khaki_specops_UK", 10},
			{"H_Cap_tan_specops_US", 10},
			{"H_Cap_brn_SPECOPS", 10},
			{"H_ShemagOpen_khk", 25},
			{"H_ShemagOpen_tan", 25},
			{"H_Shemag_khk", 25},
			{"H_Shemag_olive", 25},
			{"H_RacingHelmet_1_black_F", 25},
			{"H_RacingHelmet_1_blue_F", 25},
			{"H_RacingHelmet_1_green_F", 25},
			{"H_RacingHelmet_1_yellow_F", 25},
			{"H_RacingHelmet_1_orange_F", 25},
			{"H_RacingHelmet_1_red_F", 25},
			{"H_RacingHelmet_1_white_F", 25},
			{"H_RacingHelmet_1_F", 25},
			{"H_RacingHelmet_2_F", 25},
			{"H_RacingHelmet_3_F", 25},
			{"H_RacingHelmet_4_F", 25}
			};

	uniforms[] = {
			{"U_B_GhillieSuit", 300},
			{"U_O_GhillieSuit", 300},
			{"U_I_GhillieSuit", 300},
			{"U_B_Wetsuit", 200},
			{"U_O_Wetsuit", 200},
			{"U_I_Wetsuit", 200},
			{"U_B_CombatUniform_mcam", 50},
			{"U_O_CombatUniform_ocamo", 50},
			{"U_I_CombatUniform", 50},
			{"U_B_CombatUniform_mcam_tshirt", 50},
			{"U_B_CombatUniform_mcam_vest", 50},
			{"U_B_SpecopsUniform_sgg", 50},
			{"U_B_CTRG_1", 50},
			{"U_B_CTRG_2", 50},
			{"U_B_CTRG_3", 50},
			{"U_O_SpecopsUniform_ocamo", 50},
			{"U_O_CombatUniform_oucamo", 50},
			{"U_I_CombatUniform_shortsleeve", 50},
			{"U_I_CombatUniform_tshirt", 50},
			{"U_O_OfficerUniform_ocamo", 50},
			{"U_I_OfficerUniform", 50},
			{"U_B_PilotCoveralls", 50},
			{"U_O_PilotCoveralls", 50},
			{"U_I_pilotCoveralls", 50},
			{"U_B_HeliPilotCoveralls", 50},
			{"U_I_HeliPilotCoveralls", 50},
			{"U_BG_Guerilla1_1", 25}, // BLUFOR
			{"U_BG_Guerilla2_1", 25},
			{"U_BG_Guerilla2_2", 25},
			{"U_BG_Guerilla2_3", 25},
			{"U_BG_Guerilla3_1", 25},
			{"U_BG_Guerilla3_2", 25},
			{"U_BG_leader", 25},
			{"U_OG_Guerilla1_1", 25}, // OPFOR
			{"U_OG_Guerilla2_1", 25},
			{"U_OG_Guerilla2_2", 25},
			{"U_OG_Guerilla2_3", 25},
			{"U_OG_Guerilla3_1", 25},
			{"U_OG_Guerilla3_2", 25},
			{"U_OG_leader", 25},
			{"U_IG_Guerilla1_1", 25}, // Independent
			{"U_IG_Guerilla2_1", 25},
			{"U_IG_Guerilla2_2", 25},
			{"U_IG_Guerilla2_3", 25},
			{"U_IG_Guerilla3_1", 25},
			{"U_IG_Guerilla3_2", 25},
			{"U_IG_leader", 25},
			{"U_Competitor", 25},
			{"U_Rangemaster", 25}
			};

	vests[] = {
			{"V_RebreatherB", 200},
			{"V_RebreatherIR", 200},
			{"V_RebreatherIA", 200},
			{"V_PlateCarrier1_rgr", -1},
			{"V_PlateCarrier1_blk", -1},
			{"V_PlateCarrier3_rgr", -1},
			{"V_PlateCarrierGL_rgr", -1},
			{"V_PlateCarrierIA1_dgtl", -1},
			{"V_PlateCarrierIA2_dgtl", -1},
			{"V_PlateCarrierIAGL_dgtl", -1},
			{"V_HarnessO_brn", -1},
			{"V_HarnessO_gry", -1},
			{"V_HarnessOGL_brn", -1},
			{"V_HarnessOGL_gry", -1},
			{"V_HarnessOSpec_brn", -1},
			{"V_HarnessOSpec_gry", -1},
			{"V_BandollierB_blk", -1},
			{"V_BandollierB_cbr", -1},
			{"V_BandollierB_rgr", -1},
			{"V_BandollierB_khk", -1},
			{"V_BandollierB_oli", -1},
			{"V_Chestrig_khk", -1},
			{"V_Chestrig_rgr", -1},
			{"V_Chestrig_blk", -1},
			{"V_Chestrig_oli", -1},
			{"V_TacVest_blk", -1},
			{"V_TacVest_brn", -1},
			{"V_TacVest_camo", -1},
			{"V_TacVest_khk", -1},
			{"V_TacVest_oli", -1},
			{"V_TacVestIR_blk", -1}
			};

	backpacks[] = {
			{"B_AssaultPack_blk", 150},
			{"B_AssaultPack_rgr", 150},
			{"B_AssaultPack_mcamo", 150},
			{"B_AssaultPack_ocamo", 150},

			{"B_FieldPack_blk", 200},
			{"B_FieldPack_cbr", 200},
			{"B_FieldPack_khk", 200},
			{"B_FieldPack_oucamo", 200},

			{"B_Kitbag_cbr", 350},
			{"B_Kitbag_rgr", 350},
			{"B_Kitbag_mcamo", 350},
			{"B_Kitbag_sgg", 350},

			{"B_Bergen_blk", 350},
			{"B_Bergen_rgr", 350},
			{"B_Bergen_mcamo", 350},
			{"B_Bergen_sgg", 350},

			{"B_Carryall_khk", 500},
			{"B_Carryall_mcamo", 500},
			{"B_Carryall_oli", 500},
			{"B_Carryall_oucamo", 500}
			};

	items[] = {
			{"B_UAV_01_backpack_F", 500},
			{"O_UAV_01_backpack_F", 500},
			{"I_UAV_01_backpack_F", 500},
			{"B_UavTerminal", 150},
			{"O_UavTerminal", 150},
			{"I_UavTerminal", 150},
			{"ItemGPS", 100},
			{"FirstAidKit", 25},
			{"Medikit", 150},
			{"ToolKit", 150},
			{"MineDetector", 100},
			{"NVGoggles", 100, "nvg"},
			{"G_Diving", 100, "gogg"},
			{"Binocular", 50},
			{"Rangefinder", 150},
			{"Laserdesignator", 975},
			{"Laserbatteries", 25},
			{"Chemlight_blue", 25},
			{"Chemlight_green", 25},
			{"Chemlight_yellow", 25},
			{"Chemlight_red", 25}
			};

	objects[] = {
			{"Box_NATO_Ammo_F", 200},
			{"Land_MetalBarrel_F", 25},
			{"Land_ToiletBox_F", 25},
			{"Land_LampHarbour_F", 100},
			{"Land_LampShabby_F", 100},
			{"Land_BarGate_F", 150},
			{"Land_Pipes_Large_F", 200},
			{"Land_CncShelter_F", 200},
			{"Land_Crash_barrier_F", 200},
			{"Land_CncBarrier_F", 200},
			{"Land_CncBarrierMedium_F", 350},
			{"Land_CncBarrierMedium4_F", 500},
			{"Land_HBarrier_1_F", 150},
			{"Land_HBarrier_3_F", 200},
			{"Land_HBarrier_5_F", 250},
			{"Land_HBarrierBig_F", 500},
			{"Land_HBarrierWall4_F", 400},
			{"Land_HBarrierWall6_F", 500},
			{"Land_HBarrierTower_F", 600},
			{"Land_CncWall1_F", 400},
			{"Land_Mil_ConcreteWall_F", 400},
			{"Land_CncWall4_F", 600},
			{"Land_Mil_WallBig_4m_F", 600},
			{"Land_Shoot_House_Wall_F", 180},
			{"Land_Canal_WallSmall_10m_F", 400},
			{"Land_Canal_Wall_Stairs_F", 500},
			{"Land_BagFence_Corner_F", 150},
			{"Land_BagFence_End_F", 150},
			{"Land_BagFence_Long_F", 200},
			{"Land_BagFence_Round_F", 150},
			{"Land_BagFence_Short_F", 150},
			{"Land_BagBunker_Small_F", 250},
			{"Land_BagBunker_Large_F", 500},
			{"Land_BagBunker_Tower_F", 1000},
			{"Land_Cargo_Patrol_V1_F", 800},
			{"Land_Cargo_Tower_V1_F", 10000},
			{"Land_RampConcrete_F", 350},
			{"Land_RampConcreteHigh_F", 500},
			{"Land_Scaffolding_F", 250}
			};


	land[] = {
			{"C_Kart_01_F", 500},

			{"C_Quadbike_01_F", 600},
			{"B_Quadbike_01_F", 650},
			{"O_Quadbike_01_F", 650},
			{"I_Quadbike_01_F", 650},
			{"B_G_Quadbike_01_F", 650},

			{"C_Hatchback_01_F", 800},
			{"C_Hatchback_01_sport_F", 1000},
			{"C_SUV_01_F", 1100},
			{"C_Offroad_01_F", 1100},
			{"B_G_Offroad_01_F", 1250},
			{"C_Offroad_01_repair_F", 1500},
			{"B_G_Offroad_01_armed_F", 2500},

			{"C_Van_01_transport_F", 700},
			{"B_G_Van_01_transport_F", 800},
			{"C_Van_01_box_F", 900},
			{"C_Van_01_fuel_F", 2000},
			{"B_G_Van_01_fuel_F", 2100},

			{"B_Truck_01_mover_F", 4000},
			{"B_Truck_01_box_F", 5000},
			{"B_Truck_01_transport_F", 6000},
			{"B_Truck_01_covered_F", 7500},
			{"B_Truck_01_fuel_F", 9000},
			{"B_Truck_01_medical_F", 10000},
			{"B_Truck_01_Repair_F", 12500},
			{"B_Truck_01_ammo_F", 27500},

			{"O_Truck_03_device_F", 4000},
			{"O_Truck_03_transport_F", 6000},
			{"O_Truck_03_covered_F", 7500},
			{"O_Truck_03_fuel_F", 9000},
			{"O_Truck_03_medical_F", 10000},
			{"O_Truck_03_repair_F", 12500},
			{"O_Truck_03_ammo_F", 27500},

			{"I_Truck_02_transport_F", 4000},
			{"I_Truck_02_covered_F", 5000},
			{"I_Truck_02_fuel_F", 7500},
			{"I_Truck_02_medical_F", 9000},
			{"I_Truck_02_box_F", 10000},
			{"I_Truck_02_ammo_F", 25000},

			{"B_UGV_01_F", 2500},
			{"B_UGV_01_rcws_F", 15000},
			{"I_UGV_01_F", 2500},
			{"I_UGV_01_rcws_F", 15000},
			{"O_UGV_01_F", 2500},
			{"O_UGV_01_rcws_F", 15000}
			};

	armored[] = {
			{"B_MRAP_01_F", 4000},
			{"B_MRAP_01_hmg_F", 15000},
			{"B_MRAP_01_gmg_F", 17500},
			{"O_MRAP_02_F", 4000},
			{"O_MRAP_02_hmg_F", 15000},
			{"O_MRAP_02_gmg_F", 17500},
			{"I_MRAP_03_F", 4000},
			{"I_MRAP_03_hmg_F", 15000},
			{"I_MRAP_03_gmg_F", 17500},
			{"O_APC_Wheeled_02_rcws_F", 25000},
			{"B_APC_Wheeled_01_cannon_F", 27500},
			{"I_APC_Wheeled_03_cannon_F", 30000}
			};

	tanks[] = {
			{"B_APC_Tracked_01_CRV_F", 32500},
			{"B_APC_Tracked_01_rcws_F", 35000},
			{"I_APC_tracked_03_cannon_F", 37500},
			{"O_APC_Tracked_02_cannon_F", 40000},
			{"B_APC_Tracked_01_AA_F", 40000},
			{"O_APC_Tracked_02_AA_F", 40000},
			{"B_MBT_01_cannon_F", 50000},
			{"B_MBT_01_TUSK_F", 50000}, // Commander gun variant
			{"O_MBT_02_cannon_F", 50000},
			{"I_MBT_03_cannon_F", 50000}
			};


	helicopters[] = {
			{"B_Heli_Light_01_F", 5000}, // MH-6
			{"O_Heli_Light_02_unarmed_F", 7500}, // Ka-60
			{"I_Heli_light_03_unarmed_F", 7500}, // AW159
			{"I_Heli_Transport_02_F", 10000}, // AW101

			{"B_Heli_Transport_01_F", 25000}, // UH-60 Stealth with 2 side miniguns
			{"B_Heli_Transport_01_camo_F", 25000}, // UH-60 Stealth with 2 side miniguns (green camo)
			{"B_Heli_Light_01_armed_F", 30000}, // Armed AH-6
			{"O_Heli_Light_02_F", 35000}, // Armed Ka-60
			{"I_Heli_light_03_F", 40000}, // Armed AW159
			{"B_Heli_Attack_01_F", 50000}, // RAH-66 with gunner
			{"O_Heli_Attack_02_F", 60000}, // Mi-28 with gunner
			{"O_Heli_Attack_02_black_F", 60000} // Mi-28 with gunner (black camo)
			};

	planes[] = {
			{"I_Plane_Fighter_03_AA_F", 40000},
			{"I_Plane_Fighter_03_CAS_F", 45000},
			{"B_Plane_CAS_01_F", 60000},
			{"O_Plane_CAS_02_F", 60000},
			{"B_UAV_02_CAS_F", 10000}, // Bomber UAVs are a lot harder to use, hence why they are cheaper than ATGMs
			{"B_UAV_02_F", 15000},
			{"O_UAV_02_CAS_F", 10000},
			{"O_UAV_02_F", 15000},
			{"I_UAV_02_CAS_F", 10000},
			{"I_UAV_02_F", 15000}
			};

	boats[] = {
			{"C_Rubberboat", 500},
			{"B_Lifeboat", 500},
			{"O_Lifeboat", 500},
			{"B_Boat_Transport_01_F", 600},
			{"O_Boat_Transport_01_F", 600},
			{"I_Boat_Transport_01_F", 600},
			{"B_G_Boat_Transport_01_F", 600},
			{"C_Boat_Civil_01_F", 1000},
			{"C_Boat_Civil_01_rescue_F", 900},
			{"C_Boat_Civil_01_police_F", 1250},
			{"O_Boat_Armed_01_hmg_F", 4000},
			{"B_Boat_Armed_01_minigun_F", 4000},
			{"I_Boat_Armed_01_minigun_F", 4000},
			{"B_SDV_01_F", 1000},
			{"O_SDV_01_F", 1000},
			{"I_SDV_01_F", 1000}
			};

	supplies[] = {
			{"water", 30, "STR_WASTE_ShopDescriptions_Water", "icons\water.paa", "Water Bottle"},
			{"cannedfood", 30, "STR_WASTE_ShopDescriptions_CanFood", "icons\cannedfood.paa", "Canned Food"},
			{"repairkit", 500, "STR_WASTE_ShopDescriptions_RepairKit", "icons\briefcase.paa", "Repair Kit"},
			{"jerrycanfull", 150, "STR_WASTE_ShopDescriptions_fuelFull", "icons\jerrycan.paa", "Jerry Can (Full)"},
			{"jerrycanempty", 50, "STR_WASTE_ShopDescriptions_fuelEmpty", "icons\jerrycan.paa", "Jerry Can (Empty)"},
			{"spawnbeacon", 1500, "STR_WASTE_ShopDescriptions_spawnBeacon", "icons\briefcase.paa", "Spawn Beacon"},
			{"camonet", 200, "STR_WASTE_ShopDescriptions_Camo", "icons\briefcase.paa", "Camo Net"},
			{"syphonhose", 200, "STR_WASTE_ShopDescriptions_SyphonHose", "icons\jerrycan.paa","Syphon Hose"},
			{"energydrink", 100, "STR_WASTE_ShopDescriptions_Energy_Drink", "icons\water.paa", "Energy Drink"},
			{"warchest", 1000, "STR_WASTE_ShopDescriptions_Warchest", "icons\briefcase.paa", "Warchest"}
			};
};