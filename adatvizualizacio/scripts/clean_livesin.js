db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Cluj-Napoca"
            ]
        }
    },
    {$set: {livesin: "kolozsvar"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Bucharest, Romania"
            ]
        }
    },
    {$set: {livesin: "bukarest"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Toplita-Ciuc, Harghita, Romania",
                "Toplita",
                "Borszèk, Harghita, Romania"
            ]
        }
    },
    {$set: {livesin: "toplita"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Baraolt",
                "Barót, Covasna, Romania"
            ]
        }
    },
    {$set: {livesin: "barot"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Sepsiszentgyorgy",
                "Arkos",
                "Sfântu-Gheorghe, Covasna, Romania",
                "Sfântul-Gheorghe, Covasna, Romania"
            ]
        }
    },
    {$set: {livesin: "szentgyorgy"}}
)

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Székelyudvarhely",
                "Felsoboldogfalva"
            ]
        }
    },
    {$set: {livesin: "udvarhely"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Siculeni",
                "Mádéfalva, Harghita, Romania"
            ]
        }
    },
    {$set: {livesin: "madefalva"}}
)

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Sovata"
            ]
        }
    },
    {$set: {livesin: "szovata"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Szasz Régen, Mures, Romania",
            ]
        }
    },
    {$set: {livesin: "regen"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Gyulafehérvár, Alba, Romania",
                "Alba Iulia"
            ]
        }
    },
    {$set: {livesin: "gyulafehervar"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Brasov, Romania"
            ]
        }
    },
    {$set: {livesin: "brasso"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Gyulakuta"
            ]
        }
    },
    {$set: {livesin: "gyulakuta"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Nagy-Várad, Bihor, Romania"
            ]
        }
    },
    {$set: {livesin: "nagyvarad"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Sibiu, Romania"
            ]
        }
    },
    {$set: {livesin: "szeben"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Torboszlò, Mures, Romania"
            ]
        }
    },
    {$set: {livesin: "torboszlo"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Márèfalva, Harghita, Romania"
            ]
        }
    },
    {$set: {livesin: "szatmar"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Sangeorgiu-De-Padure, Mures, Romania"
            ]
        }
    },
    {$set: {livesin: "erdoszentgyorgy"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Szentegyházasfalu",
                "Vlahita, Harghita, Romania",
                "Lövete, Harghita, Romania",
                "Kàpolnàsfalù, Harghita, Romania"
            ]
        }
    },
    {$set: {livesin: "vlahica"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Szàrhegy, Harghita, Romania"
            ]
        }
    },
    {$set: {livesin: "szarhegy"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Cernatul-De-Sus, Covasna, Romania",
                "Cernatul-De-Jos, Covasna, Romania",
                "Alsòcsernàton, Covasna, Romania",
                "Kèzdisznetlèlek, Covasna, Romania"
            ]
        }
    },
    {$set: {livesin: "csernaton"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Suseni, Harghita",
                "Gyergyószentmiklós",
                "Gyergyóremete, Harghita, Romania"
            ]
        }
    },
    {$set: {livesin: "gyergyo"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Csikszereda",
                "Miercurea-Ciuc, Harghita, Romania",
                "Leliceni, Harghita, Romania",
                "Csikszentsimon",
                "Csikszentimre, Harghita, Romania"
            ]
        }
    },
    {$set: {livesin: "csikszereda"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Ghimes-Faget",
                "Gyimesfelsölok, Harghita, Romania"
            ]
        }
    },
    {$set: {livesin: "gyimes"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Ujfalù, Harghita, Romania"
            ]
        }
    },
    {$set: {livesin: "ujfalu"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Szèkelykeresztur, Harghita, Romania",
                "Szekelyszentmihaly, Harghita, Romania",
                "Agyagfalva, Harghita, Romania",
                "Gagy, Harghita, Romania"
            ]
        }
    },
    {$set: {livesin: "keresztur"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Kèzdivásàrhely, Covasna, Romania",
                "Targu-Sacuesc, Covasna, Romania",
                "Nyujtòd, Covasna, Romania",    
                "Torja, Covasna, Romania",
                "Zabola"
            ]
        }
    },
    {$set: {livesin: "kezdi"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Disznajò, Mures, Romania"
            ]
        }
    },
    {$set: {livesin: "disznajo"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Csikfalva, Mures, Romania"
            ]
        }
    },
    {$set: {livesin: "csikfalva"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Ditro, Harghita, Romania"
            ]
        }
    },
    {$set: {livesin: "ditro"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Bibarczflava, Covasna, Romania"
            ]
        }
    },
    {$set: {livesin: "bibarczfalva"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Oroszhegy, Harghita, Romania"
            ]
        }
    },
    {$set: {livesin: "oroszhegy"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Csomafalva, Harghita, Romania"
            ]
        }
    },
    {$set: {livesin: "csomafalva"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Szèkelyszáldobos, Harghita, Romania"
            ]
        }
    },
    {$set: {livesin: "szekelyszaldobos"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Balánbánya, Harghita, Romania"
            ]
        }
    },
    {$set: {livesin: "balanbanya"}}
);

db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Jenofalva, Harghita, Romania"
            ]
        }
    },
    {$set: {livesin: "jenofalva"}}
);