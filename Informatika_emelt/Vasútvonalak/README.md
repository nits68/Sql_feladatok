# Vasútvonalak

A szárazföldi közlekedés a vasút megjelenésével indult ugrásszerű fejlődésnek. A magyar 
gőzvontatású vasút története 1844-ben kezdődött. A vasúti hálózat egy évszázadig 
folyamatosan terebélyesedett, azóta több hullámban zártak be vasútvonalakat részben vagy 
egészben. Ritkábban az is előfordult, hogy újranyitottak vonalakat. Az adatbázis a 
személyforgalmú vasútvonalak adatait tartalmazza. Az állomások a különböző vonalakon más-más helyet foglalhatnak el a kiindulási állomástól való távolságuk alapján.

Az adatbázist a vasutvonalak.sql fájl futtatásával hozza létre.
Megoldásait a megoldások.sql-be rögzítse, a feladat sorszáma után.

Az adatbázis táblái és kapcsolatai az alábbiak.

## Adatbázis táblák:

### allomasok (id, nev, tipus, orszag, mukodo)
| azonosító | típus       | leírás                                                                                       |
|-----------|-------------|----------------------------------------------------------------------------------------------|
| id        | int(11)     | Az állomás azonosítója (szám), elsődleges kulcs                                              |
| nev       | varchar(40) | Az állomás neve (szöveg); a nevek egyediek                                                   |
| tipus     | varchar(40) | Az állomás típusa (szöveg); megmutatja, hogy a vasúti forgalomban milyen szerepet töltött be |
| orszag    | varchar(40) | Az állomás országa (szöveg)                                                                  |
| mukodo    | tinyint(1)  | Az állomás működési állapota (logikai), ha működik, akkor értéke igaz                        |

### Az orszak mező leírásából fontos információt hagytatok ki!!!!

### vonalak (id, kisvasut, mukodo)
| azonosító | típus       | leírás                                                                  |
|-----------|-------------|-------------------------------------------------------------------------|
| id        | varchar(40) | A vasútvonal azonosítója (szöveg), elsődleges kulcs                     |
| kisvasut  | tinyint(1)  | A vasútvonal típusát mutatja (logikai), értéke igaz, ha kisvasúti       |
| mukodo    | tinyint(1)  | A vasútvonal állapotát mutatja (logikai), értéke hamis, ha felszámolták |

### helyek (id, vonalid, allomasid, tav)
| azonosító | típus       | leírás                                                                                                                                                         |
|-----------|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| id        | int(11)     | A vonal egy helyének azonosítója (szám), elsődleges kulcs                                                                                                      |
| vonalid   | varchar(40) | Annak a vasútvonalnak az azonosítója, ahol a hely található (szöveg), idegen kulcs                                                                             |
| allomasid | int(11)     | Annak az állomásnak az azonosítója, amelyik az adott helyen van (szám), idegen kulcs                                                                           |
| tav       | int(11)     | A hely kilométerben mért távolsága a vonal indulási állomásától (szám) az indulási állomáshoz tartozó távolság 0 km. Értéke a hely km-rekerekített távolsága   |

## Adatbázis diagram:

![Adatbázis-Diagram](Diagram.PNG)

## 2. feladat:

  A MÁV 6 hónapra kibérelte a moszkvai vasútállomás 42. peronját.
  Helyezze el ezt az új állomást a következő adatokkal.
  (5000, "Moszkva", "állomás", "RUS",0).

## 3.feladat:

  A moszkvai 42. számú peront működésbe helyeztük.
  Állítsá át az adatbázisban a megfelelő mezőt, hogy ezt jelezze.

## 4. feladat:

  6 hónapos kölcsönzési szerződésünk lejárt.
  Törölje Moszkvát az adatbázisből.

## 5. feladat:

  A feladat elkészítéséhez használt egyik forrás azt írja, hogy „Szeged-Feketehalom” 
  megállóhely sosem létezett. Törölje az **allomas** és a **hely** táblákból a rá vonatkozó adatokat! 
  A feladat megoldásához nem kell lekérdezést készítenie. 

## 6. feladat:
  Készítsen lekérdezést, amely az adatbázisban tárolt adatok alapján megjeleníti a jelenleg 
  Magyarországon kívül található állomások nevét és ország jelét, az állomásnév szerint 
  ábécérendben! 

  ![F6](F6_3IMG.png)

## 7. feladat:
  A 80-as vonal az egyik leghosszabb hazánkban. Készítsen lekérdezést, amely a kiinduló 
  állomástól mért távolság sorrendjében megjeleníti a működő állomások nevét, típusát és az 
  indulási állomástól mért távolságát!

  ### A 80-as vonal feltétel kimaradt a megoldásból!!!!

  ![F7](F7_IMG.png)

## 8. feladat:
  Készítsen lekérdezést, amely megadja az egyes vonalak hosszát, azaz az első és az utolsó 
  hely távolságát! Jelenítse meg a vonal azonosítóját és a hossz értékét!

  ### A feladat nem kér rendezést, de a megoldásban van!

  ![F8](F8_IMG.PNG)

## 9. feladat:
  Készítsen lekérdezést, hogy megadja az egyes vonalak azonosítóját, valamint az első és az utolsó állomását!

  ![F9](F9_IMG.PNG)

## 10. feladat:
  Készítsen lekérdezést, amely megadja, hogy Hatvan mely állomásokról érhető el jelenleg 
  vagy a múltban valamikor közvetlenül, azaz átszállás nélkül! Az állomás nevét és a vonal 
  azonosítóját jelenítse meg! Hatvan neve ne szerepeljen a listában!
  
  ![F10](F10_IMG.PNG)

## 11. feladat:
  Készítsen lekérdezést, amely megadja, hogy melyik állomás része legalább 5 
  vasútvonalnak! Az állomás nevét és a vonalak számát jelenítse meg darabszám szerint 
  csökkenő sorrendben!

  ![F11](F11_IMG.PNG)
  
## 12. feladat:
  Napjainkban két állomás közötti jegyet kell váltani, de régebben a jegy egy adott 
  távolságintervallumon volt érvényes: 5, 10, 20, …, 90, 100, … km-es jegyeket lehetett 
  venni. Ha valaki 100 km távolságra szóló jegyet vett, akkor bizonyára távolabb utazott, mint 
  90 km (mert az volt az azt közvetlenül megelőző, 100 km-nél rövidebb távra szóló jegy), 
  de a 100 km-t nem léphette túl. Készítsen lekérdezést, amelyik megadja, hogy a 140-es 
  vonal indulási állomásától hova utazhatott az, aki 100 km-es jegyet vett! Adja meg az 
  állomások nevét és a távolságát!

  ![F12](F12_IMG.PNG)
