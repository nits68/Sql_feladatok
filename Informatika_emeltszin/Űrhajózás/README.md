# 3. Űrhajózás 

A múlt század második felében az ember meghódította a világűrt is. A legtöbb ember ismeri Gagarin, Armstrong és Farkas Bertalan nevét. Természetesen rajtuk kívül is sokan jártak az űrben. Az adatbázis az adatgyűjtéskor már befejezett küldetések és az űrhajósok adatait tartalmazza.

### 1. Készítsen adatbázist urhajosok néven

- Futassa az (`urhajozas.sql`) állományt, az adatbázis elkészítéséhez, feltöltéséhez.
- A feladatok megoldására elkészített SQL parancsokat a `megoldások_urhajozas.sql` állományba illessze be a megfelelő feladatszám alá! A javítás során csak ennek az állománynak a tartalma lesz értékelve!

#### Táblák:

**1. `urhajosok` <small>(*id, nev, orszag, nem, szulev, urido*)</small>**
|Név|Típus|Leírás|PK|FK|
|---|---|---|---|---|
| id | int | Az űrhajós azonosítója (szám), ez a kulcs. |✓||
| nev | string | Az űrhajós neve (szöveg). Feltételezheti, hogy a nevek egyediek. |||
| orszag | char | Az űrhajós által képviselt ország az első kilövéskor (szöveg). Értéke hárombetűsazonosító. |||
| nem | char | Az űrhajós személy neme (szöveg). Értéke a férfiak esetén F, nőknél N. |||
| szulev | int | Az űrhajós születési éve (szám). |||
| urido | string | Az űrhajós által az űrben töltött összes idő (szöveg). Az első &karaktere minden esetben a T betű, utána 3 karakter a napokat, 2 az órákat, 2 a perceket jelöli. A számokat kettőspontválasztja el egymástól. |||


**2. `repulesek` <small>(*urhajosid, kuldetesid*)</small>**

<table>
    <thead>
        <tr>
            <th>Név</th>
            <th>Típus</th>
            <th>Leírás</th>
            <th>PK</th>
            <th>FK</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>urhajosId</td>
            <td>int</td>
            <td>Az űrhajós azonosítója (szám), ez a kulcs.</td>
            <td rowspan="2">✓</td>
            <td>✓</td>
        </tr>
        <tr>
            <td>kuldetesId</td>
            <td>int</td>
            <td>A küldetés azonosítója (szám), ez a kulcs.</td>
            <td>✓</td>
        </tr>
    </tbody>
</table>

**3 .`kuldetesek` <small>(*id, megnevezes, kezdet, veg*)</small>**

|Név|Típus|Leírás|PK|FK|
|---|---|---|---|---|
| id | int | A küldetés azonosítója (szám), ez a kulcs. |✓||
| megnevezes | string | A küldetés hivatalos neve (szöveg). |||
| kezdet | date | A küldetés kezdetének dátuma (dátum). |||
| veg | date | A küldetés befejezésének dátuma (dátum). |||

![Kép a kapcsolatokról](Images/diagram.png)
  
A következő feladatok megoldásánál ügyeljen arra, hogy a lekérdezésben pontosan a kívánt mezők szerepeljenek,
felesleges mezőt ne jelenítsen meg!
<br>

## 2. feladat

Illessze be a kuldetesek táblába a 2022. október 6-án kezdődött és 2023. március 11-én véget érő SpaceX Crew-5 expedíciót 323-as azonosítóval!

## 3. feladat

Simonyi Károly hivatalos neve jelenleg Charles Simonyi. Javítsa ki az urhajosok táblában Simonyi Károly nevét Charles Simonyi-ra.

## 4. feladat

Az egyik táblába hiba folytán fel lett véve egy hibás rekord. Törölje ki a "Nits László" nevű személyt az urhajosok adattáblából!

## 5. feladat

Lekérdezés segítségével határozza meg, hogy a nők közül ki töltötte a legtöbb időt az űrben
és mennyit! Jelenítse meg az űrhajós nevét és az urido mező értékét! 

![5. feladat](Images/5.feladat.png)

## 6. feladat

Előfordult, hogy egy küldetés résztvevői az újévet az űrben köszöntötték. Készítsen
lekérdezést, amely megadja ezen küldetések megnevezését és azt, hogy milyen hosszúak
voltak, azaz hány napig tartottak! 

![6. feladat](Images/6.feladat.png)

## 7. feladat

Készítsen lekérdezést, amelyik megadja, hogy a több űrrepülésen részt vevő űrhajósok hány
éves korukban kezdték az első és hány éves korukban az utolsó küldetésüket! Jelenítse meg
az űrhajós nevét, és a két életkort! A megjelenő adatsorok az űrhajós neve szerint ábécé rendben legyenek!

![7. feladat](Images/7.feladat.png)

## 8. feladat

Lekérdezés segítségével határozza meg, hogy az egyes országoknak hány űrhajósa szerepel
az adatbázisban! Az országok azonosítóját és az adott ország űrhajósainak számát
az űrhajósok száma szerint csökkenő sorrendben jelenítse meg!

![8. feladat](Images/8.feladat.png)

## 9. feladat


Határozza meg, hogy hány ország képviseletében repültek az űrhajósok!

![9. feladat](Images/9.feladat.png)

## 10. feladat

Készítsen lekérdezést, amelyben felsorolja azoknak a küldetéseknek a nevét, amelyben
legénység tagjai között férfi és nő is volt!

![10. feladat](Images/10.feladat.png)

## 11. feladat

NL: 1000x kértem, hogy ne legyen JELENTÉS!


Készítsen lekérdezést arról, hogy a 20. század utolsó évtizedében (1991-2000) megkezdett
küldetéseken milyen legénység vett részt! A listában a küldetés neve és kezdete kiemelve,
azon belül a nevek ábécérendben jelenjenek meg! A jelentés készítését lekérdezéssel
készítse elő! A jelentés elkészítésekor a mintából a mezők sorrendjét, a cím és a címkék
megjelenítését vegye figyelembe! A jelentés formázásában a mintától eltérhet. 

![11. feladat](Images/11.feladat.png)
