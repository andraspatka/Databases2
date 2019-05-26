# Székelydata adatvizualizáció - Sapientiás diákok szülővárosukban maradása

## Adatok értelmezése

A székelydata adathalmaz egy JSON array-ből áll. MongoDB-be az alábbi képpen lehet beimportálni:

```
 mongoimport -db szekelydata --collection szekelydata --type json --file data_eredeti.json --jsonArray
```

Ebben az adatvizualizációban a hansúly 3 mezőre fog esni:

 - birth - illető születési helye
 - livesin - illető tartozkodási helye
 - studwhere - hol tanul/tanult

Első sorban meg akarom nézni, hogy hány olyan illető van, ahol a studwhere mező tartalmazza a "sapientia" szót. 
Itt a regex-nél az i opciót használom, ennek segítségével kicsi és nagybetű független a regex match-elés.

```js
db.getCollection('szekelydata').find(
{
    studwhere: {$regex: "sapientia", $options: "i"}
}).count()

result: 766
```

Mivel a Sapientiás diákoknak a szülővárosukban való maradását akarom vizsgálni, ezért azt is meg kell nézzem, hogy az illetőnek van-e livesin (aktuális tartozkodási hely) és birth (születési hely) mezője.

```js
db.getCollection('szekelydata').find(
{
    $and:
    [
        {livesin: {$exists: true}},
        {birth: {$exists: true}},
        {studwhere: {$regex: "sapientia", $options: "i"}}
    ]
}).count()

result: 585
```

Látható, hogy ezek a feltételek mellett már csak 585 rekord van.

## Adattisztítás

A következőkben azt fogom felmérni, hogy ez a legkicsinyített adathalmaz mennyire szorul adattisztításra.

Első sorban azt szeretném megnézni, hogy a Sapientiás diákok esetén, akiknek van livesin és birth mezőjük, hány különböző fajta értéket vesz fel a livesin mező:

```js
db.getCollection('szekelydata').distinct(
    "livesin",
    {
        $and: 
        [
            {studwhere: {$regex: "sapientia", $options: "i"}},
            {livesin: {$exists: true}},
            {birth: {$exists: true}}
        ]
    }
)
```

Erre a lekérdezésre a kimenet:

