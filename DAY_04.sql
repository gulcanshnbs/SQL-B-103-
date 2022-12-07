--ALIASES

CREATE TABLE calisanlar36
(
calisan_id char (9),
calisan_isim varchar (50),
calisan_dogdugu_sehir VARCHAR(50)
);

INSERT INTO calisanlar36 VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO calisanlar36 VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO calisanlar36 VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT * FROM calisanlar36

-- Eger iki sutunun verilerini birlestirmek istersek concet sembolu || kullaniriz
SELECT calisan_id AS id, calisan_isim ||' ' || calisan_dogdugu_sehir AS calisan_bilgisi FROM calisanlar36

--2.Yol
SELECT calisan_id AS id, Concat (calisan_isim,' ',calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar36


CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

--Name sütununda olan degerleri listeleyelim
SELECT * FROM insanlar

SELECT name FROM insanlar WHERE name is NULL 

-- Insanlar taplosunda sadece null olmayan değerleri listeleyiniz

SELECT name FROM insanlar WHERE name IS NOT NULL

-- Insanlar toplasunda null değer almış verileri no name olarak değiştiriniz


-- 								ORDER BY CLAUSE
/*
	ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
	yapmak icin kullanilir
	ORDER BY komutu sadece SELECT komutu Ile kullanilir
*/

drop table if exists insanlar2
CREATE TABLE insanlar2
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar2 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar2 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar2 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar2 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar2 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar2 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar2

-- INsanlar tablosundaki datalar'i adres'e gore siralayin
select * from insanlar2 order by adres;
select * from insanlar2 order by soyisim;

--Insanlar tablosundaki ismi Mine olan SSn sirali sirali olarak listeleyin

SELECT * FROM insanlar2 WHERE isim='Mine' ORDER BY ssn

--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

SELECT * FROM insanlar2 WHERE soyisim='Bulut' ORDER BY 2



--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin

SELECT * FROM insanlar ORDER BY ssn DESC

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin

SELECT * FROM insanlar2 ORDER BY isim ASC, soyisim DESC;

--Isim ve soyisim degerlerini soyisim kelime uzunluguna gore siralayiniz
/* eger sutun uzunluguna gore siralamk istersek LENGTH komutu kullaniriz
ve yine uzunlugu buyukten kucuge siralamak istersek sonuna DESC komutunu ekleriz*/

SELECT isim,soyisim FROM insanlar2 ORDER BY LENGTH (soyisim) DESC;

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
SELECT isim || ' ' || soyisim AS isim_soyisim FROM insanlar2 ORDER BY LENGTH (isim||soyisim)

SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)

SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)

SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (concat(isim,soyisim))

--GROUP BY CLAUSE
/*
Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
komutuyla birlikte kullanılır.
*/
CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

SELECT * FROM manav

SELECT isim,sum(urun_miktar) AS aldığı_toplam_urun FROM manav
GROUP BY isim

--Isme gore alinan toplam urunleri bulun ve urunleri büyükten küçüğe listeleyiniz

SELECT isim,sum(urun_miktar) AS aldığı_toplam_urun FROM manav
GROUP BY isim
ORDER BY aldığı_toplam_urun DESC;

-- Urun ismine gore urunu alan toplam kisi sayisi
SELECT urun_adi,count(isim) FROM manav
GROUP BY urun_adi;

SELECT isim,count(urun_adi) FROM manav
GROUP BY isim


