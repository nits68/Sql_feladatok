--2.feladat
INSERT INTO nyelvek(id, fnyelv, cnyelv, egysegar) VALUES
( 145,"török","román",3000);

--3.feladat
UPDATE szemelyek
SET nev = "Kiss Tímea"
WHERE id = 75;

--4.feladat
DELETE FROM szemelyek WHERE id= 1;

--5.feladat
SELECT id, nev, elerheto
FROM szemelyek
WHERE elerheto = 1
ORDER BY nev ASC;

--6.feladat
SELECT COUNT(*) AS dokumentumok_szama, SUM(egysegar) AS osszbevetel
FROM dokumentumok
JOIN nyelvek ON dokumentumok.nyelvId = nyelvek.id
WHERE dokumentumok.terjedelem <= 5000;

--7.feladat
SELECT nyelvId, szakterulet, terjedelem
FROM dokumentumok
WHERE nyelvId = 50
ORDER BY terjedelem DESC;

--8.feladat*/
SELECT szakterulet AS 'Szakterület', fnyelv AS 'Forrásnyelv', cnyelv AS 'Célnyelv'
FROM dokumentumok
JOIN nyelvek ON nyelvId = nyelvek.id
WHERE munkaido >= 7 AND munkaido <= 9
ORDER BY fnyelv;

--9.feladat
SELECT nev
FROM szemelyek
JOIN forditok ON szemelyek.id = szemelyId
JOIN nyelvek ON nyelvId = nyelvek.id
WHERE fnyelv = 'magyar'
GROUP BY szemelyek.id
ORDER BY COUNT(DISTINCT cnyelv) DESC
LIMIT 1;

--10.feladat
SELECT szakterulet AS 'Szakterület', fnyelv AS 'Forrásnyelv', cnyelv AS 'Célnyelv'
FROM dokumentumok
INNER JOIN forditok ON dokumentumok.nyelvId = forditok.nyelvId
INNER JOIN nyelvek On forditok.nyelvId = nyelvek.id
GROUP BY szakterulet, fnyelv, cnyelv
ORDER BY szakterület, fnyelv;

--Pdf(7.feladata-nem működik)
SELECT nev
FROM nyelvek, forditok, szemelyek
WHERE nyelvek.id = nyelvId
      AND szemelyId = szemelyek.id
      AND elerheto = 1 
      AND (fnyelv = 'magyar' AND cnyelv = 'angol') AND (fnyelv = 'magyar' AND cnyelv = 'orosz');