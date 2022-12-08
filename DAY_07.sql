-- DISTINCT KULLANIMI
CREATE TABLE maas 
(
id int, 
musteri_isim varchar(50),
maas int 
);
INSERT INTO maas VALUES (10, 'Ali', 5000); 
INSERT INTO maas VALUES (10, 'Ali', 7500); 
INSERT INTO maas VALUES (20, 'Veli', 10000); 
INSERT INTO maas VALUES (30, 'Ayse', 9000); 
INSERT INTO maas VALUES (20, 'Ali', 6500); 
INSERT INTO maas VALUES (10, 'Adem', 8000); 
INSERT INTO maas VALUES (40, 'Veli', 8500); 
INSERT INTO maas VALUES (20, 'Elif', 5500);



SELECT * FROM maas

--Musteri urun tablosundaki urun isimlerini tekrarsiz(grup) listeleyiniz
--GROUP BY CÖZUMU
SELECT urun_isim FROM musteri_urun
GROUP BY urun_isim
--DISTINCT CÖZÜMÜ
SELECT DISTINCT (urun_isim) FROM musteri_urun

--Taboda kac farkli meyve vardir
SELECT count(urun_isim) FROM musteri_urun
GROUP BY urun_isim

--FETCH NEXT () ROW ONLY / OFFSET / LIMIT
--Musteri urun tablosundan ilk uc kaydi listeleyiniz

SELECT * FROM musteri_urun ORDER BY urun_id 
FETCH NEXT 3 ROW ONLY

--LIMIT 
SELECT * FROM musteri_urun ORDER BY urun_id
LIMIT 3

SELECT * FROM maas
SELECT * FROM musteri_urun
-- DISTINCT
-- DISTINCT clause, çağrılan terimlerden tekrarlı olanların sadece birincisini alır.

-- EN yüksek maası alan müsteriyi listeleyiniz
SELECT * FROM maas ORDER BY maas DESC limit 1

-- Maas tablosundan en yüksek ikinci maası listeleyiniz
SELECT * FROM maas ORDER BY maas DESC offset 1 limit 1

/*
OFFSET --> Satır atlamak istediğimizde offset komutunu kullanırız
*/

SELECT * FROM maas ORDER BY maas desc
OFFSET 1 
FETCH NEXT 1 ROW ONLY

-- Maas tablosundan en düşük dördüncü maası listeleyiniz
SELECT * FROM maas ORDER BY maas offset 3 limit 2


--DDL --> ALTER TABLE

CREATE TABLE personel  (
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

SELECT * FROM personel
ALTER TABLE personel
add zipcode varchar(30)

ALTER TABLE personel
ADD adres varchar(50) DEFAULT 'Turkiye' --DEFAULT yazarsak olusturdugumuz sutuna belirttigimiz veriyi tum satirlara girer

--DROP
--DROP tablodan sütun silme
ALTER TABLE personel
DROP COLUMN zipcode

ALTER TABLE personel
 DROP ulke
 
-- RENAMU COLUMN sutun adi degisme
ALTER TABLE personel
RENAME COLUMN sehir TO il

--RENAME tablonun ismi degistirme
ALTER TABLE personel
RENAME TO isci

SELECT * FROM isci

--TYPE/SET(modify) sutunlarin ozelliklerini ddegistirme

ALTER TABLE isci
ALTER COLUMN il TYPE varchar(30);
ALTER COLUMN  maas SET NOT NULL;
/*Eger numerik data türüne sahip sütunun data türüne string bir data türü atamak istersek 
TYPE varchar(30) USING (maas::varchar(30)) bu formati kullaniriz
*/
ALTER COLUMN maas
TYPE varchar(30) USING (maas::varchar(30))

--TRANSACTION
/*
	-->	TRANSACTION (BEGIN - SAVEPOINT - ROLLBACK - COMMIT)
	Transaction baslatmak icin BEGIN komutu kullanmamiz gerekir ve Transaction'i sonlandirmak icin
	COMMIT komutunu calistirmaliyiz.
*/
-- Serial data turu otomatik olarak birden baslayarak sirali olarak sayi atamasi yapar
-- INSERT INTO ile tabloya veri eklerken serial data turunu kullandigim veri degeri yerine DEFAULT yazariz

CREATE TABLE ogrenciler2
(
id serial,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);
BEGIN;
INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to y;
COMMIT;

SELECT * FROM ogrenciler2
delete from ogrenciler2
drop table orenciler2

/*
	Transaction kullaniminda SERIAL data turu kullanimi tercih edilmez. Save pointten sonra ekledigimiz
	veride sayac mantigi ile calistigi icin sayacta en son hangi sayida kaldiysa ordan devam eder.
	NOT :PostgreSQL de Transaction kullanımı için «Begin;» komutuyla başlarız sonrasında tekrar
	yanlış bir veriyi düzelmek veya bizim için önemli olan verilerden
	sonra ekleme yapabilmek için "SAVEPOINT savepointismi" komutunu
	kullanırız ve bu savepointe dönebilmek için "ROLLBACK TO savepointismi" komutunu
	kullanırız ve rollback çalıştırıldığında savepoint yazdığımız satırın üstündeki
	verileri tabloda bize verir ve son olarak Transaction'ı sonlandırmak için mutlaka
	"COMMIT" komutu kullanılır.
 */







