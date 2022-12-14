Config = Config or {}
Lang = Lang or {}

Config.QBCoreName = 'qb-core'
Config.QBTargetName = 'qb-target'
Config.QBMenuName = 'qb-menu'
Config.SnowKey = 119
Config.SnowBallsAmount = 2

Config.PickGiftTime = 5000
Config.OpenGiftTime = 5000
Config.MakeSnowManTime = 7500
Config.PickSnowBallsTime = 2000

Config.GiftsLocations = {
    [1] = { Coords = vector3(1124.75, -728.19, 55.49) },
    [2] = { Coords = vector3(1131.44, -720.33, 55.49) },
    [3] = { Coords = vector3(1125.64, -716.54, 55.49) },
    [4] = { Coords = vector3(1117.38, -719.52, 55.49) },
    [5] = { Coords = vector3(1106.21, -711.71, 55.49) },
    [6] = { Coords = vector3(1092.83, -713.26, 55.49) },
    [7] = { Coords = vector3(1081.48, -714.3, 55.49) },
    [8] = { Coords = vector3(1073.71, -703.06, 56.1) },
    [9] = { Coords = vector3(1079.42, -688.16, 56.62) },
    [10] = { Coords = vector3(1074.54, -684.31, 56.76) },
    [11] = { Coords = vector3(1072.74, -661.45, 55.49) },
    [12] = { Coords = vector3(1049.93, -644.04, 55.48) },
    [13] = { Coords = vector3(1039.72, -658.59, 55.48) },
}

Config.GiftItems = {
    Normal = {
        [1] = 'twerks',
        [2] = 'sandwich',
        [3] = 'water_bottle',
    },
    Rare = {
        [1] = 'phone',
        [2] = 'radio',
        [3] = 'tablet',
    },
    RealRare = {
        [1] = 'weapon_flashlight',
        [2] = 'weapon_pistol',
        [3] = 'weapon_combatpistol',
    },
}

Lang = {
    PickGift = 'Pick Gift',
    PickingGift = 'PICKING GIFT...',
    OpeningGift = 'OPENING GIFT...',
    MakingSnowMan = 'MAKING SNOWMAN...',
    PickSnowBall = 'Pick Snow Balls',
    MakeSnowMan = 'Make snowman',
    PickingSnowBalls = 'PCIKING SNOW BALLS...',
}