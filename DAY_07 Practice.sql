create table arac(
id int,
marka varchar(30),
model varchar(30),
fiyat int,
kilometre int,
vites varchar(20)
)
insert into arac values(100, 'Citroen', 'C3', 500000, 5000, 'Otomatik' );
insert into arac values(101, 'Mercedes', 'C180', 900000, 10000, 'Otomatik' );
insert into arac values(102, 'Honda', 'Cıvıc', 400000, 15000, 'Manuel' );
insert into arac values(103, 'Wolkswagen', 'Golf', 350000, 20000, 'Manuel' );
insert into arac values(104, 'Ford', 'Mustang', 750000, 5000, 'Otomatik' );
insert into arac values(105, 'Porsche', 'Panamera', 850000, 5000, 'Otomatik' );
insert into arac values(106, 'Bugatti', 'Veyron', 950000, 5000, 'Otomatik' );

--SORU1: arac tablosundaki en yüksek fiyat'ı listele
SELECT MAX (fiyat) from arac;

--SORU2: arac tablosundaki fiyatların toplamını listele
SELECT SUM (fiyat) FROM arac;

--SORU3: arac tablosundaki fiyat ortalamalarını listele
SELECT avg(fiyat) FROM arac;
SELECT round(avg(fiyat)) FROM arac;
SELECT round(avg(fiyat),2) FROM arac;

--SORU4: arac tablosunda kaç tane araç oldugunu listele
SELECT 



