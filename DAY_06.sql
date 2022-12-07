--JOINS

CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota');  
INSERT INTO sirketler VALUES(101, 'Honda');  
INSERT INTO sirketler VALUES(102, 'Ford');  
INSERT INTO sirketler VALUES(103, 'Hyundai');


CREATE TABLE siparisler  (
siparis_id int,  
sirket_id int,
siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101, '2020-04-17');  
INSERT INTO siparisler VALUES(22, 102, '2020-04-18');  
INSERT INTO siparisler VALUES(33, 103, '2020-04-19');  
INSERT INTO siparisler VALUES(44, 104, '2020-04-20');  
INSERT INTO siparisler VALUES(55, 105, '2020-04-21');

select * from sirketler
select * from siparisler 

--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_ismi,siparisler.siparis_id,siparisler.siparis_tarihi
FROM sirketler INNER JOIN siparisler
ON sirketer.sirketler_id=siparisler.sirket_id

/*
NOT :
1) Select’ten sonra tabloda gormek istediginiz sutunlari yazarken Tablo_adi.field_adi seklinde yazin
2) From’dan sonra tablo ismi yazarken 1.Tablo ismi + INNER JOIN + 2.Tablo ismi yazmaliyiz
3) Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimiz yazilmali
*/

--LENF JOIN

/* NOT :
1) Left Join’de ilk tablodaki tum record’lar gosterilir.
2) Ilk tablodaki datalara 2.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir ancak
ortak olmayan datalar icin o kisimlar bos kalir
3) Ilk yazdiginiz Tablonun tamamini aldigi icin hangi tabloyu istedigimize karar verip once onu yazmaliyiz
 */ 

--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun

SELECT sirketler.sirketler_isim,siparisler.siparisler_id,siparisler.siparisler_tarihi
FROM sirketler LEFT JOIN siparisler
ON sirketler.sirketler_id0siparisler.sirket_id

--Örnek 
SELECT sirket_id FROM sirketler
INTERSECT 
SELECT sirket_id FROM siparisler

--FULL JOIN
/*
	NOT :
	1) FULL Join’de iki tabloda var olan tum record’lar gosterilir.
	2) Bir tabloda olup otekinde olmayan data’lar bos kalir
*/
SELECT sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
FROM sirketler FULL JOIN siparisler
ON sirketler.sirket_id=siparisler.sirket_id;



--SELF JOINS
drop table personal cascade

CREATE TABLE personel 
(
id int,
isim varchar(20), 
title varchar(60), 
yonetici_id int
);

INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);

SELECT * FROM personel

-- Her personelin yanina yonetici ismini yazdiran bir tablo olusturun

SELECT isim FROM personel 

SELECT p1.isim,p2.isim 
FROM personel p1 INNER JOIN personel p2 ON p1.yonetici_id=p2.id

--LIKE CONDITION 

CREATE TABLE musteriler1  (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1001, 'Ali', 62000);  
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1002, 'Ayse', 57500);  
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1004, 'Fatma', 42000);  
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1006, 'ahmet', 82000);

-- SORU : Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin
/* LIKE kullandigimizda buyuk kucuk harf gözetmeksizin sonuc almak istersek ILKE kullaniriz 
   LIKE yerine ~~, ILIKE yerine ~~* sembollerini kullanabilirz*/


SELECT * FROM musteriler1 WHERE isim ILIKE 'A%'
SELECT * FROM musteriler1 WHERE isim ~~* 'A%'

--Ismi e harfi ile biten musterilerin isimlerini ve gelirlerini yazdiran QUERY yazin

SELECT isim,gelir FROM musteriler1 WHERE ~~ '%e'

--Isimin icinde er olan musterilerin isimlerini ve gelirlerini yazdiran QUERY yazin

SELECT isim,gelir FROM musteriler1 WHERE ~~ '%er'

--Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin

SELECT * FROM musteriler1 WHERE isim ~~ '_atma'

--Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin

SELECT * FROM musteriler1 WHERE isim ~~ '_a%'

--Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin

SELECT * FROM musteriler1 WHERE isim ~~ '__s%'

-- LIKE Condition
/*
	3) REGEXP_LIKE =>Daha karmaşık sorgular için herhangi bir kod, metin icerisinde istenilen yazi
	veya kod parcasinin aranip bulunmasini saglayan kendine ait soz dizimi olan bir yapidir.
	(REGEXP_LIKE) PostgreSQL de ‘’ ~ ‘’ karekteri ile kullanilir
*/

--REGEXP_LIKE

CREATE TABLE kelimeler  (
id int UNIQUE,
kelime varchar(50) NOT NULL,  
Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3);  
INSERT INTO kelimeler VALUES (1002, 'hat', 3);  
INSERT INTO kelimeler VALUES (1003, 'hit', 3);  
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);  
INSERT INTO kelimeler VALUES (1008, 'hct', 3);  
INSERT INTO kelimeler VALUES (1005, 'adem', 4);  
INSERT INTO kelimeler VALUES (1006, 'selim', 5); 
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);
INSERT INTO kelimeler VALUES (1009, 'hAt', 5);

SELECT * FROM kelimeler

--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran QUERY yazin
 SELECT * FROM kelimeler WHERE kelime ~* 'h[ai]t'

--SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin  tum bilgilerini  yazdiran QUERY yazin

SELECT * FROM kelimeler WHERE kelime ~* 'h[a-k]t'

--SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~* '^[as]'

--SORU : m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~* '[mf]$'

--UPPER – LOWER - INITCAP
/*
UPPER – LOWER - INITCAP
Tablolari yazdirirken buyuk harf, kucuk harf veya ilk harfleri buyuk digerleri
kucuk harf yazdirmak icin kullaniriz.
INITCAP istediginiz sutundaki verilerin ilk harfini buyuk yazar
 */
 
--Kelimelere tablosundaki kelime sutunundaki verilerin once hepsini buyuk harf, sonra kucuk harf ve ilk harfleri 
-- Buyuk harf olacak sekilde yazdiralim
SELECT UPPER (kelime) as kelime FROM kelimeler 

SELECT LOWER (kelime) as kelime FROM kelimeler 

SELECT INITCAP (kelime) as kelime FROM kelimeler 

/* Eger birden fazla sutundaki verileri buyuk kucuk harf yapmak istersek s
select lower(title),upper(isim) from personal seklinde yapabiliriz.*/


