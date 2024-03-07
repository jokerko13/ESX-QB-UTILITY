DRZ = {}

DRZ.Peds = {
    Settings = {
        {
            spawnPed = true,
            model = "s_m_m_doctor_01",
            coords = vector4(1147.7495, 63.4609, 80.7554, 59.6760),
            immortal = true,
            weapon = "weapon_pistol",
            pedType = 1,
            freeze = true,
            ambient = true,
            scenario = nil,
        },
        {
            spawnPed = true,
            model = "s_m_m_doctor_01",
            coords = vector4(1147.3127, 62.3953, 80.7554, 59.9637),
            immortal = false,
            weapon = nil,
            pedType = 1,
            freeze = true,
            ambient = true,
            scenario = "WORLD_HUMAN_SMOKING",
        },
    }
}

DRZ.Vehicle = {
    Settings = {
        {
            spawnModel = true,
            model = "vigero2",
            coords = vector4(1146.5394, 61.0077, 80.7554, 57.6266),
            plateText = "DRZ",
            dirtLevel = 0.0,
            lights = true,
            locked = true,
            indicators = true,
            windows = true,
            rotate = false,
            rotateSpeed = 0.2,
            rotateDistance = 15,
            primaryColor = {0, 20, 5},
            secondaryColor = {150, 20, 5},
        },
        {
            spawnModel = true,
            model = "conada",
            coords = vector4(1141.1472, 51.2770, 80.7554, 59.3196),
            plateText = "TEST",
            dirtLevel = 0.0,
            lights = true,
            locked = true,
            indicators = true,
            windows = true,
            rotate = false, --Better if false
            rotateSpeed = 0.2,
            rotateDistance = 15,
            primaryColor = {100, 20, 5},
            secondaryColor = {0, 20, 5},
        },
    }
}

DRZ.Prop = {
    Settings = {
        {
            spawnProp = false,
            model = "prop_paper_box_03",
            coords = vector4(1139.6433, 50.3334, 80.7554, 59.1098),
            rotate = false, --Better if false
            rotateSpeed = 0.2,
            rotateDistance = 15,
        },
        {
            spawnProp = false,
            model = "prop_paper_box_03",
            coords = vector4(1139.2506, 49.7252, 80.7554, 68.2777),
            rotate = false, --Better if false
            rotateSpeed = 0.2,
            rotateDistance = 15,
        },
        {
            spawnProp = false,
            model = "prop_wooden_barrel",
            coords = vector4(3632.1306, 3732.7134, 43.3686, 256.3326),
            rotate = false, --Better if false
            rotateSpeed = 0.2,
            rotateDistance = 15,
        },
        {
            spawnProp = true,
            model = "drz_tankoil",
            coords = vector4(595.8234, 2721.7268, 39.9569, 162.1372),
            rotate = false, --Better if false
            rotateSpeed = 0.2,
            rotateDistance = 15,
        },
    }
}

DRZ.Blip = {
    Settings = {
        {
            spawnBlip = true,
            name = "1test",
            coords = vector3(1139.8169, 48.4135, 80.7554),
            sprite = 57,
            scale = 0.5,
            color = 9,
            display = 4,
            shortRange = true,
        },
        {
            spawnBlip = true,
            name = "2test",
            coords = vector3(1138.9658, 46.7508, 80.7554),
            sprite = 57,
            scale = 0.5,
            color = 9,
            display = 4,
            shortRange = true,
        },
    }
}

