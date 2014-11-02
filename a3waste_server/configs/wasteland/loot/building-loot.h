class Default {
	lootChance = 0;
	lootPos[] = {};
	lootPosSmall[] = {};
	
	itemType[] = {};

	itemChance[] = {};
	lootTypeSmall[] = {};
	itemChanceSmall[] = {};
};

class Castle: Default {
	lootChance = 0.2;
	lootPos[] = {};
	lootType[] = {
		{ "ItemMap", "item", 0.01},
		{ "ItemCompass", "item", 0.01},
		{ "", "generic", 0.40}
	};
};
class Residential: Default {
	lootChance = 0.4;
	lootPos[] = {};
	lootType[] = {
		{ "ItemWatch", "item", 0.04},
		{ "ItemCompass", "item", 0.03},
		{ "ItemMap", "item", 0.02},
		{ "", "generic", 0.32},
		{ "backpacks", "backpacks", 0.04},
		{ "", "military", 0.02},
		{ "", "trash", 0.17},
		{ "Binocular", "item", 0.02},
		{ "clothes", "clothes", 0.01},
		{ "specialclothes", "specialclothes", 0.01},
		{ "pistols", "cfglootweapon", 0.04 },
		{ "submachinegun", "cfglootweapon", 0.04 }
	};
	lootTypeSmall[] = {
		{ "ItemWatch", "item", 0.05 },
		{ "ItemCompass", "item", 0.04 },
		{ "ItemMap", "item", 0.03 },
		{ "pistols", "cfglootweapon", 0.12 },
		{ "", "generic", 0.38 },
		{ "", "military", 0.04 },
		{ "", "trash", 0.17 },
		{ "Binocular", "item", 0.02 },
		{ "clothes", "clothes", 0.01},
		{ "specialclothes", "specialclothes", 0.01 }
	};
};
class Office: Default {
	lootChance = 0.4;
	lootPos[] = {};
	lootType[] = {
		{ "ItemWatch", "item", 0.04},
		{ "ItemCompass", "item", 0.03},
		{ "ItemMap", "item", 0.02},
		{ "", "generic", 0.31},
		{ "backpacks", "backpacks", 0.04},
		{ "", "military", 0.02},
		{ "", "trash", 0.21},
		{ "Binocular", "item", 0.02},
		{ "clothes", "clothes", 0.01},
		{ "specialclothes", "specialclothes", 0.01},
		{ "submachinegun", "cfglootweapon", 0.05}
	};
	lootTypeSmall[] = {
		{ "ItemWatch", "item", 0.05 },
		{ "ItemCompass", "item", 0.04 },
		{ "ItemMap", "item", 0.03 },
		{ "pistols", "cfglootweapon", 0.15 },
		{ "", "generic", 0.31 },			
		{ "", "military", 0.04 },
		{ "", "trash", 0.03 },
		{ "Binocular", "item", 0.02 },
		{ "clothes", "clothes", 0.16 }
	};
};
class Industrial: Default {
	lootChance = 0.4;
	lootPos[] = {};
	lootType[] = {
		{ "", "generic", 0.17},
		{ "", "trash", 0.25},
		{ "", "military", 0.04}
	};
	lootTypeSmall[] = {
		{ "", "generic", 0.5 },
		{ "", "trash", 0.28 },
		{ "", "military", 0.14 }
	};
};
class IndustrialFuel: Default {
	lootChance = 0.4;
	lootPos[] = {};
	lootType[] = {
		{ "", "generic", 0.18},
		{ "", "trash", 0.28},
		{ "", "military", 0.04}
	};
	lootTypeSmall[] = {
		{ "", "generic", 0.5 },
		{ "", "trash", 0.28 },
		{ "", "military", 0.14 }
	};
};
class Farm: Default {
	lootChance = 0.5;
	lootPos[] = {};
	lootType[] = {
		{ "ItemJerrycan", "magazine", 0.05},
		{ "", "generic", 0.3},
		{ "", "trash", 0.11},
		{ "farmweapons", "cfglootweapon", 0.15}
	};
	lootTypeSmall[] = {
		{ "", "generic", 0.79},
		{ "", "trash", 0.14 },
		{ "", "military", 0.05}
	};
};
class Supermarket: Default {
	lootChance = 0.6;
	lootType[] = {
		{ "ItemWatch", "item", 0.07},
		{ "ItemCompass", "item", 0.02},
		{ "ItemMap", "item", 0.04},
		{ "", "generic", 0.04},
		{ "backpacks", "backpacks", 0.07},
		{ "", "food", 0.3},
		{ "", "trash", 0.17},
		{ "Binocular", "item", 0.05},
		{ "pistols", "cfglootweapon", 0.04},
		{ "submachinegun", "cfglootweapon", 0.04}
	};
	lootTypeSmall[] = {
		{ "ItemWatch", "item", 0.07 },
		{ "ItemCompass", "item", 0.03 },
		{ "ItemMap", "item", 0.05 },
		{ "pistols", "cfglootweapon", 0.08 },
		{ "", "generic", 0.21 },
		{ "", "food", 0.24 },
		{ "", "trash", 0.16 },
		{ "Binocular", "item", 0.02 }
	};
};

