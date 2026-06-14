-- 1
-- Prikazati vozače (IDV, IMEV, PREZV), sortirane u opadajućem
-- redosledu prezimena vozača.
SELECT IDV, IMEV, PREZV FROM VOZAC
    ORDER BY PREZV DESC;

-- 2
-- Prikazati sve vozače (IDV, IMEV, PREZV) koji u svom imenu imaju
-- slovo L.
SELECT IDV, IMEV, PREZV FROM VOZAC
    WHERE IMEV LIKE '%L%' OR 
          IMEV LIKE '%l%';
SELECT *FROM VOZAC;

-- 3
-- U tabelu Drzava, dodati kolonu GLGRAD koja predstavlja glavni grad
-- države. Za kolonu GLGRAD važi da su njene moguće vrednosti nizovi
-- karaktera maksimalne dužine 30. Kao podrazumevanu vrednost kolone
-- postaviti nedostajuću vrednost NULL.
ALTER TABLE DRZAVA 
    ADD (GLGRAD VARCHAR(30) DEFAULT NULL);

-- 4
-- Prikazati vozače (ime, prezime) koji su na nekoj od uspešno završenih
-- vožnji imali veću maksimalnu brzinu od prosečne maksimalne brzine svih
-- uspešno završenih vožnji. Ako je vozač više puta ostvario maksimalnu brzinu
-- veću od prosečne maksimalne brzine za završene vožnje, prikazati ga samo
-- jednom. Rezultat sortirati u rastućem redosledu imena vozača.

SELECT IDV, IMEV, PREZV, MAX(MAKSBRZINA) FROM
(
    SELECT DISTINCT IDV, IMEV, PREZV, MAKSBRZINA FROM REZULTAT R, VOZAC V
    WHERE R.VOZACR = V.IDV AND
    ZAVRSIO = 'Y' AND
    MAKSBRZINA > (SELECT AVG(MAKSBRZINA) AS PBY FROM REZULTAT)
)
GROUP BY IDV, IMEV, PREZV
ORDER BY IMEV ASC;

-- 5
-- Prikazati vozače (ime, prezime i naziv države za koju nastupa vozač), naziv staze,
-- sezonu i naziv države u kojoj se staza nalazi za sve rezultate posle
-- sezone 2015. 
SELECT IMEV, PREZV, NAZIVD, NAZIVS, (SELECT NAZIVD FROM DRZAVA WHERE V.DRZV = IDD) AS "DOLAZI IZ" 
FROM REZULTAT R, VOZAC V, STAZA S, DRZAVA D
    WHERE R.VOZACR = V.IDV AND
          R.STAZAR = S.IDS AND
          S.DRZS = D.IDD   AND
          SEZONA > 2015;

-- 6
-- Prikazati sve vozače koji su nastupali na stazi Hocnenheimring, a nisu
-- nastupali na stazi Monza.
SELECT IMEV, PREZV FROM REZULTAT R, VOZAC V, STAZA S
    WHERE R.VOZACR = V.IDV AND
          R.STAZAR = S.IDS AND
          R.STAZAR = (SELECT IDS FROM STAZA WHERE NAZIVS = 'Hocnenheimring')
MINUS
SELECT IMEV, PREZV FROM REZULTAT R, VOZAC V, STAZA S
    WHERE R.VOZACR = V.IDV AND
          R.STAZAR = S.IDS AND
          R.STAZAR = (SELECT IDS FROM STAZA WHERE NAZIVS = 'Monza');

-- 7
-- Prikazati sve vozače (IDV, IMEV, PREZV) koji imaju zabeležene
-- rezultate iz najviše jedne različite sezone. Prikazati i vozače koji nemaju
-- zabeležen ni jedan rezultat.
SELECT * FROM
(
    SELECT DISTINCT IDV, IMEV, PREZV FROM REZULTAT R, VOZAC V
        WHERE R.VOZACR(+) = V.IDV
        GROUP BY IDV, IMEV, PREZV, SEZONA
        HAVING COUNT(SEZONA) <= 1
)
GROUP BY IDV, IMEV, PREZV;

-- 8
-- Svakom vozaču promeniti ime tako da se na kraj imena doda prvo slovo prezimena.
UPDATE VOZAC
    SET IMEV = IMEV || SUBSTR(PREZV, 1, 1);

-- 9
-- Kreirati pogled Pogled_Vozac_Rezultat koji će za svakog vozača (IDV,
-- IMEV, PREZV) prikazati prosečnu maksimalnu brzinu. Pogled prikazuje
-- podatke samo za vozače koji imaju prosečnu maksimalnu brzinu manju od 350
-- km/h. Prosečnu maksimalnu brzinu zaokružiti na dva decimalna mesta. Ako
-- vozač nema nijedan zabeležen rezultat za vozača prikazati da je njegova
-- prosečna maksimalna brzina 0.
CREATE OR REPLACE VIEW POGLED_VOZAC_REZULTAT AS 
(
    SELECT IDV, IMEV, PREZV, ROUND(NVL(AVG(MAKSBRZINA), 0), 2) AS PROS_BRZ FROM REZULTAT R, VOZAC V
        WHERE R.VOZACR = V.IDV
        GROUP BY IDV, IMEV, PREZV
        HAVING AVG(MAKSBRZINA) < 350
);

SELECT *FROM POGLED_VOZAC_REZULTAT;

-- 10
-- Za svaku različitu trku (staza i sezona u kojoj se vozilo na stazi) prikazati
-- prosečan osvojeni broj poena zaokružen na dve decimale. Rezultate sortirati u
-- opadajućem redosledu naziva staze. U upitu je neophodno izvršiti konverziju
-- bodova za sezonu 2019. Konverzija se vrši na način da se prvoplasiranim
-- dodeljuju još tri, drugoplasiranom dva, a treće plasiranom jedan dodatni bod.
-- Za sve ostale rezultate se ne vrši konverzija.
WITH RANG_LIST AS
    (
    SELECT STAZAR, SEZONA, NAZIVS, BODOVI FROM
    (
        SELECT STAZAR, SEZONA, 
        CASE
            WHEN SEZONA = 2019 AND PLASMAN = 1 THEN ROUND(AVG(NVL(BODOVI, 0)), 2) + 3
            WHEN SEZONA = 2019 AND PLASMAN = 2 THEN ROUND(AVG(NVL(BODOVI, 0)), 2) + 2
            WHEN SEZONA = 2019 AND PLASMAN = 3 THEN ROUND(AVG(NVL(BODOVI, 0)), 2) + 1
            ELSE ROUND(AVG(NVL(BODOVI, 0)), 2)
        END AS BODOVI, 
        NAZIVS FROM REZULTAT R, STAZA S
            WHERE R.STAZAR = S.IDS(+)
            GROUP BY STAZAR, SEZONA, BODOVI, NAZIVS, PLASMAN
    )
    GROUP BY STAZAR, SEZONA, BODOVI, NAZIVS
    ORDER BY NAZIVS DESC
    )
SELECT RL.STAZAR, RL.SEZONA, RL.NAZIVS, AVG(RL.BODOVI) AS "PROSEČNI POENI" FROM RANG_LIST RL
    GROUP BY RL.STAZAR, RL.SEZONA, RL.NAZIVS;