```js
[
    "Marosvásárhely, Mures, Romania",
    "Székelyudvarhely",
    "Kèzdivásàrhely, Covasna, Romania",
    "Ditro, Harghita, Romania",
    "Csikszereda",
    "Torja, Covasna, Romania",
    "Vienna, Austria",
    "Faringdon",
    "Targu-Mures",
    "Sepsiszentgyorgy",
    "Gyergyószentmiklós",
    "Nyujtòd, Covasna, Romania",
    "Arkos",
    "Gyulakuta",
    "Nagy-Várad, Bihor, Romania",
    "Budapest, Hungary",
    "Gänserndorf",
    "Mezöpanit, Mures, Romania",
    "Castle Bromwich, West Midlands, United Kingdom",
    "Oroszhegy, Harghita, Romania",
    "Bucharest, Romania",
    "Arrild, Sonderjylland, Denmark",
    "Agyagfalva, Harghita, Romania",
    "Cologne, Germany",
    "Gyergyóremete, Harghita, Romania",
    "Gyulafehérvár, Alba, Romania",
    "London, United Kingdom",
    "Cluj-Napoca",
    "Csikfalva, Mures, Romania",
    "Hüttenberg, Hessen, Germany",
    "Løgumkloster",
    "Neu Isenburg",
    "Csikszentsimon",
    "Szentgotthárd",
    "Disznajò, Mures, Romania",
    "Wellington, Somerset",
    "Fläsch, Switzerland",
    "Barót, Covasna, Romania",
    "Szentegyházasfalu",
    "Torboszlò, Mures, Romania",
    "Sovata",
    "Parajd",
    "Weinfelden, Switzerland",
    "Ghimes-Faget",
    "Bishops Stortford",
    "Paphos, Paphos, Cyprus",
    "Fleet, Hampshire",
    "Szàrhegy, Harghita, Romania",
    "Bracknell",
    "Sangeorgiu-De-Padure, Mures, Romania",
    "Szèkelykeresztur, Harghita, Romania",
    "Valea Izvoarelor, Mures, Romania",
    "Sopron",
    "Csomafalva, Harghita, Romania",
    "Kolding, Denmark",
    "Tárnok, Pest, Hungary",
    "Siculeni",
    "Sfântu-Gheorghe, Covasna, Romania",
    "Copenhagen, Denmark",
    "Mádéfalva, Harghita, Romania",
    "Mutterstadt",
    "Kèzdisznetlèlek, Covasna, Romania",
    "Mosonmagyaróvár",
    "Cernatul-De-Sus, Covasna, Romania",
    "Cernatul-De-Jos, Covasna, Romania",
    "Cham, Switzerland",
    "Brasov, Romania",
    "Targu-Sacuesc, Covasna, Romania",
    "Liverpool",
    "Suseni, Harghita",
    "Lövete, Harghita, Romania",
    "Bernwies, Bayern, Germany",
    "Sfântul-Gheorghe, Covasna, Romania",
    "Ilencfalva, Mures, Romania",
    "Coventry, United Kingdom",
    "Szèkelyszáldobos, Harghita, Romania",
    "Stockholm, Sweden",
    "Jászberény",
    "Toplita-Ciuc, Harghita, Romania",
    "Chislehurst, Bromley, United Kingdom",
    "Leliceni, Harghita, Romania",
    "Gyimesfelsölok, Harghita, Romania",
    "Miercurea-Ciuc, Harghita, Romania",
    "Balánbánya, Harghita, Romania",
    "Koronka",
    "Baraolt",
    "Felsoboldogfalva",
    "Miami Beach, Florida",
    "Szeged",
    "Palomino, Magdalena, Colombia",
    "Godollo, Hungary",
    "Ujfalù, Harghita, Romania",
    "Schliengen",
    "Borszèk, Harghita, Romania",
    "Szekelyszentmihaly, Harghita, Romania",
    "Albstadt",
    "Jenofalva, Harghita, Romania",
    "Kàpolnàsfalù, Harghita, Romania",
    "Sibiu, Romania",
    "Sevenoaks, Kent",
    "Gümmer, Niedersachsen, Germany",
    "Gagy, Harghita, Romania",
    "Szombathely",
    "Zabola",
    "New Milton, Hampshire, United Kingdom",
    "Erlangen, Germany",
    "Mannheim, Germany",
    "Santana-De-Mures, Mures, Romania",
    "Weißach, Bayern, Germany",
    "Leipzig, Germany",
    "Egenhausen",
    "Neumarkt Am Mieresch, Mures, Romania",
    "Vlahita, Harghita, Romania",
    "Handeloh",
    "Prague, Czech Republic",
    "Bibarczflava, Covasna, Romania",
    "Alba Iulia",
    "Speyer, Germany",
    "Márèfalva, Harghita, Romania",
    "Melbourne, Victoria, Australia",
    "Schifferstadt",
    "Leordeni, Mures, Romania",
    "Basingstoke",
    "Tatabánya",
    "Csikszentimre, Harghita, Romania",
    "Toplita",
    "Neu-Anspach",
    "Hamm, Germany",
    "Eeklo, Belgium",
    "Alsòcsernàton, Covasna, Romania",
    "Amsterdam, Netherlands",
    "Szasz Régen, Mures, Romania",
    "Zürich, Switzerland"
]
```

Látható, hogy számos olyan mező van, amely lényegében ugyanazt a várost jelenti, viszont másként van bevezetve.

Például: Marosvásárhely
 - Marosvásárhely
 - Targu-Mures (Marosvásárhely románul)
 - Neumarkt Am Mieresch, Mures, Romania (Marosvásárhely németül)

Ezeket az értékeket egy közös értékre kell hozni: marosvasarhely.

Ezek után megvizsgálom a birth mezőnek a különböző értékeit az alábbi lekérdezéssel:

```js
db.getCollection('szekelydata').distinct(
    "birth",
    {
        $and: 
        [
            {studwhere: {$regex: "sapientia", $options: "i"}},
            {livesin: {$exists: true}},
            {birth: {$exists: true}}
        ]
    }
)
```

Erre a query-re a kimenet:

```js
[
    "vasarhely",
    "udvarhely",
    "kezdi",
    "gyergyo",
    "csikszereda",
    "kovaszna",
    "segesvar",
    "szentgyorgy",
    "keresztur",
    "vlahica",
    "barot",
    "regen",
    "toplita",
    "szovata",
    "kolozsvar",
    "parajd",
    "balan"
]
```

Látható, hogy valamilyen fajta adattisztítás már el volt végezve ezekre a mezőkre. Tehát csak nagyon keveset fog kelleni ezeken változtatni. Pontosabban csak egy értéket írnék át: vasarhely-et marosvasarhely-re, a félreértések elkerülésének érdekében.

A livesin mező értékeit ilyen fajta értékekre fogom hozni.

Mielőtt az adattisztításnak nekifognék, átírom a lekicsinyített adathalmazomat egy más collection-be:

```js
db.getCollection('szekelydata').aggregate(
[
    {
        $match: {
            $and:[
                {livesin: {$exists: true}},
                {birth: {$exists: true}},
                {studwhere: {$regex: "sapientia", $options: "i"}}
            ]
        }
    },
    {
        $project: {
            livesin: "$livesin",
            birth: "$birth",
            studwhere: "sapientia"
        }
    },
    { $out : "sapientia" }
])
```