class Hospital: Default {
	lootChance = 1;
	lootPos[] = {};
	lootType[] = {
		{ "", "trash", 0.1},
		{ "", "hospital", 0.7}
	};
	lootTypeSmall[] = {
		{ "", "trash", 0.1 },
		{ "", "hospital", 0.9 }
	};
};
class Military: Default {
	lootChance = 0.4;
	lootPos[] = {};
	lootType[] = {
		{ "pistols", "cfglootweapon", 0.04},
		{ "assaultrifles", "cfglootweapon", 0.13 },
		{ "sniperrifles", "cfglootweapon", 0.04 },
		{ "submachinegun", "cfglootweapon", 0.06 },
		{ "submachinegun", "cfglootweapon", 0.07 },
		{ "Binocular", "item", 0.03},
		{ "ItemGPS", "item", 0.01},
		{ "ItemMap", "item", 0.02},
		{ "militarybackpacks", "militarybackpacks", 0.05},
		{ "", "medical", 0.03},
		{ "", "generic", 0.1},
		{ "", "military", 0.3},
		{ "machineguns", "cfglootweapon", 0.03 }
	};
	lootTypeSmall[] = {
		{ "pistols", "cfglootweapon", 0.14 },
		{ "Binocular", "item", 0.05 },
		{ "ItemGPS", "item", 0.02 },
		{ "", "medical", 0.12 },
		{ "", "generic", 0.22 },
		{ "", "military", 0.35 }
	};
};
class MilitaryIndustrial: Default {
	lootChance = 0.4;
	lootPos[] = {};
	lootType[] = {
		{ "pistols", "cfglootweapon", 0.02 },
		{ "assaultrifles", "cfglootweapon", 0.05 },
		{ "sniperrifles", "cfglootweapon", 0.01 },
		{ "submachinegun", "cfglootweapon", 0.05 },
		{ "submachinegun", "cfglootweapon", 0.05 },
		{ "Binocular", "item", 0.01},
		{ "ItemGPS", "item", 0.01},
		{ "militarybackpacks", "militarybackpacks", 0.03},
		{ "", "medical", 0.05},
		{ "", "generic", 0.35},
		{ "", "military", 0.07},
		{ "machineguns", "cfglootweapon", 0.01 }
	};
	lootTypeSmall[] = {
		{ "pistols", "cfglootweapon", 0.14 },
		{ "Binocular", "item", 0.05 },
		{ "ItemGPS", "item", 0.02 },
		{ "", "medical", 0.12 },
		{ "", "generic", 0.22 },
		{ "", "military", 0.35 }
	};
};
class IndustrialMilitary: Default {
	lootChance = 0.5;
	lootPos[] = {};
	lootType[] = {
		{ "pistols", "cfglootweapon", 0.02 },
		{ "assaultrifles", "cfglootweapon", 0.05 },
		{ "sniperrifles", "cfglootweapon", 0.01 },
		{ "submachinegun", "cfglootweapon", 0.05 },
		{ "submachinegun", "cfglootweapon", 0.05 },
		{ "Binocular", "item", 0.01},
		{ "ItemGPS", "item", 0.01},
		{ "militarybackpacks", "militarybackpacks", 0.03},
		{ "", "medical", 0.05},
		{ "", "generic", 0.25},
		{ "", "military", 0.07},
		{ "machineguns", "cfglootweapon", 0.01 }
	};
	lootTypeSmall[] = {
		{ "pistols", "cfglootweapon", 0.14 },
		{ "Binocular", "item", 0.05 },
		{ "ItemGPS", "item", 0.02 },
		{ "", "medical", 0.12 },
		{ "", "generic", 0.22 },
		{ "", "military", 0.35 }
	};
};
class MilitarySpecial: Default {
	lootChance = 0.4;
	lootPos[] = {};
	lootType[] = {
		{ "assaultrifles", "cfglootweapon", 0.1 },
		{ "machineguns", "cfglootweapon", 0.04 },
		{ "pistols", "cfglootweapon", 0.08 },
		{ "sniperrifles", "cfglootweapon", 0.03 },
		{ "submachinegun", "cfglootweapon", 0.06 },
		{ "Binocular", "item", 0.01},
		{ "ItemGPS", "item", 0.01},
		{ "ItemMap", "item", 0.01},
		{ "Rangefinder", "item", 0.01},
		{ "militarybackpacks", "militarybackpacks", 0.04},
		{ "", "medical", 0.08},
		{ "", "generic", 0.3},
		{ "", "military", 0.01},
		{ "machinegunammo", "machinegunammo", 0.05},
		{ "militaryclothes", "militaryclothes", 0.05},
		{ "NVGoggles", "item", 0.01}
	};
	lootTypeSmall[] = {
		{ "pistols", "cfglootweapon", 0.10 },
		{ "Binocular", "item", 0.02 },
		{ "ItemGPS", "item", 0.02 },
		{ "ItemMap", "item", 0.01 },
		{ "Rangefinder", "item", 0.03},
		{ "", "medical", 0.08},
		{ "", "generic", 0.15},
		{ "", "military", 0.33 },
		{ "militaryclothes", "militaryclothes", 0.05 },
		{ "NVGoggles", "item", 0.04 }
	};
};
class Hunting: Default {
	lootChance = 1;
	lootPos[] = {};
	lootType[] = {
		{ "ItemMap", "item", 0.02},
		{ "farmweapons", "cfglootweapon", 0.03 },
		{ "", "military", 0.38},
		{ "", "hunter", 0.5}
	};
	lootTypeSmall[] =	{
		{ "ItemMap", "item", 0.02},
		{ "", "military", 0.4},
		{ "", "hunter", 0.5}
	};
};

class SupplyDrop: Default {
	lootChance = 1;
	lootPos[] = {};
	lootType[] = {
	};
};