Egyúttal a studwhere mezőt is átírtam, hogy egyszerűen csak "sapientia" értéke legyen.

## Adattisztítás - birth mező

A birth mezőre, amint említettem, már volt egy fajta adattisztítás elvégezve. Ezért csak egy kis átnevezést fogok erre elvégezni:

```js
db.getCollection('sapientia').updateMany(
    {birth: "vasarhely"},
    {$set: {birth: "marosvasarhely"}}
)
```

## Adattisztítás - livesin mező

A livesin mezőben az értékeket olyan formára akarom hozni, mint amilyenben a birth mezők vannak.

### Marosvásárhely

Az ezelőtti livesin-re való distinct lekérdezésből kiolvastam azokat az értékeket amik tulajdonképpen Marosvásárhelyt jelentik, viszont másképp vannak bevezetve az adatbázisba.

A nagy településekhez kb 15 km-es körzetben tartozó kis településeket, falvakat is egybe vettem.
A feltételezésem az, hogy a nagy településhez közel lakó emberek nagy valószínűséggel ingáznak a nagy városba.
Az olyan rekordokat amik ilyen livesin mezővel rendelkeznek, azokat "marosvasarhely" értékre állítom.
```js
db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Marosvásárhely, Mures, Romania",
                "Targu-Mures",
                "Neumarkt Am Mieresch, Mures, Romania",
                "Mezöpanit, Mures, Romania",
                "Koronka",
                "Santana-De-Mures, Mures, Romania",
                "Leordeni, Mures, Romania",
                "Ilencfalva, Mures, Romania",
                "Valea Izvoarelor, Mures, Romania"
            ]
        }
    },
    {$set: {livesin: "marosvasarhely"}}
)
```

### Külföld

Azokat az illetőket, akik nem laknak se Magyarországon se Romániában, azoknak a livesin mezőjére azt az értéket tettem, hogy "kulfold".

```js
db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Vienna, Austria",
                "Faringdon",
                "Gänserndorf",
                "Castle Bromwich, West Midlands, United Kingdom",
                "Arrild, Sonderjylland, Denmark",
                "Cologne, Germany",
                "London, United Kingdom",
                "Hüttenberg, Hessen, Germany",
                "Løgumkloster",
                "Neu Isenburg",
                "Wellington, Somerset",
                "Fläsch, Switzerland",
                "Weinfelden, Switzerland",
                "Bishops Stortford",
                "Paphos, Paphos, Cyprus",
                "Bracknell",
                "Zürich, Switzerland",
                "Cham, Switzerland",
                "Stockholm, Sweden",
                "Neu-Anspach",
                "Hamm, Germany",
                "Eeklo, Belgium",
                "Amsterdam, Netherlands",
                "Schifferstadt",
                "Kolding, Denmark",
                "Bernwies, Bayern, Germany",
                "Gümmer, Niedersachsen, Germany",
                "Erlangen, Germany",
                "Mannheim, Germany",
                "Weißach, Bayern, Germany",
                "Leipzig, Germany",
                "Speyer, Germany",
                "Coventry, United Kingdom",
                "Chislehurst, Bromley, United Kingdom",
                "New Milton, Hampshire, United Kingdom",
                "Fleet, Hampshire",
                "Palomino, Magdalena, Colombia",
                "Liverpool",
                "Schliengen",
                "Prague, Czech Republic",
                "Copenhagen, Denmark",
                "Mutterstadt",
                "Albstadt",
                "Egenhausen",
                "Handeloh",
                "Miami Beach, Florida",
                "Melbourne, Victoria, Australia",
                "Sevenoaks, Kent",
                "Basingstoke"
            ]
        }
    },
    {$set: {livesin: "kulfold"}}
)
```

### Magyarország

Külön vettem azokat az illetőket akik magyarországi településen élnek, ezeknek a livesin mezőjébe a "magyarorszag" értéket tettem.

```js
db.getCollection('sapientia').updateMany(
    {
        livesin: 
        {
            $in: 
            [
                "Sopron",
                "Budapest, Hungary",
                "Tárnok, Pest, Hungary",
                "Godollo, Hungary",
                "Tatabánya",
                "Szentgotthárd",
                "Jászberény",
                "Szombathely",
                "Szeged",
                "Mosonmagyaróvár"
            ]
        }
    },
    {$set: {livesin: "magyarorszag"}}
)
```
### Stb.

Körülbelül 39 updateMany-t kellett lefuttatni az adattisztításhoz. Mindegyiket nem fogom ebbe az állományba bemásolni. Az összes updateMany megtalálható a clean_livesin.js állományban.

Az adattisztítás után a distinct a livesin-re így néz ki:

```js
[
    "marosvasarhely",
    "udvarhely",
    "kezdi",
    "ditro",
    "csikszereda",
    "kulfold",
    "szentgyorgy",
    "gyergyo",
    "gyulakuta",
    "nagyvarad",
    "magyarorszag",
    "oroszhegy",
    "bukarest",
    "keresztur",
    "gyulafehervar",
    "kolozsvar",
    "csikfalva",
    "disznajo",
    "barot",
    "vlahica",
    "torboszlo",
    "szovata",
    "parajd",
    "gyimes",
    "szarhegy",
    "erdoszentgyorgy",
    "csomafalva",
    "madefalva",
    "csernaton",
    "brasso",
    "szekelyszaldobos",
    "toplita",
    "balanbanya",
    "ujfalu",
    "jenofalva",
    "szeben",
    "bibarczfalva",
    "szatmar",
    "regen"
]
```

## Adatvizualizáció

Most következne az adatvizualizáció. Viszont egy pár dolgot még el kell végezni addig. 

Mivel a Tableu nem tudja felismerni azt, hogy "kezdi", mint egy városnév (meg a többi tiszta adatot), ezért egy kicsi kreativitásra lesz szükség.

A Tableu fel tud dolgozni viszont Latitude és Longitude információt decimális formátumban. Első sorban kiexportálom egy új collection-be azokat a rekordokat ahol a birth egyenlő a livesin mezővel:

```js
db.getCollection('sapientia').aggregate(
[
    {
        $match: 
        {
            $expr: {$eq: ["$birth", "$livesin"]}
        }
    },
    {
        $project: 
        {
            livesin: "$livesin"
        }
    },
    { $out: "sapientia_lat_lng"}
])
```

Mivel tudom, hogy a birth egyenlő a livesin-el, csak az egyiket szükséges eltárolnom.

Lefuttatok egy distinct lekérdezést, hogy nézzem meg milyen városokról van szó:

```js
db.getCollection('sapientia_lat_lng').distinct("livesin");
```

Erre az eredmény:

```js
[
    "marosvasarhely",
    "udvarhely",
    "kezdi",
    "csikszereda",
    "szentgyorgy",
    "gyergyo",
    "barot",
    "vlahica",
    "szovata",
    "kolozsvar",
    "keresztur",
    "parajd",
    "toplita",
    "regen"
]
```

Most ezeknek a városoknak ki kell keressem a koordinátájukat (pld. Google Maps-ből) és be kell szúrjak egy új *lat* és *lng* mezőt a rekordokhoz ezekkel az értékekkel.

Ezek után már egyszerűen tudom ábrázolni a *lat* és *lng* mezőket a Tableau-ban.

```js
db.getCollection('sapientia_lat_lng').updateMany(
    {
        livesin: "marosvasarhely"
    },
    {$set: {lat: 46.54, lng: 24.55}},
    {multi: true }
);
```

Ebben az esetben 14 updateMany-t kellett lefuttassak. Ezek megtalálhatóak a lat_lng.js állományban

Kiexportálom a sapientia_lat_lng collection-t egy json állományba, az alábbi paranccsal:

```
mongoexport -d szekelydata -c sapientia_lat_lng -o sapientia_lat_lng.json --jsonArray --pretty
```

Ekkor jöttem rá, hogy a Tableau-ban a térképen levő kvantitatív adatvizualizációhoz szükséges egy olyan mező ami a mértéket megadja.

**megjegyzés**: ezeket az utolsó lépéseket nem volt feltétlenül szükséges elvégeznem. Utólag tudtam meg, hogy a Tableau-ban a Sum(Number of Records)-ot behúzhattam volna a Size-hoz, így aszerint lettek volna méretezve a körök a térképen.

Ezért létrehozok egy új collection-t: sapientia_lat_lng_quant.
Lefuttatom a query-ket a lat_lng_quant.js állományban (livesin, lat, lng és count mezők beszúrása).

Kiexportálom json array-be.

```
mongoexport -d szekelydata -c sapientia_lat_lng_quant -o sapientia_lat_lng_quant.json --jsonArray --pretty
```

Buborékos:
![Buborékos](https://github.com/andraspatka/Databases2/blob/master/adatvizualizacio/res/bubbles.PNG)

Térképes:
![Térképes](https://github.com/andraspatka/Databases2/blob/master/adatvizualizacio/res/terkep.PNG)

Az adatvizualizáció megnézhető az [alábbi link-en.](https://public.tableau.com/profile/zsolt.andr.s.patka#!/vizhome/Sapientia-megmarads/Sheet2?publish=yes)
