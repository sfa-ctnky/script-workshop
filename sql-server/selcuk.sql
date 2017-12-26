SQL 2008

 

--TSQL (Transact Structered Query Language)

 

-- DML : Data Manipulation Language

-- DDL : Data Definition Language

-- DCL : Data Control Language

 

--DML : (Select , Insert , Update ,Delete)

 

Select 5

Select 'Ali'

Select 'Ali ' + 'Ak'

 

-- as keyword'ü ile kolonlarınıza bir ad verebilirsiniz.

Select 'Ali ' + 'Ak' as Personel

 

Select 5+5 as Toplam

Select 'Veli','Pak'

Select 'Veli' as Adı,'Pak' as Soyadı

 

--Len ile metinsel ifadenin uzunlugunu alırız.

Select Len('Istanbul') as Uzunluk

 

--Upper : verilen metinsel ifadeyi büyük harfe çevirir.

Select Upper('naber') as [Büyük Harfe Çevrilmiş]

 

--Lower : Verilen metinsel ifadeyi küçük harfe çevirir.

Select Lower('NABER')

 

Select '                Naber       '

 

--LTrim : Verilen metinsel ifadenin solundaki boşlukları keser.

Select LTrim('           Naber')

 

--RTrim : Verilen metinsel ifadenin sagındaki boşlukları keser.

Select RTrim('Naber                                ')

 

--Iki Taraftan Boşlukları Kesmek

Select RTrim(LTrim('              Naber           '))

 

--Substring : Verilen metinsel ifadenin belirlenen index'den,belirlenen uzunluk kadar kesme işlemi yapar

--Sql ' de index 0 'dan degil 1 ' den başlar.

--Substring metodunda ilk parametre metinsel ifade,2. parametre kaçıncı index'den başlayacagımız,3.parametre kaç karakter kesme işlemi yapılacak.

Select Substring('Hede Höde',6,4)

 

--Right : Metinsel ifadenin Sagından belirlediginiz kadar karakteri alır.

 

Select Right('Hede Höde',2)

 

--Left : Metinsel ifadenin solundan belirlediginiz kadar karakter alır.

Select Left('Hede Höde',3)

 

 

--Replace : Belirlediginiz metinsel ifade de belirlediginiz degerler degiştirilir.

Select Replace('Bilge Adam','Adam','Kadın')

 

--Reverse: Belirlediginiz metinsel ifade ters çevrilir.

Select Reverse('Naber')

 

--Tarihsel Işlemler

Select GetDate() -- Tarih ve Saat bilgisi Verir

Select Year(GetDate()) -- Yıl bilgisi Verir

Select Month(GetDate()) -- Ay bilgisini Verir

Select Day(GetDate())  -- Gün Bilgisini Verir

 

Select DatePart(Year,GetDate())

Select DatePart(Month,GetDate())

Select DatePart(Day,GetDate())

Select DatePart(Hour,GetDate())

Select DatePart(Minute,GetDate())

Select DatePart(Second,GetDate())

 

Select DateAdd(Year,1,GetDate()) -- Belirledigimiz yıla 1 yıl eklendi.

Select DateAdd(Month,2,GetDate())

Select DateAdd(Day,4,GetDate())

Select DateAdd(Hour,1,GetDate())

Select DateAdd(Minute,5,GetDate())

 

--DateDiff ile belirledigimiz tarihler arası farkı,belirledigimiz zaman cinsinden elde ederiz.

Select DateDiff(Year,'12.12.2000',GetDate())

Select DateDiff(Month,'12.12.2011',GetDate())

Select DateDiff(Day,'12.31.2011',GetDate())

 

Set Language Turkish -- ile gün ve ay degerlerini Türkçe elde ederiz

 

Select DateName(DW,GetDate()) -- Gün Adını

Select DateName(MM,GetDate()) -- Ay Adını

 

--------------------------------------------

 

Select CategoryName from Categories

 

Select CategoryName,Description from Categories

 

-- * ile tablo içerisindeki tüm alanlar gelmiş olur.

Select * from Categories

 

Select FirstName from Employees

 

Select FirstName + ' ' + LastName  as Personel

from Employees

 

--Hangi Çalışanım Kaç Yaşında ?

 

Select FirstName,DateDiff(Year,BirthDate,GetDate()) as Yasi from Employees

 

 

 

--Hangi çalışanım kaç yaşında işe girmiş ?

 

Select FirstName,DateDiff(Year,BirthDate,HireDate)

as [Işe Giriş Yaşı] from Employees

 

--Hangi Çalışanım nerede oturuyor ?

 

Select FirstName,Address,City,Country

from Employees

 

--Hangi Müşterim Nerede Oturuyor ?

 

Select CompanyName,Address,City,Country

from Customers

 

--Kargo Şirketlerim (Shippers) ?

 

Select CompanyName,Phone

From Shippers

 

--Her Bir sorgu arasına Go(Batch Seperator) yazarsınız altını kırmızı çizmez.

 

Select CompanyName,Region from

Customers

 

--Gelen Verilerden eger null bir deger geliyorsa bu gelen null degerin yerine başka bir deger yazmak isterseniz IsNull fonksiyonunu kullanabilirsiniz.Ilk deger kontrol edilecek kolon,2.deger ise null gelecek yere yazılmasını istediginiz deger.

 

Select CompanyName,IsNull(Region,'Belirtilmemiş') as Region

from Customers

 

-------------

 

Select * from Products

 

--Where : ile sorgularımızı filtreleyebiliriz.Yani belli süzgeç işleminden geçirerek verilerimiz elde ederiz.

 

--1. numaralı kategoriye sahip ürünleri listele

 

Select * from Products

where CategoryId = 1

 

--Birleşik krallıkta yaşayan çalışanlarımın listesi

 

Select * from Employees

Where Country = 'UK'

 

 

 

 

 

 

 

 

--Karşılaştırma Operatörleri

 

 -- and

 -- or

 -- =  Eşit

 -- != ( < > ) Eşit Degil

 -- >  Büyüktür

 -- <  Küçük

 -- <= Küçük Eşit

 -- >= Büyük Eşit

 

-- Stok degeri 10'dan küçük olan ürünler

 

Select * from Products

Where UnitsInStock < 10

 

--Birim fiyatı 50 'den fazla olan ürünlerimin listesi

 

Select * from Products

Where UnitPrice > 50

 

--Tedarikçisi 2 olan ürünlerimin listesi

 

Select * from Products

Where SupplierId = 2

 

--Kargolanma tarihi bulunmayan siparişlerimin listesi

 

Select * from Orders

Where ShippedDate is null

 

--Kargolanma tarihi bulunan siparişlerimin listesi

 

Select * from Orders

Where ShippedDate is not null

 

--1998 yılında alınmış olan siparişlerimin listesi

 

Select * from Orders

Where Year(OrderDate) = 1998

 

--Taşıma ücreti 20 'den az olan 1 veya 3 numaralı çalışanlarımın almış oldugu siparişlerimin listesi

 

Select * from Orders

Where Freight < 20 and

(EmployeeId=1 or EmployeeId=3)

 

--Almanyaya,Fransaya ve Italyay yollanan siparişlerimin listesi

 

Select * from Orders

Where ShipCountry = 'Germany' or

ShipCountry = 'France' or ShipCountry = 'Italy'

 

 

 

 

--In

 

Select * from Orders

Where ShipCountry In ('Germany','France','Italy')

 

--Birim Fiyatı 20 ile 30 arasında olan ürünlerimin listesi

 

Select * from Products

Where UnitPrice > 20 and UnitPrice < 30

 

--20 ve 30 dahil edildi.

Select * from Products

Where UnitPrice Between 20 and 30

 

--20 ile 30 arasında olmayan ürünlerimin listesi

 

Select * from Products

Where UnitPrice Not Between 20 and 30

 

--Like : Metinsel ifade de karakter araması yapmak için kullanılır.

 

--Adında 'an' geçen çalışanlarımın listesi

 

Select * from Employees

Where FirstName like '%an%'

 

--Adı 'e' ile biten çalışanlarımın listesi

 

Select * from Employees

Where FirstName like '%e'

 

--Adı 'n' ile başlayan çalışanlarımın listesi

 

Select * from Employees

Where FirstName like 'n%'

 

--adı 'e' ile bitmeyen çalışanlarımın listesi

 

Select * from Employees

Where FirstName like '%[^e]'

 

--Soyadı A-F aralıgındaki bir harfle bitmeyen çalışanlarımın listesi

 

Select * from Employees

Where LastName like '%[^A-F]'

 

Select * from Employees

Where LastName like '%[A-F]'

 

--Adındaki ilk harfi 'n' olmayan çalışanlarımın listesi

 

Select * from Employees

Where FirstName like '[^n]%'

 

 

 

 

--Müşteri kodunun 3.harfi 'o' olan müşterilerimin listesi

 

Select * from Customers

Where CustomerId like '__o%'

 

--Müşteri kodunun 3.harfi 'M-P' araasında olan müşterilerilerimin listesi

 

Select * from Customers

Where CustomerId like '__[M-P]%'

 

--Ilk harfi 'a' 5. harfi 'ı' olan müşterilerimin listelenmesi

 

Select * from Customers

Where CustomerId like 'a___ı'

 

--ikinci harfi 'a' 5. harfi 'g' olan müşterilerimin listelenmesi

 

Select * from Customers

Where CustomerId like '_a__g'

 

--Order By : ifadesi ile çektiginiz verileri küçükten büyüge veya büyükten küçüge dogru sıralayabilirsiniz.

 

--ASC (Ascending) : Küçükten büyüge dogru sıralar (Default)

 

--DESC (Descending) : Büyükten küçüge dogru sıralar.

 

Select ProductName from Products

Order By ProductName   -- ASC

 

Select ProductName from Products

Order By ProductName Desc

 

--UnitPrice Desc

 

Select ProductName,UnitPrice from Products

Order By UnitPrice Desc

 

--Almanyaya gönderilen siparişlerimin tarihlere göre yeniden eskiye göre listesi

 

Select ShipCountry,OrderDate

From Orders

Where ShipCountry = 'Germany'

Order By OrderDate Desc

 

--Özelleştirilmiş kolon adlarına göre listeleme

 

Select ShipCountry as Ülke,OrderDate as [Sipariş Tarihi] from Orders

Order By Ülke ASC,[Sipariş Tarihi] DESC

 

Select ShipCountry as Ülke,OrderDate as [Sipariş Tarihi] from Orders

Order By [Sipariş Tarihi] DESC,Ülke ASC

 

--Personel ad,soyad ,dogum tairhindeki yıl bilgisi

 

Select LastName,FirstName,Year(BirthDate) as Tarih from Employees

 

--Personel ismin ilkharfi a veya l

 

Select FirstName from Employees

Where FirstName like 'a%' or FirstName like 'l%'

 

--ünvanı Mr. olmayanların listelenmesi

 

Select * from Employees

Where TitleOfCourtesy Not Like 'Mr.'

 

Select * from Employees

Where TitleOfCourtesy != 'Mr.'

 

--adı nancy olana kaydın listelenmesi

 

Select  * from Employees

Where FirstName = 'Nancy'

 

--ünvanı Mr.olanların listelenmesi

 

Select * from Employees

Where TitleOfCourtesy = 'Mr.'

 

--görevi Sales Representative olan personel

 

Select * from Employees

Where Title = 'Sales Representative'

 

--işle başlama tarihi 1993 yılından sonra olanların listelenmesi

 

Select * From Employees

Where Year(HireDate) > 1993

 

---------------------------------------

 

-- Agregate Function : Genelde matematiksel işlemler için kullanılır.Geriye tek bir hücre degeri döndürür.

 

--1.Count : Sorgudaki kayıt sayısını elde etmek için kullanılan bir fnct'dır.

 

Select Count(*) as [Ürün Sayısı]

From Products

 

--Toplam Siparişlerimin Sayısı

 

Select Count(OrderId) as [Sipariş Sayısı]

from Orders

 

--Yüklenmemiş Siparişlerimin Sayısı : 21 Tane

 

Select Count(OrderId) as [Yüklenmemiş Siparişler]

From Orders

Where ShippedDate is null

 

 

 

--Yüklenmiş Siparişlerin Sayısı  : 809

 

Select Count(OrderId) as [Yüklenmiş Siparişler]

From Orders

Where ShippedDate is not null

 

Select * from Orders  -- 830

 

--2.Sum : Tablodaki belirtilen kolonu toplayan bir funct'dır.

 

--Ürünler toplam stok

 

Select Sum(UnitsInStock) as [Toplam Stok]

From Products

 

--Stoktaki tüm ürünleri satarsam ne kadar gelir elde ederim.

 

Select Sum(UnitPrice * UnitsInStock)                as [Toplam Gelir]

From Products

 

--1997 yılındaki tüm kargo ücretim ne kadar

 

Select Sum(Freight) as [Toplam Kargo Masrafı]

From Orders

Where Year(OrderDate) = 1997

 

--3.AVG (Average) : Belirtilen kolondaki degerlerin ortalamasını alan bir fnct'dır.

 

--Ürünler tablosunda ortalama fiyat

 

Select Avg(UnitPrice) as [Ortalama Fiyat]

From Products

 

--4.Max/Min : Belirtilen kolondaki Büyük/Küçük degeri getiren bir fnct'dır.

 

--En Pahalı Ürün Ne kadar

 

Select Max(UnitPrice) as [En Pahalı Ürün]

From Products

 

--En Ucuz Ürün

 

Select Min(UnitPrice) as [En Ucuz Ürün]

From Products

 

--En Genç Çalışanımın Yaşı

 

Select DateDiff(Year,Max(BirthDate),GetDate())

From Employees

 

Select Min(DateDiff(Year,BirthDate,GetDate()))

From Employees

 

 

 

 

--Top : Sorgumuzda Belirli miktarda veri çekmek kullanılan bir keyworddür.

 

--ilk 10 Ürün

 

Select Top 10 ProductName

From Products

 

--En pahalı 10 Ürün

 

Select Top 10 ProductName,UnitPrice

From Products

Order By UnitPrice Desc

 

--En Genç Çalışanımın Yaşı

 

Select Top 1 FirstName,                       DateDiff(Year,BirthDate,GetDate()) as [Yaşı]

From Employees

Order By BirthDate Desc

 

 

--Stok Miktarı En Fazla olan 6 Ürün

 

Select Top 6 ProductName,UnitsInStock

From Products

Order By UnitsInStock Desc

 

--Sorgu Dogru ama Eksik : Sebebi Aynı Degerdeki 7. Kaydı Almadı

 

Select ProductName,UnitsInStock from Products

Order By UnitsInStock Desc

 

--With Ties keyword'ü ile aynı degere sahip degeri almış olduk ve böylelikle sorgumuz daha gerçekçi verileri getirmiş oldu.

 

Select Top 6 With Ties ProductName,UnitsInStock

From Products

Order By UnitsInStock Desc

 

--Top ile yüzdelik kayıt getirme

 

--Ürünlerin Yüzde 50 'isini Getir

 

Select Top 50 Percent ProductName

From Products

 

--Bir Tablodan Rastgele Veri Çekmek

 

Select ProductName,UnitsInStock,UnitPrice

From Products

Order By NewId()

 

--Rastgele Tek Ürün Çekmek

 

Select Top 1 ProductName,UnitPrice

From Products

Order By NewId()

 

--Hangi Ülkelerden Müşterilerim Var

 

Select ShipCountry

From Orders

 

--Distinct : Verilerin benzersiz bir şekilde getirilmesini saglar.Aynı verilerin tekrar getirilmesini engeller.

 

Select Distinct ShipCountry

From Orders

 

-----------------

 

Select FirstName,Count(EmployeeId)

From Employees

 

Select Count(EmployeeId)

From Employees

 

Select FirstName From Employees

 

--Group By : Keyword'ü ile sorgumuz içerisinde yer alan aggregate fnct'ları kullanabiliriz.

 

Select FirstName,Count(EmployeeId)

From Employees

Group By FirstName

 

--Ünvanlara göre çalışan Getirme

 

Select Title,Count(FirstName) AS [Personel Sayısı]

From Employees

Group By Title

 

--En genç Çalışanımın adı ve yaşı

 

Select Top 1 FirstName,LastName,Min(DateDiff(Year,BirthDate,GetDate())) as Yasi

From Employees

Group By FirstName,LastName

Order By Yasi Asc

 

 

--Toplam Satış Geliri 1.500'den fazla olan ürünlerimin listesi

 

Select ProductId,Sum(UnitPrice * UnitsInStock)

From Products

Group By ProductId

Where Sum(UnitPrice * UnitsInStock)>1500

 

--Having :

 

Select ProductId,Sum(UnitPrice * UnitsInStock)

From Products

Group By ProductId

Having Sum(UnitPrice * UnitsInStock) > 1500

 

 

------------------------

 

Select ProductName,CategoryId

From Products

 

--Join : Tabloları birleştirmek için kullanılan bir yapıdır.

 

--1. Inner Join : Birleştireceginiz tablolardaki ortak kolonlar vasıtası ile ve bu kolonlara karşılık gelen degerlerin sonucu size inner join ile döndürülür.

 

--Ürün Adı , Kategori Adı

 

Select ProductName,CategoryName

From Products Inner Join Categories

On Products.CategoryId = Categories.CategoryId

 

--Ürün Adı , Şirket adı

 

Select ProductName,CompanyName

From Products as P Inner Join Suppliers as S

On P.SupplierId = S.SupplierId

 

--Sipariş Numarası , Ürün Adı , Kategori Adı , Tedarikçi Firma Adı

 

Select OrderId,ProductName,CategoryName,CompanyName

From [Order Details] as OD Inner Join Products as P

On OD.ProductId = P.ProductId

Inner Join Categories as C

On C.CategoryId = P.CategoryId

Inner Join Suppliers as S

On P.SupplierId = S.SupplierId

 

--Sipariş No , Çalışan Adı , Müşteri Adı , Ürün Adı , Satış fiyatı , Satış Adedi, Kargo Adı

 

Select OD.OrderId,FirstName,C.CompanyName,ProductName,OD.UnitPrice,Quantity,S.CompanyName

From Orders as O Inner Join Customers as C

On O.CustomerId = C.CustomerId

Inner Join Shippers as S

On S.ShipperId = O.ShipVia

Inner Join Employees as E

On E.EmployeeId = O.EmployeeId

Inner Join [Order Details] as OD

On O.OrderId = OD.OrderId

Inner Join Products as P

On OD.ProductId = P.ProductId

 

--Eger aynı kolondan başka tabloda da varsa o kolonun hangi tablodan çekildigini belirtmelisiniz.Aksi takdirde Ambigous Name hatası alırsınız.

 

 

--2.) Left/Right/Full Outer Join : Inner join yapısında size yazdıgınız sorguda karŞılıgı olan degerler veriler getirilir.Eger karŞılıgı olmayan verilerin de getirilmesini isterseniz devreye Right/Left/Full Join girecek.

 

Select ProductName,CategoryName

From Products Left Outer Join Categories

On Products.CategoryId = Categories.CategoryId

 

Select ProductName,CategoryName

From Products Right Outer Join Categories

On Products.CategoryId = Categories.CategoryId

 

Select ProductName,CategoryName

From Products Full Outer Join Categories

On Products.CategoryId = Categories.CategoryId

 

--Cross Join : Verileri tek tek eŞleŞtirip size getirir.Yani bir tablo da 5 kayıt diger tabloda da 5 kayıt varsa size toplam 25 kayıtlık bir sonuc getirir.

 

Select ProductName,CategoryName

From Products Cross Join Categories

 

--Union : Mevcut verileri alt alta getirir.

--Uyulması Gereken Kurallar

--1.Çektiginiz kolonlar uyumlu tip olması lazım

 

Select CategoryId,CategoryName

From Categories

Union

Select CustomerId,CompanyName

From Customers

 

--Hata 1. Kural

 

Select ProductId,ProductName

From Products

Union

Select CategoryId,CategoryName

From Categories

 

--2.Kural : Tablolardan aynı sayıda kolon çekmelisiniz.

 

Select ProductId,ProductName,SupplierId

From Products

Union

Select CategoryId,CategoryName

From Categories

 

--Hata 2.Kural

 

--Not : Union ' da iki tablodan da aynı deger gelirse otomatik olarak distinct keyword'ü uygulanır.Bunun için Union All kullanılır.

 

 

 

 

--Subquery (Alt Sorgu) : Sorgu içerisinde sorgu çagırmak.

 

Select ProductName From Products

Where CategoryId =  --Beverages ' ın Id 'si

 

Select ProductName,CategoryId From Products

Where CategoryId = (Select CategoryId From                            Categories Where                                  CategoryName = 'Beverages')

 

--Nancy'nin yaptıgı satıŞlar

 

Select * From Orders

Where EmployeeId = --Nancy'nin Id'si

 

Select * From Orders

Where EmployeeId = (Select EmployeeID From                            Employees Where                                   FirstName = 'Nancy')

 

 

--Kategorisi 'Seafood' olmayan ve tedarikçisi 'Karkki Oy' olan ürünlerin listelenmesi

 

Select * From  Products

Where CategoryId != (Select CategoryId From Categories Where CategoryName = 'Seafood')

And

SupplierId = (Select SupplierId From Suppliers Where CompanyName = 'Karkki Oy')

 

--Inner join vs Subquery : Arasındaki farkı performans açısından ögrenebilmek için iki sorgumuzda seçilir ve 'Display Estimated Exucution Plan' seçilir yukarıdan veya sag klik ile de seçilebilir.Cost degeri yüksek olan daha az performanslıdır.

 

Select ProductName,CategoryName

From Categories Inner Join Products

ON Products.CategoryId = Categories.CategoryId

 

Select ProductName,(Select CategoryName From Categories Where CategoryId = P.CategoryId) as CategoryName

From Products As P

 

-------------------------------

 

 

 

 

 

 

 

 

 

 

 

 

 

 

--Normalization :

 

--Insert :

 

Insert into Products

(

ProductName,

SupplierId,

CategoryId,

QuantityPerUnit,

UnitPrice,

UnitsInStock,

UnitsOnOrder,

ReorderLevel,

Discontinued

)

Values

(

'Hamsi',

1,

1,

'Kutu',

12,

1,

5,

1,

1

)

 

--Senaryo 1 : Hata : ProductId kolonu Auto - Increment özelligine sahip oldugu için Sql Server bu alanı otoatik olarak girecek.

 

Insert into Products

(

ProductId,

ProductName,

SupplierId,

CategoryId,

QuantityPerUnit,

UnitPrice,

UnitsInStock,

UnitsOnOrder,

ReorderLevel,

Discontinued

)

Values

(

344,

'Hamsi',

1,

1,

'Kutu',

12,

1,

5,

1,

1)

-- Senaryo 2 : Hata : ProductName kolonu Not Null bir kolondur.Yani bu alan boŞ geçilemez.

 

Insert into Products

(

SupplierId,

CategoryId,

QuantityPerUnit,

UnitPrice,

UnitsInStock,

UnitsOnOrder,

ReorderLevel,

Discontinued

)

Values

(

1,

1,

'Kutu',

12,

1,

5,

1,

1

)

 

--Senaryo 3 : Discontinued kolonunu yazmama ragmen ve not null olmasına karŞın herhangi bir hata ile karŞılaŞmadım.Sebebi Discontinued kolonunun Default bir degere sahip olması.

 

Insert into Products

(

ProductName,

SupplierId,

CategoryId,

QuantityPerUnit,

UnitPrice,

UnitsInStock,

UnitsOnOrder,

ReorderLevel

)

Values

(

'Levrek',

(Select SupplierId From Suppliers

Where CompanyName = 'Karkki Oy'),

(Select CategoryId From Categories

Where CategoryName = 'Beverages'),

'Naber',

12,

23,

45,

3

)

 

 

-- Senaryo 4 : Hata : Sebebi eklemek istedigin 6 kolon var ama sen 5 kolonluk veri eklemeye çalıŞıyorsun.

 

Insert into Products

(

ProductName,

SupplierId,

CategoryId,

UnitsOnOrder,

ReorderLevel,

Discontinued

)

Values

(

'Hamsi',

1,

1,

1,

1

)

 

--------------

 

Insert into Products

(

ProductName,

SupplierId,

CategoryId,

UnitsOnOrder,

ReorderLevel,

Discontinued

)

Values

(

'Hamsi',

1,

1,

1,

1,

1

)

 

-----------------

 

--Senaryo 5 : Hata : Sebebi Products tablosuna 23 numaralı bir CategoryId girmeye çalıŞtım.Fakat  Products Tablosundaki CategoryId ile Categories tablosundaki CategoryId iliŞkili oldukları için Categories tablosunda olmayan bir CategoryId Products tablosuna girilemez.

 

Insert into Products

(

ProductName,

SupplierId,

CategoryId

)

Values

(

'Çipura',

1,

23

)

 

-------

 

--Senaryo 6 :Tablodaki tüm alanlara ekleme yapacak iseniz kolon adlarını yazmaya gerek yok.ProductId için veri giriŞi yapmaya gerek yok.Çünkü otomatik artıŞa sahip bir kolon.

 

Insert into Products

Values

(

'Alabalık',

(Select SupplierId From Suppliers

Where CompanyName = 'Karkki Oy'),

(Select CategoryId From Categories

Where CategoryName = 'Seafood'),

'Kasa',

12,

12,

12,

12,

1

)

 

----------------------

 

--Senaryo 7 : CustomerId not null olmasına ragmen veriyi sizin girmeniz lazım.

 

Insert into Customers

Values

(

'Hede Höde',

'123',

'Naber',

'Adana',

'Istanbul',

'ass',

'2323',

'sdf',

'2345',

'2345'

)

 

----

Insert into Customers

(

CustomerId,

CompanyName

)

Values

(

'Hede',

'Höde'

)

 

------

--Hata : Girilmek istenen veri gereginden fazla büyük.CustomerId 5 karakterlik bir veri ister.

 

Insert into Customers

(

CustomerId,

CompanyName

)

Values

(

'Hedeeeee',

'Höde'

)

 

-------------------------------------

 

--Orders Tablosuna SatıŞ Ekleme Personel Adı 'Nancy' olacak Kargo Şirketi 'Speedy Express' olacak. MüŞteri 'Alfreds Futterkiste' olacak.

 

Insert into Orders

Values

(

(Select CustomerId From Customers

Where CompanyName='Alfreds Futterkiste'),

(Select EmployeeId From Employees

Where FirstName='Nancy'),

'12.12.2000',

'12.12.2000',

'12.12.2000',

(Select ShipperId From Shippers

Where CompanyName = 'Speedy Express'),

12,

'Hede',

'Adana',

'Adana',

'Adana',

'1212',

'TUR'

)

 

Select * from Orders

Where ShipName='Hede'

 

--------------

 

--Bulk Insert : Bir tablodan baŞka bir tabloya yıgın halinde veri eklemek.

 

--1.Var Olan bir tabloya bulk Insert:

 

Select * From Contacts

 

Insert into Contacts

Select ContactName,Phone From Customers

 

 

--(92 row(s) affected)

 

select * From Contacts

 

--2.Var Olmayan Bir Tabloya Bulk Insert

 

Select ContactName,Phone

Into Contacts2 From Customers

 

Select * From Contacts2

 

-----------------------

 

--Update : Mevcut verileri güncellemek için kullanılan bir DML keyword'üdüdür.

 

Update Employees

Set HomePhone = '111111'

 

Select * From

Employees

 

--(9 row(s) affected)

 

--Eger bu Şekilde bir Update sorgusu yaparsanız,tüm tablodaki HomePhone alanlarını güncellemiŞ olursunuz.

 

--Dogrusu

 

Update Employees

Set HomePhone = '22222'

Where EmployeeId = 1

 

Select * From

Employees

 

--Tüm Ürünler %5 Zam

 

Select UnitPrice

From Products

 

Update Products

Set UnitPrice = (UnitPrice * 5)/100 + UnitPrice

 

--Tüm Ürünlerde %5 Indirim

 

Update Products

Set UnitPrice = UnitPrice / 1.05

 

Insert into Shippers

Values

(

'Aras',

'12345'

)

 

 

 

--Aras Kargonun Telefon Numarası Yok Şeklinde DegiŞtirilsin

 

Update Shippers

Set Phone = 'Yok'

Where CompanyName = 'Aras'

 

Select * From

Shippers

 

Select * From

Categories

 

-- 1. Çikolata adında bir kategori ekleyin.

-- 2. Çikolata kategorisinin adını 'Şeker' ve description'ınını 'Çok Şeker'

 

Insert into Categories

(

CategoryName,

Description

)

Values

(

'Çikolata',

'Çok Tatlı'

)

 

Update Categories

Set CategoryName = 'Şeker',

Description = 'Çok Şeker'

Where CategoryName = 'Çikolata'

 

Select * From Categories

 

------------

 

--Delete : Veri silmek için kullanılan bir DML komutudur.

 

Select * From

Contacts

 

Delete From Contacts

 

--Bu Şekilde yaptıgınız takdirde tablodaki tüm veriler silinir.

 

--Dogrusu:

 

Delete From Categories

Where CategoryName = 'Şeker'

 

--ShipperId 3'den büyük olanlar silinsin

 

Delete From Shippers

Where ShipperId > 3

 

--------------------------

 

 

--Truncate :

 

Truncate Table Contacts2

 

--Delete vs Truncate : Delete ile tablodaki tüm verileri sildiginiz vakit index'ler silinmez.Ama Truncate ile sildiginiz vakit indexlerde silinir,ve siz yeni bir veri girdiginiz vakit id kolonu 1'den baŞlar.

 

-----------------------------------------

 

-- 1. Categories Tablosuna 'Balık' adında bir Category Ekle.

 

-- 2. Products Tablosuna 'Somon' adında ve Category'si 'Balık' olan bir Ürün ekle.Stok degeri 10 olsun.

 

-- 3. 'Somon' ürünün stok degerini güncelle degeri 1 olsun.

 

-- 4. 'Somon' ürününü sil.

 

Insert into Categories

(

CategoryName

)

Values

(

'Balık'

)

 

Select *

From Categories

 

Insert into Products

(

ProductName,

CategoryId,

UnitsInStock

)

Values

(

'Somon',

(Select CategoryId from Categories

Where CategoryName = 'Balık'),

10

)

 

Select * From Products

 

Update Products Set UnitsInStock = 1

Where ProductName = 'Somon'

 

Delete From Products

Where ProductName = 'Somon'

 

---------------------------------  DML Sonu.....

 

 

 

--DDL : Data Definition Language

 

-- Create : Yeni bir nesne oluşturmak , tanımlamak için kullanılır.

-- Alter : Düzenleme yapmak için kullanılır.

-- Drop : Silmek için kullanılır.

 

--Yeni Bir Database Oluşturmak

 

Create Database BilgeAdam

On Primary

(

Name = 'BilgeAdam_mdf',

FileName = 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BilgeAdam.mdf',

Size = 10Mb,

MaxSize = Unlimited,

FileGrowth = 5Mb

)

Log On

(

Name = 'BilgeAdam_log',

FileName = 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BilgeAdam.ldf',

Size = 5Mb,

MaxSize = Unlimited,

FileGrowth = 25%

)

 

Alter Database BilgeAdam

Modify File

(

Name = 'BilgeAdam_mdf',

Size = 20Mb

)

 

Drop Database BilgeAdam

 

--Constraints (Kısıtlayıcılar) :

 

-- 1. Primary Key : Uygulandıgı kolona benzersizlik katan bir kısıtlayıcıdır.Girilen verilerin benzersiz olmasını saglar.Tabloda aynı anda 2 farklı PK bulunmaz.Ancak iki kolonu birlikte PK yapabilirsiniz.

 

-- 2. Foreign Key :  Uygulandıgı kolonun referans aldıgı tablodaki kolonda bulunmayan verinin girilmesini engeller.Böylelikle daha dogru veri yapısı elde etmiş oluruz.

 

-- 3. Not Null : Uygulandıgı kolonun boş geçilmesini engeller.Sizi veri girişine zorlar.

 

-- 4. Default : Eger bir veri girişi yapmazsanız, kolon için bir default belirlenmişse Sql Server otomatik olarak default degeri girer.

 

-- 5. Check : Uygulandıgı kolonda belirlenen şarta göre veri girilemesini zorunlu kılar.

 

-- 6. Unique : Uygulandıgı kolonun PK gibi benzersiz olmasını saglar.Bir tabloda birden çok Unique bulunabilir.

 

-- 7. Identity : Uygulandıgı sayısal kolonun otomatik artışını saglar.

 

 

Create Table Departman

(

DepartmanId int Primary Key Identity(1,1),

DepartmanAdi nvarchar(50) Not Null

)

 

Create Table Ogrenciler

(

OgrenciId int Identity(1,1),

Adi nvarchar(20) Not Null,

Soyadi nvarchar(20) Not Null,

KayitTarihi Date Default (GetDate()),

Numara int Check (Numara <= 100),

DepartmanId int,

Constraint PK_OgrId Primary Key Clustered (OgrenciId),

Constraint UQ_Numara Unique (Numara),

Constraint FK_DepartmanId Foreign Key (DepartmanId)References Departman (DepartmanId)

)

 

Insert into Departman

Values

(

'Yazılım'

)

 

Select * From Departman

 

Insert into Ogrenciler

(

Adi,

KayitTarihi,

Numara,

DepartmanId

)

Values

(

'Ali',

'12.12.2000',

12,

1

)

 

 

 

 

 

 

 

 

 

--Hata : Soyadi kolonu Not Null.Veri girişi yapmak zorundasın.

 

Insert into Ogrenciler

(

Adi,

Soyadi,

Numara,

DepartmanId

)

Values

(

'Ali',

'Ak',

1,

1

)

 

Select * From Ogrenciler

 

--KayitTarihi kolonuna herhangi bir veri girişi yapmamamıza ragmen Default bir degere sahip oldugu için Sql Server bu degeri girdi.

 

Insert into Ogrenciler

(

Adi,

Soyadi,

Numara,

DepartmanId

)

Values

(

'Veli',

'Pak',

1,

1

)

 

--Hata : Sebebi Numara kolonu Unique Key oldugu için ve eklemek istedigim 1 degeri tabloda oldugu için hata alıyoruz.

 

Insert into Ogrenciler

Values

(

'Azra',

'Hede',

'12.12.2000',

122,

1

)

 

 

 

 

 

 

 

 

-- Hata : Sebebi Numara kolonu Check Constraint'e sahip.Girilen deger 100'den küçük eşit olmalıdır.

 

Insert into Ogrenciler

Values

(

'Sezin',

'Gel',

'12.12.2000',

15,

2

)

 

-- Hata : Sebebi DepartmanId Foreign Key bir kısıtlamaya sahip bir kolon.Siz Departman tablosunda olmayan bir veriyi girmek isterseniz size Foreign Key hatası verecektir Sql Server.

 

Select * from Departman

 

--------------------

 

--CategoryID'si 1 olan category'i SIl

 

-- Foreign Key Delete/Update olacagı zaman Sql Server ' ın davranacagı durumlar.

 

-- 1. No Action : Bu durumda Sql Server silmek istediginiz veriyi silmez size hata verir.Default ayar No Action 'dır.

 

-- 2. Set Default : Eger siz Foreign Key kolonun referans aldıgı bir tablodaki kolonu silerseniz,ilişkilendirildigi tablodaki kolona varsa Default degeri atar.Yoksa Null olarak atama yapar.

 

-- 3. Set Null : Referans alınan kolon silinirse ilişkilendirildigi alana null deger girilir.Fakat kolon eger Not Null ' sa hata verir.

 

-- 4. Cascade : Referans alınan kolon silinirse,ilişkili tablodaki degerlerde silinir.

 

 

-------------

 

--Migros adında bir DB .

 

--Kategoriler-Ürünler-Satışlar Tablosu Olsun

 

--------------------------------------------------

 

-- Çalısan - Sattıgı Ürün - Toplam Satıs Adedi - Toplam Satıs Geliri

 

 

Select FirstName + ' ' + LastName as Personel,ProductName,

Count(Quantity) as [Toplam Satıs Adedi],

Sum(Quantity * OD.UnitPrice) as [Toplam Satıs Geliri] From

Employees as E Inner Join Orders as O

On E.EmployeeId = O.EmployeeId

Inner Join [Order Details] as OD

On O.OrderId = OD.OrderId

Inner Join Products as P

On OD.ProductId = P.ProductId

Group By FirstName,LastName,ProductName

 

--View : Sanal tablo yapısı diyebilecegimiz View nesneleri içinde olusturmus oldugunuz sorgular daha hızlı ve daha kolay bir sekilde çalıstırılır.Çalıstıracagınız sorgular belli baslı islemlerden (Compile,Parse) geçer.Eger View kullanırsanız bu islemler View nesnesinin ilk olusma anında gerçeklesir,View 'i çagırcagınız vakit artık bu islemlerden geçmez ve daha performanslı bir yagı elde edersiniz.View'lerde güvenlik politikaları da uygulanabilir.

 

-------

Create View vSatisRaporu

as

Select FirstName + ' ' + LastName as Personel,ProductName,

Count(Quantity) as [Toplam Satıs Adedi],

Sum(Quantity * OD.UnitPrice) as [Toplam Satıs Geliri] From

Employees as E Inner Join Orders as O

On E.EmployeeId = O.EmployeeId

Inner Join [Order Details] as OD

On O.OrderId = OD.OrderId

Inner Join Products as P

On OD.ProductId = P.ProductId

Group By FirstName,LastName,ProductName

-------------------

 

Select * From vSatisRaporu

 

----Güncelleme

Alter View vSatisRaporu

as

Select FirstName + ' ' + LastName as [Personel Adı],ProductName,

Count(Quantity) as [Toplam Satıs Adedi],

Sum(Quantity * OD.UnitPrice) as [Toplam Satıs Geliri] From

Employees as E Inner Join Orders as O

On E.EmployeeId = O.EmployeeId

Inner Join [Order Details] as OD

On O.OrderId = OD.OrderId

Inner Join Products as P

On OD.ProductId = P.ProductId

Group By FirstName,LastName,ProductName

-------

 

Select * From vSatisRaporu

 

--------silmek

 

Drop View vSatisRaporu

-------

 

------

Create View vProCat

as

Select ProductName,CategoryName

From Products as P

Inner Join Categories as C

ON P.CategoryId = C.CategoryId

-------

 

Select * From vProCat

 

Insert into vProCat

Values

(

'Metro',

'Çikolata'

)

 

--Senaryo 1 : View 'de iki farklı tablodan alan varsa Insert islemini gerçeklestiremezsiniz.

 

--------

 

Create View vSiparislereGoreStokDurumu

as

Select ProductName,(UnitsInStock - UnitsOnOrder) as [Stok Durumu] From Products

----------

 

Select * From vSiparislereGoreStokDurumu

 

Insert into vSiparislereGoreStokDurumu

Values

(

'Metro',

12

)

 

Go

 

--Senaryo 2 : View içerisinde eger türetilmis bir alan varsa (Birden çok alanın kullanılması) Insert islemi gerçeklesmez.

 

Insert into vSiparislereGoreStokDurumu

(

ProductName

)

Values

(

'Metro'

)

 

--Basarılı

 

-----------

Create View vCalisan

as

Select FirstName,HomePhone

From Employees

-----------

 

Select * From vCalisan

 

Insert into vCalisan

Values

(

'Ali',

'12345'

)

 

-- Senaryo 3 : LastName alanı View için geçerli olan base (Temel) Tablo da  Not Null.

 

--Güvenlik Islemleri :

 

--1. With Encryption : View içeriginin görüntülenmesi engellenir.View'e sag klik yaptıgınızda Design ' ı açamazsınız.

----------

Create View vProStok

With Encryption

as

Select ProductName,UnitsInStock

From Products

-----------

 

--Güvenligi kaldırmak için

Alter View vProStok

as

Select ProductName,UnitsInStock

From Products

----------------------

 

-- 2. With SchemaBinding : Uygulandıgı View içerisinde base tablo içerisindeki alanların degistirilmesini engeller.Yani View içerisinde olusturdugunuz alanları koruma altına alır.Çok Agır bir baskı oldugu için uyulması gereken kurallar vardır.

 

Create View vShippers

With SchemaBinding

as

Select * From

Shippers

 

--Hata:

-- Uyulması Gereken Kural - 1 : Kolon adlarını tek tek yazmalısınız.Tüm alanları alsanız dahi.

 

Create View vShippers

With SchemaBinding

as

Select CompanyName,Phone From

Shippers

 

--Hata :

--Uyulması Gereken Kural - 2 : Tablo belirtilirken aitlik ile belirtilmesi gerekir.Yani tablo önüne dbo.(Database Owner) eklenmelidir.

 

Create View vShippers

With SchemaBinding

as

Select CompanyName,Phone From

dbo.Shippers

 

------------------------

 

-- 3. WithCheckOption

 

Create View vKritikStok

as

Select ProductName,UnitsInStock

From Products

Where UnitsInStock < 15

 

Select * From vKritikStok

 

 

Update vKritikStok set UnitsInStock = 20

Where ProductName = 'Alice Mutton'

 

Select * From Products

 

---

 

Alter View vKritikStok

as

Select ProductName,UnitsInStock

From Products

Where UnitsInStock < 15

With Check Option

 

Select * From vKritikStok

 

Update vKritikStok Set UnitsInStock = 20

Where ProductName = 'Aniseed Syrup'

 

--With Check Option kısıtlaması oldugu için belirtilen kosul saglanmadıgı takdirde Update islemine izin vermeyecek.

 

Update vKritikStok Set UnitsInStock = 1

Where ProductName = 'Aniseed Syrup'

 

--Eger base tabloda Update yapmaya çalısırsanız ve kosul saglanmasa dahi Update islemini gerçeklestirir.

Update Products Set UnitsInStock = 18

Where ProductName = 'Aniseed Syrup'

 

-------------------------

 

 

 

 

 

 

 

 

 

--Degiskenler :

 

--Degiskenlere Deger Atama Yolları

 

--1.Set

 

declare @sayi int  --Degisken Tanımladık

Set @sayi = 5    -- Set ile deger atadık

Print @sayi     --Degiskenin üzerinde tuttugu degeri görüntüledik.

 

Declare @isim nvarchar(40)

Set @isim = 'Hede'

Print @isim

 

--2. Select

 

Declare @stok int

Select @stok = UnitsInStock From Products

Where ProductId = 1

Print @stok

 

--Set VS Select

 

Declare @stok int

Set @stok = UnitsInStock From Products

Where ProductId = 1

Print @stok

 

--Hata Fark - 1 : Set ile Tablodan çektigimiz verileri degiskene atayamayız.

 

--Fark 2 : Set ile sadece bir degiskene veri atabilirsiniz.Select ile istediginiz kadar atabilirsiniz.

 

Declare @adi nvarchar(40)

Declare @soyadi nvarchar(40)

Select @adi = FirstName , @soyadi = LastName

From Employees

Where EmployeeId = 1

Print @adi + ' ' + @soyadi

 

--- 3 sayı olusturun . 3 sayının toplamını baska bir degiskene atayıp print yapın.

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

--If Kullanimi

 

If(5>3)

      Begin

            Print 'Büyük'

      End

Else

      Begin

            Print 'Degil'

      End

 

If(5<1)

      Print 'Degil'

Else

      Print 'Küçük'    

     

 

--Ürünlerin Fİyat ortalamasi 50 'nin altinda ise   %10 zam yap degilse %10 indirim yap

     

Declare @ortalama money

Select @ortalama = AVG(UnitPrice) From Products

If(@ortalama <= 50)

      Begin

            Update Products Set

            UnitPrice = UnitPrice * 1.1

      End

Else

      Begin

            Update Products Set

            UnitPrice = UnitPrice * 0.9

      End  

     

Select * From Products 

 

--If Exists : if exists komutu ile belirledigimiz tabloda kontrol edilmesini istedigimiz verinin olup olmadigini kontrol eden bir yapidir.Eger kontrol ettiginiz veri varsa size True bir deger döndürür.Yoksa false deger döndürür.

 

--Personel Tablosunda Ali isminde bir çalişanim var mi ?

 

IF(Exists(Select FirstName From Employees Where              FirstName = 'Ali'))

      Begin

            Print 'Burada'

      End

Else

      Begin

            Print 'Yok'

      End

 

 

 

     

     

--Personel Tablosunda Ali Ak isminde bir Çalişan yoksa Personel tablosuna ekleyelim.Varsa görüntüleyelim.

 

IF(Exists(Select * From Employees Where FirstName =          'Ali' And LastName = 'Ak'))

      Begin

            Select * From Employees Where FirstName =          'Ali' And LastName = 'Ak'      

      End  

Else

      Begin

            Insert into Employees

            (

            FirstName,

            LastName

            )

            Values

            (

            'Ali',

            'Ak'

            )

      End  

     

--While :

 

Declare @sayi int

Set @sayi = 5

While(@sayi < 10)

      Begin

            Set @sayi = @sayi + 1

            Print @sayi

      End  

 

--Case When :

 

Select FirstName,Case TitleOfCourtesy When 'Dr.' Then 'Doctor' End

From Employees

     

--------------------------------------------

 

--Store Procedure (Sakli Yordamlar) -- Çok Önemli : SP 'ler üzerlerine yükümlü olan sorgulari çaliştarirlar bir bütün gibi.Bir sorgu çaliştirildigi anda belli başli işlemlerden geçer(Compile,Parse). SP bu işlemler SP 'ün ilk oluşma aninda gerçekleşir ve ardindan bu SP çagiracagimiz vakit bu işlemler atlanir ve size ciddi bir performans artişi saglar.SP 'ler ilk oluşturulduklari anda Ram ' de tampon hafiza denen yerde tutulur.Yani siz SP'leri Ram'den hazir şekilde çagirirsiniz.SP'ler geriye deger döndürebilirler.İç içe SP'leri çagirabilirsiniz.Max 32 seviyede SP'leri çagirirsiniz.VS'dan da SP'leri kullanabilme imkaniniz var.Güvenlik politikasi uygulayabilirsiniz.Tavsiye Sadece Select sorgunuz varsa SP yapmayin..

 

Create Procedure spKategoriler

as

Select * From Categories

 

 

 

--Çaliştirilmasi

 

Exec spKategoriler

 

--Yeni Bir Kargo Firmasi Ekleme

 

Create Procedure spKargoEkle

@name nvarchar(40),

@phone nvarchar(40)

as

Insert into Shippers

Values

(

@name,

@phone

)

----------------------------

 

--Parametre adlarini belirtmeden yazarsak eger parametre sirasina uygun bir şekilde DB'ye eklenecek verileri yazmam lazim.

spKargoEkle 'MNG','12345'

 

Select * From Shippers

 

--Parametre adlarini yazarak sira gözetmeden verilerimi yazabilirim.  

spKargoEkle @phone = '1234567',@name='Sürat'  

     

--SP'lerin alabilecekleri parametre sayisi 2100 'dür Maximum.   

     

--MSSQL'deki maksimum limitlerin listesi için :

--http://msdn.microsoft.com/en-us/library/ms143432.aspx

 

--Customers Tablosuna Veri Ekleyen SP

 

Create Proc spInsertCustomers

@CustomerId nchar(5),

@CompanyName nvarchar(40)

as

Insert into Customers

(

CustomerId,

CompanyName

)

Values

(

@CustomerId,

@CompanyName

)

----------------------------------

Exec spInsertCustomers 'Hede','Deneme'

 

Select * From Customers Where CustomerId='Hede'

-----------------------------------------

 

 

 

 

Create Proc spKategoriEkle

@id int Output,

@name nvarchar(40)

as

Insert into Categories

(

CategoryName

)

Values

(

@name

)

Set @id = Scope_Identity()

--------------------------------

 

Declare @sonEklenenId int

Exec spKategoriEkle @name = 'Tablet',@id = @sonEklenenId Out

Print @sonEklenenId

 

Select * From Categories

 

-----------------------------

 

Create Proc spKategoriEkleReturn

@name nvarchar(40)

as

Insert into Categories

(

CategoryName

)

Values

(

@name

)

Declare @id int

Set @id = Scope_Identity()

Return @id

----------------------------------

 

Declare @sonEklenenId int

Exec @sonEklenenId = spKategoriEkleReturn 'Notebok'

Print @sonEklenenId

 

Select * From Categories

 

--Return VS Output : Return ile sadece 1 deger döndürülür.Output ile 2100 adet...

 

-------------------------------------------

 

 

 

 

 

 

 

 

Create Proc spKategoriEkleReturnOutput

@cid int Output,

@name nvarchar(40)

as

Insert into Categories

(

CategoryName

)

Values

(

@name

)

Declare @id int

Set @id = Scope_Identity()

Set @cid = Scope_Identity()

Return @id

---------------------------------

Declare @cid int

Declare @id int

Exec @cid = spKategoriEkleReturnOutput @name = 'Telefon',@cid = @id Out

Print @cid

Print @id

--------------------------------------

 

--Kategori ve Ürün Ekleyen SP

Alter Proc spKatUrunEkle

@categoryName nvarchar(40),

@productName nvarchar(40)

as

Insert into Categories

(

CategoryName

)

Values

(

@categoryName

)

 

Declare @cid int

Set @cid = Scope_Identity()

 

Insert into Products

(

ProductName,

CategoryId

)

Values

(

@productName,

@cid

)

-------------------------

 

 

 

 

 

Exec spKatUrunEkle 'Çikolata','Kinder'

 

Select * From Categories

 

Select * From Products

 

-----------------------------------

 

--Kategori Ekleme Eger Varsa Eklemesin ...

--Yoksa Eklesin...

 

Alter Proc spKat2

@categoryName nvarchar(40),

@productName nvarchar(40)

as

Declare @id int

Declare @pid int

If(Exists(Select * From Categories Where CategoryName = @categoryName))

      Begin

            Select @id = CategoryId From Categories

            Where CategoryName = @categoryName

            Insert into Products

            (

            ProductName,

            CategoryId

            )

            Values

            (

            @productName,

            @id

            )

            Set @pid = Scope_Identity()

      End

Else

      Begin

            Insert into Categories

            (

            CategoryName

            )

            Values

            (

            @categoryName

            )

            Set @id = Scope_Identity()

            Insert into Products

            (

            ProductName,

            CategoryId

            )

            Values

            (

            @productName,

            @id

            )

            Set @pid = Scope_Identity()

      End  

Print @pid

--------------------------------------

Exec spKat2 'İçecekler','Muzlu Süt'

 

Select * from Categories

 

Select * From Products

-------------------------------------

--Personel adina göre satişlari getiren SP

 

Create Proc spSatisGetir

@firstName nvarchar(40)

as

IF(Exists(Select * From Employees

              Where FirstName = @firstName))

      Begin

         Select OrderId,FirstName From Employees as E

         Inner Join Orders as O

         On E.EmployeeId = O.EmployeeId

         Where FirstName = @firstName   

      End          

Else

      Begin

            Print 'Böyle Bir Personel Yok.'

      End

------------------------------

Exec spSatisGetir 'Ali'

------------------------------

 

--Sayisal Loto

 

Create Proc spSayisalLoto

as

Declare @tablo Table

(

Sayi int

)

Declare @toplamSayi int

Set @toplamSayi = 0

 

While(@toplamSayi < 6)

      Begin

            Declare @sayi int

            Select @sayi = Floor(Rand() * 49 + 1)

            IF(Not Exists(Select * From @tablo                               Where Sayi = @sayi))

                  Begin

                        Insert Into @tablo

                        Values

                        (

                        @sayi

                        )

                        Select @toplamSayi = Count(*)

                        From @tablo

                  End  

      End

Select * From @tablo

Order By Sayi ASC      

------------------------------------

spSayisalLoto

-------------------------------------

-- Kategori Adina Göre Ürün Getiren SP

 

Create Proc spKatUrunGetir

@categoryName nvarchar(40)

as

Select CategoryName,ProductName

From Categories as C

Inner Join Products as P

On C.CategoryId = P.CategoryId

Where CategoryName = @categoryName

---------------------------

Exec spKatUrunGetir 'Seafood'

----------------------------

 

--Tedarikçi Firma Adina Göre Ürünlerin Getirilmesi

 

Create Proc spTedarikciUrunGetir

@companyName nvarchar(40)

as

Select ProductName,CompanyName

From Suppliers as S

Inner Join Products as P

On S.SupplierId = P.SupplierId

Where CompanyName = @companyName

------------------------------------

 

spTedarikciUrunGetir 'Karkki Oy'

 

------------------------------------

 

--Personel Adina Göre Satiş Ekleme

Create Proc spSatisEkle

@firstName nvarchar(40)

as

If(Exists(Select * From Employees

              Where FirstName = @firstName))

      Begin

            Declare @id int

            Select @id = EmployeeId From Employees

            Where FirstName = @firstName

            Insert into Orders

            (

            EmployeeId

            )

            Values

            (

            @id

            )

      End          

Else

      Begin

            Print 'Böyle Bir Personel Yok.'

      End

 

----------------------------

Exec spSatisEkle 'Nancy'

Select * From Orders Where EmployeeId = 1

-------------------------------------------

----Personel Adina Göre Satiş Ekleme 2

 

Alter Proc spSatisEkle2

@firstName nvarchar(40),

@lastName nvarchar(40)

as

Declare @id int

IF(Exists(Select * From Employees

              Where FirstName = @firstName))

      Begin

            Select @id = EmployeeId From Employees             Where FirstName = @firstName

            Insert into Orders

            (

            EmployeeId

            )    

            Values

            (

            @id

            )

      End

Else

      Begin

            Insert into Employees

            (

            FirstName,

            LastName

            )

            Values

            (

            @firstName,

            @lastName

            )

            --Select  @id = Scope_Identity()

            Insert into Orders

            (

            EmployeeId

            )

            Values

            (

            Scope_Identity()

            )

      End

----------------------------------

Exec spSatisEkle2 'Veli','Ak'

 

Select * From Employees

 

Select * From Orders Where EmployeeID = 11

 

---------------------------------------------

 

 

Create Proc spKatUrunEkle

@categoryName nvarchar(40),

@productName nvarchar(40)

as

Declare @cid int

If(Exists(Select * From Categories

              Where CategoryName = @categoryName))

      Begin

            Select @cid = CategoryId From Categories

            Where CategoryName = @categoryName

            IF(Exists(Select * From Products

               Where ProductName = @productName))

               Begin

                        Print 'Ürün Var.'

               End

            Else

                  Begin

                        Insert into Products

                        (

                        ProductName,

                        CategoryId 

                        )

                        Values

                        (

                        @productName,

                        @cid

                        )

                  End  

      End          

Else

      Begin

            Insert into Categories

            (

            CategoryName

            )

            Values

            (

            @categoryName

            )

            Select @cid = Scope_Identity()

            If(Exists(Select * From Products

               Where ProductName = @productName))

               Begin

                        Print 'Ürün Var.'

               End

            Else

                  Begin

                        Insert into Products

                        (

                        ProductName,

                        CategoryId

                        )

                        Values

                        (

                        @productName,

                        @cid

                        )

                  End  

      End

---------------------

spKatUrunEkle 'Çikolataa','Metro'

Select * From Categories

Select * From Products

 

 

--------------------------------------

 

--User Defined Functions (Kullanıcı Tanımlı Fonksiyonlar) : C# daki metodların karşılığıdır.Dışarıdan parametre alabilirler.Güvenlik politikası uygulanabilir.Function'larda SP ve View ler gibi ilk oluşturulma anında belli başlı işlemlerden geçer.Daha sonra bu işlemler atlanır ve siz daha performanslı bir yapı elde etmiş olursunuz.

 

--Kullanımlarına Göre Ikiye Ayrılırlar

 

-- 1. Scalar Functions : Geriye tek bir değer(hücre) döndürürler.Kullanırken dikkat etmemiz gereken kurallar vardır.Geriye döndürülecek değerin tipi as keyword'ünden önce Returns keyword'ü ile belirtilir.Sorgu içerisinde ise döndürülecek değer Return ile bildirilir.Begin End komutlarını kullanmalıyız.Fonksiyonu çağırırken aitlik bildirmeliyiz(dbo).

 

Create Function fnToplam

(

@sayi1 int,

@sayi2 int

)

Returns Int

as

Begin

      Return @sayi1 + @sayi2

End

--------------------------

 

Select dbo.fnToplam(12,12)

 

--------------

 

--Kdv Hesaplayan Function

 

Create Function fnKdvHesapla

(

@id int

)

Returns Money

as

Begin

      Return (Select UnitPrice * 1.18 From Products

      Where ProductId = @id)

End

--------------------

 

Select dbo.fnKdvHesapla(17)

 

Select UnitPrice From Products

 

Select ProductName,dbo.fnKdvHesapla(ProductId) as [Kdv'li Fiyatı]

From Products

 

------------------------------

 

-- Siparişlere Göre Stok Durumu

 

Create Function fnStokDurumu

(

@id int

)

Returns Int

as

Begin

      Return (Select (UnitsInStock - UnitsOnOrder) as            [Stok Durumu] From Products

                  Where ProductId = @id)

End

----------------------

 

Select dbo.fnStokDurumu(1) as [Stok Durumu]

 

-----------------------

 

-- 2. Table Valued Function : Geriye tablo yapısı döndüren fonksiyonlardır.Parametre alabilirler.Fonksiyonu çağırırken aitlik(dbo) belirtmeye gerek yok.Begin End yapısına gerek yok.Returns Table diyerek bu fonksiyonun geriye table döndüreceğini belirtmemiz lazım.

 

Alter Function fnKategoriyeGoreUrun

(

@cid int

)

Returns Table

as

Return (Select * From Products

          Where CategoryId = @cid)

-----------------------------------

 

Select * From fnKategoriyeGoreUrun(1)

 

Select ProductName,CategoryId,dbo.fnKdvHesapla(ProductId) From

fnKategoriyeGoreUrun(1)

 

------------------------------------

 

Create Function fnDeneme

(

@id int

)

Returns Int

as

Begin

Declare @sonuc int

      If(Exists(Select * From Products

                    Where ProductId = @id))

         Begin

                  Select @sonuc = dbo.fnKdvHesapla(@id)

         End           

      Else

            Begin

                  Set @sonuc = 0

            End 

Return @sonuc             

End

---------------------------------------

 

Select dbo.fnDeneme(11111)

 

---------------------------------------

 

--Personele Göre Satış Getirme

Create Function fnPersonelSatis

(

@employeeId int

)

Returns Table

as

Return (Select * From Orders

            Where EmployeeId = @employeeId)

           

------------------------------------------          

 

Select * From fnPersonelSatis(1)

 

Select OrderId,EmployeeId From

fnPersonelSatis(1)

 

---------------------------------

 

Drop Function fnPersonelSatis

 

---------------------------------

 

-- Belirlediğimiz Ürünün Kaç Adet sattığının Bildiren Fonksiyon

 

Alter Function fnUrunSatisRaporu

(

@pid int

)

Returns Int

as

Begin

      Return (Select Sum(Quantity) From

                [Order Details]

                  Where ProductId = @pid)

End

------------------------

 

Select dbo.fnUrunSatisRaporu(1)

 

--Belirlediğimiz Müşterinin Satışlarını gösteren Fonksiyon

 

Create Function fnMusteriSatisRaporu

(

@cid nchar(5)

)

Returns Table

as

Return (Select * From Orders

            Where CustomerId = @cid)

--------------------------------------

 

Select * From fnMusteriSatisRaporu('TOMSP')

 

--------------------------------------

 

--Trigger (Tetikleyici) : C# 'da Eventlerin karşılığıdır.Belirlenen bir işlem gerçekleştikten sonra tetiklenen sorgulardır.

--2 çeşit Trigger vardır.

--1.DML Trigger -- Tablo veya View seviyesinde

--2.DDL Trigger -- Database veya Server seviyesinde

 

--Trigger'lar 2 sanal tablo ile çalışır.Inserted sanal tablosu bir veri ekleme veya güncelleme işleminde kullanılır.Insert ile eklenen veri Inserted sanl tablosunda tutulur.Güncelleme yapıldığı zaman da yeni veri yine Inserted sanal tablosunda tutulur.Deleted sanal tablosunda ise silinen veri tutulur.Güncelleme işleminde ise eski veri tutulur.

 

--Trigger'lar ile amaçladığımız işlemler Insert,Update,Delete sonrası gerçekleşir.Yada bu işlemlerin yerine gerçekleşir.

 

Create Trigger trUrunEkleme

On Products

After Insert

as

Print 'Çok Güzel Ürün Ekliyorsun.'

-----------------------

 

Insert Into Products

(

ProductName

)

Values

(

'Metro'

)

-----------------------------

 

Create Trigger trKategoriEkleme

On Categories

After Insert

As

Declare @categoryName nvarchar(40)

Select @categoryName = CategoryName

From Inserted

Print @categoryName

------------------------------

 

Insert into Categories

(

CategoryName

)

Values

(

'Tablet'

)

 

Select * From Categories

------------------------------------

 

--Yeni Bir Ürün Eklendiğinde Seafood Kategorisine ait ürünlere %5 zam yapan bir trigger.

 

Create Trigger trUrunZam

On Products

After Insert

as

Update Products Set UnitPrice = UnitPrice * 1.05

Where CategoryId = (Select CategoryId From                             Categories

                              Where CategoryName = 'Seafood')

                             

-----------------------------------

 

Select * From Products

Where CategoryId = (Select CategoryId From                             Categories

                              Where CategoryName = 'Seafood')

                             

Insert Into Products

(

ProductName

)

Values

(

'Kinder'

)

------------------------------------

 

--Silme , Ekleme ,Güncelleme

 

Create Trigger trDurum

On Shippers

After Insert,Delete,Update

as

Print 'Çok Güzel Manipulasyon Yapıyorsun.'

 

-----------------------------------------

 

Create Trigger trUrunSilme

On Products

After Delete

as

Declare @adi nvarchar(40)

Select @adi = ProductName From Deleted

Print @adi

-----------------------------------------

 

Select * From Categories

 

--------------------------------------

 

Create Table SilinenCat

(

CategoyName nvarchar(40)

)

 

--Kategori Silindiği Zaman Başka Bir Tabloya Ekleyen Bir Trigger

 

Create Trigger trCatSilinenler

On Categories

After Delete

as

Insert into SilinenCat

Values

(

(Select CategoryName From Deleted)

)

--------------------------------------

Delete From Categories

Where CategoryName = 'Tablet'

--------------------------------------

Select * From SilinenCat

--------------------------------------

 

--Products Güncelleme,Ekleme,Silme

 

Create Trigger trProductsDurum

On Products

After Insert,Update,Delete

as

Declare @sonuc nvarchar(40)

If(Exists(Select * From Inserted) And Exists(Select * From Deleted))

      Set @sonuc = 'Ürün Başarıyla Güncellendi.'

Else If (Exists(Select * From Inserted))

      Set @sonuc = 'Ürün Başarıyla Eklendi.'

Else

      Set @sonuc = 'Ürün Başarıyla Silindi.'

Print @sonuc                 

----------------------------------

 

Insert Into Products

(

ProductName

)

Values

(

'Lg'

)

 

Update Products Set ProductName = 'HP'

Where ProductName = 'Lg'

 

Delete From Products

Where ProductName = 'HP'

 

-------------------------------------

 

--Instead Of yapılması istenen işlemi engeller ve o işlemin yerine Trigger içerisinde yazdığımız sorgular gerçekleşir.

 

Create Trigger trKategoriSilme

On Categories

Instead Of Delete

As

Print 'Kategori Silemezsin..'

 

------------------------------------

 

Insert into Categories

(

CategoryName

)

Values

(

'Çikolata'

)

 

Select * From Categories

 

Delete From Categories

Where CategoryName = 'Çikolata'

 

------------------------------------

 

Create Table KategoriTakip

(

ProcessId int Identity(1,1),

CategoryName nvarchar(40),

[User Name] nvarchar(40),

[Server Name] nvarchar(40),

[Date] Date

)

 

------------------------------

 

--Trigger ' ı Disable Etmek Için

 

 

Disable Trigger trKategoriSilme On Categories

 

Create Trigger trKategoriTakip

On Categories

Instead Of Delete

As

Insert Into KategoriTakip

Values

(

(Select CategoryName From Deleted),

(Select Suser_SName()),

(Select Host_Name()),

(Select GetDate())

)

 

---------------------------

 

Delete Categories

Where CategoryName = 'Çikolata'

 

 

Select * From KategoriTakip

 

-------------------------------

 

--Müşteri 'nin Adının güncellenmesini engelle

 

Create Trigger trMusteriSilme

On Customers

Instead Of Update

as

Declare @eski nvarchar(40)

Declare @yeni nvarchar(40)

Select @eski = CompanyName From Deleted

Select @yeni = CompanyName From Inserted

Print 'Müşteri Adı ' + @eski + ' Olan ' + @yeni + ' Olarak Değiştirilemedi.'

 

----------------------------

 

Update Customers Set CompanyName =  'Hede'

Where CompanyName = 'Alfreds Futterkiste'

 

------------------------------------

-- 2.) DDL Triggers : DDL Trigger 'da yine aynı DML trigger'lar gibi çaışır.Fakat DML Trigger'lardan farklı olarak Instead Of Yoktur.Bunun yerine Rollback kullanılır.Database ve Server seviyesinde Trigger'larınızı oluşturabilirsiniz.

 

Create Trigger trTablo

On Database

After Create_Table

As

Print 'Çok Güzel Tablo Oluşturuyorsun.'

----------------------------

 

Create Table Deneme

(

id int

)

-----------------------------

 

Create Trigger trTabloSil

On Database

After Drop_Table

As

Print 'Çok Da Güzel Tablo Siliyorsun.'

-------------------------------------------

 

Drop Table Deneme

 

---------------------------

 

Create Trigger trServer

On All Server

After Create_Database

As

Print 'Ne de Güzel DB Oluşturuyorsun.'

-----------------------

 

Create Database HedeHode

 

----------------------------

 

Create Trigger trServerSil

On All Server

After Drop_Database

As

Print 'Db Sildin'

----------------------------

 

Drop Database HedeHode

 

---------------------------

 

--DDL Trigger 'larda Rollback Kullanımı :

 

Create Trigger trTabloSilmeyiEngelle

On Database

After Drop_Table

As

Print 'Tablo Silemezsin.'

Rollback

------------------

 

Drop Table KategoriTakip

 

-------------------

 

Create Trigger trDatabaseSilmeEngelle

On All Server

After Drop_Database

As

Print 'DB Silme Lütfen.'

Rollback

------------------------

 

Drop Database Deneme

-------------------------

 

--Trigger Disable Yapmak

 

Disable Trigger trTabloSilmeyiEngelle On Database

 

Drop Table KategoriTakip

 

Enable Trigger trTabloSilmeyiEngelle On Database

 

Drop Trigger trTabloSilmeyiEngelle On Database

 

Drop Trigger trTablo On Database

 

Drop Trigger trTabloSil On Database

 

Disable Trigger trKategoriTakip On Categories

 

Enable Trigger trKategoriTakip on Categories

 

Drop Trigger trKategoriTakip

 

Disable Trigger trServer On All Server

 

Enable Trigger trServer On All Server

 

Drop Trigger trServer On All Server

 

--------------------------------------------

 

--Personel Silindiği Zaman Silinen Personelin Adı,Soyadı ve Telefon Bilgilerini Başka Bir Tabloya Insert Edelim.

 

 

Create Table PersonelTakip

(

FirstName nvarchar(40),

LastName nvarchar(40),

Phone nvarchar(40)

)

-------------------------------------

Create Trigger trPersonelTakip

On Employees

After Delete

AS

Insert Into PersonelTakip

Values

(

(Select FirstName From Deleted),

(Select LastName From Deleted),

(Select HomePhone From Deleted)

)

-----------------------------------------

Delete From Employees

Where LastName = 'Hede'

 

Select * From Employees

 

Select * From PersonelTakip

 

---------------------------------------

 

Create Trigger trCustomers

On Customers

After Update

As

If(Update(CompanyName))

      Begin

            Declare @eski nvarchar(40)

            Declare @yeni nvarchar(40)

            Select @eski = CompanyName From Deleted

            Select @yeni = CompanyName From Inserted

            Print 'Adı ' + @eski + ' olan Firma ' + @yeni + ' olarak güncellendi.'

      End

------------------------------

 

Update Customers Set CompanyName = 'Alfreds Futterkisteee'

Where CompanyName = 'Alfreds Futterkiste'

 

 

Update Customers Set ContactName = 'MMaria Anders'

Where ContactName = 'Maria Anders'

---------------------------------------------

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

--------------------------------------------

 

--Transaction : Transaction ile işlemleriniz bir işlemmiş gibi muamale görür.Tran bir nesne değildir.Create ile oluşturulmaz.Tran bir yapıdır,tekniktir.Eğer sisteminiz içerisinde belirlediğiniz işlemler yapılırken bir hata ile karşılaştığınız durumlarda hatadan önceki işlemleriniz db'ye kayıt edilmez.Artık o işlemler geçersiz sayılır.Tran bloklarındaki işlemlerin geçerli olabilmesi için Commit Tran keyword'ü yazılır.Eğer bir hata durumu oluşursa işlemler RollBack Tran ile geri alınır.

 

--Transaction'da ACID kavramı:                                                1. Atomicity : Transaction daha küçük parçalara ayrılamayan bir bütündür.Yani bölünememezlik geçerlidir.                                              

2. Consistency : Işin tamamı bir bütündür.Işlemler ya gerçekleşir,yada gerçekleşmez.Ya hep ya hiç mantığına göre çalışır.                            3. Isolation : Transaction'ların birbirlerine göre durumlarını belirler.Yönetilmesi gerekir ve önemlidir.                                             4. Durability : Tran 'lar hardware hatalarından etkilenmezler. 

 

--sp Transaction 'lı

Alter Proc spHavale

@gonderenNo int,

@alanNo int,

@tutar money

as

 

Begin Transaction

Begin Try

      if(Exists(Select HesapNo from Hesaplar

         Where HesapNo = @gonderenNo) and

         Exists(Select HesapNo from Hesaplar

         Where HesapNo = @alanNo))

         Begin

                  if(@tutar<=(Select Bakiye from Hesaplar

                        Where HesapNo = @gonderenNo))

                        Begin

                              Update Hesaplar Set

                              Bakiye = Bakiye - @tutar

                              Where HesapNo = @gonderenNo

                             

                              RaisError('Sistemimizde Beklenmeyeen Bir Durumdan Ötürü Bir Hata Oluştu.Lütfen Daha Sonra Tekrar Deneyiniz.',16,1)

     

                              Update Hesaplar Set

                              Bakiye = Bakiye + @tutar

                              where HesapNo = @alanNo      

                             

                              Commit Tran

                        End

                  Else

                        Begin

                              Print 'Göndermek Istediğiniz Bakiye                                 Yetersiz.'

                        End  

            End  

      Else

            Begin

               Print 'Lütfen Geçerli Bir Hesap No Giriniz.'

            End

End Try

Begin Catch

      Print 'Sistemimizde Beklenmeyeen Bir Durumdan Ötürü Bir Hata Oluştu.Lütfen Daha Sonra Tekrar Deneyiniz.'

      Rollback Tran    

End Catch

 

 

--sp sonu

 

Exec spHavale 101,102,100

---------------------------------------------

 

-- Orders Tablosuna satış eklenecek

 

-- Son eklenen Order Id alınıp Order Details tablosuna ProductId ile birlikte , bu üründen ne kadar (adet olarak) satıldığı eklenecek.

 

-- Eklenen bu ürünün Stok değeri Products tablosunda güncellenecek.

 

 

Create Proc spStokDusur

@customerId nchar(5),

@productId int,

@quantity int

as

Insert Into Orders

(

CustomerId

)

Values

(

@customerId

)

 

Insert Into [Order Details]

(

OrderId,

ProductId,

Quantity

)

Values

(

(Select Scope_Identity()),

@productId,

@quantity

)

 

Update Products Set UnitsInStock -= @quantity

Where ProductId = @productId

--------------------------------

 

Exec spStokDusur 'ALFKI',1,5

 

 

Select * from Products

 

---------------------------------

Alter Proc spStokDusur

@customerId nchar(5),

@productId int,

@quantity int

as

Begin Tran

Begin Try

Insert Into Orders

(

CustomerId

)

Values

(

@customerId

)

 

Insert Into [Order Details]

(

OrderId,

ProductId,

Quantity

)

Values

(

(Select Scope_Identity()),

@productId,

@quantity

)

 

Update Products Set UnitsInStock -= @quantity

Where ProductId = @productId

 

Commit Tran

 

End Try

Begin Catch

      Print 'Hata oluştu'

      Rollback Tran

End Catch

 

---------------------

 

Exec spStokDusur 'ALFKI',1,5

 

Select * From Products 

 

-------------------------------

 

-- proc ProductId ne kadar satılmış

 

Alter Proc spSatisMiktari

@productId int

as

Declare @sonuc int

Select @sonuc = Sum(Quantity)

From [Order Details]

Where ProductId = @productId

 

Declare @adi nvarchar(40)

Select @adi = ProductName From Products

Where ProductId = @productId

 

Print @adi + ' adlı üründen toplam ' + LTrim(str(@sonuc)) + ' adet satılmıştır.'

--------------------------------

 

Exec spSatisMiktari 1

 

----------------------------

 

Alter Proc spSatisMiktari

@productId int

as

Declare @sonuc int

Select @sonuc = Sum(Quantity)

From [Order Details]

Where ProductId = @productId

 

if(@sonuc < 850)

      Update Products Set UnitPrice = UnitPrice * 0.9

      Where ProductId = @productId

     

Declare @adi nvarchar(40)

Select @adi = ProductName From Products

Where ProductId = @productId

 

Print @adi + ' adlı üründen toplam ' + LTrim(str(@sonuc)) + ' adet satılmıştır.'

------------------------------

 

Select * From Products

 

Exec spSatisMiktari 1

------------------------------------

 

 

-- Index : Sorgularımızda verilerin daha çabuk ve performanslı olarak getirmek kullanılan bir yapıdır.Amaç tamamiyle daha hızlı sonuç elde edebilmek.

 

 

/*

2 çeşit index vardır.

 

1) Clustered Index : Clustered Index ile veriler disc'de fiziksel olarak bir sıralamaya tabi tutulur.Tablonuz içerisinde bir adet clustered index bulundurabilirsiniz.Primary Key olarak atanan kolonlar Sql Server tarafından otomatik olarak Clustered Index olarak atanır.

 

2) NonClustered Index : Bu sıralama sanal bir sıralamadır.Sql Server 2005 içerisinde 249 adet nonlustered index tanımlanır.Sql Server 2008 içerisinde ise 999 adet nonclustered index tanımlanabilir.

 

*/

 

--Olmayan bir tabloya bulk insert

 

Select CustomerId,City

Into Musteriler From Customers

 

--Var olan bir tabloya Bulk Insert

 

Insert into Musteriler

Select CustomerId,City From Customers

 

Select * From Musteriler

 

Set Statistics IO On

Set Statistics Time On

 

Select *

From Musteriler

Where CustomerId = 'ALFKI'

 

/*

Table 'Musteriler'. Scan count 1, logical reads 174, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads

 SQL Server Execution Times:

   CPU time = 0 ms,  elapsed time = 2 ms.

*/

 

Create Clustered Index IX_CustomerId

On Musteriler (CustomerId)

 

 

Select *

From Musteriler

Where CustomerId = 'ALFKI'

 

/*

Table 'Musteriler'. Scan count 1, logical reads 4, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads

 SQL Server Execution Times:

   CPU time = 0 ms,  elapsed time = 0 ms.

*/

 

Select *

From Musteriler

Where City = 'Berlin'

 

/*

Table 'Musteriler'. Scan count 1, logical reads 201, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads

 SQL Server Execution Times:

   CPU time = 16 ms,  elapsed time = 5 ms.

*/

 

Create NonClustered Index NX_City

On Musteriler (City)

 

Select *

From Musteriler

Where City = 'Berlin'

 

 

/*

Table 'Musteriler'. Scan count 1, logical reads 6, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads

 SQL Server Execution Times:

   CPU time = 0 ms,  elapsed time = 0 ms.

*/

 

 

-- Index yapısındaki bozulmaları gözlemlemek için:

 

DBCC ShowContig(Musteriler,IX_CustomerId)

 

- Logical Scan Fragmentation ...........: 0.00%

 

Insert into Musteriler

Select CustomerId,City From Customers

 

Delete Musteriler

Where CustomerId = 'ALFKI'

 

--Insert ve Delete işlemlerinden sonraki durum

 

DBCC ShowContig(Musteriler,IX_CustomerId)

 

- Logical Scan Fragmentation ............: 74.53%

 

--Index yapısını düzenlemek için

 

--1.) Reorganize :

 

--2.) Rebuild :

 

--Farkları : Rebuild ile index yapısı yeniden oluşturulur.

 

Alter Index IX_CustomerId

On Musteriler Rebuild

 

DBCC ShowContig(Musteriler,IX_CustomerId)

 

--Düzenleme yapıldıkdan sonraki hali

- Logical Scan Fragmentation ..........: 0.00%

 

--Burada Insert ve Delete işlemlerini gerçekleştirdik.

 

DBCC ShowContig(Musteriler,IX_CustomerId)

 

- Logical Scan Fragmentation ............: 62.34%

 

Alter Index IX_CustomerId

On Musteriler Reorganize

 

DBCC ShowContig(Musteriler,IX_CustomerId)

 

--Düzenleme yapıldıktan sonraki durum

 

- Logical Scan Fragmentation ............: 2.78%

---------------------------------------------------

 

Select ProductName,UnitsInStock

Into Urunler From Products

 

Insert into Urunler

Select ProductName,UnitsInStock

From Products

 

Select *

From Urunler

 

Set Statistics IO On

Set Statistics Time On

 

Select * From Urunler

Where ProductName = 'Chai'

 

/*

Table 'Urunler'. Scan count 1, logical reads 154, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads

 SQL Server Execution Times:

   CPU time = 0 ms,  elapsed time = 2 ms.

*/

 

Create Clustered Index IX_ProductName

On Urunler (ProductName)

 

Select * From Urunler

Where ProductName = 'Chai'

 

/*

Table 'Urunler'. Scan count 1, logical reads 5, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads

 SQL Server Execution Times:

   CPU time = 0 ms,  elapsed time = 0 ms.

*/

 

DBCC ShowContig(Urunler,IX_ProductName)

 

- Logical Scan Fragmentation ............: 0.00%

 

Insert Into Urunler

Select ProductName,UnitsInStock

From Products

 

Delete From Urunler

Where ProductName = 'Chai'

 

DBCC ShowContig(Urunler,IX_ProductName)

 

- Logical Scan Fragmentation ............: 63.67%

 

Alter Index IX_ProductName

On Urunler Reorganize

 

DBCC ShowContig(Urunler,IX_ProductName)

 

- Logical Scan Fragmentation .............: 3.43%

--------------------------------------------------

 

 

-- 1) 'Bilge Adam' kelimesinde sadece 'Adam' kelimesini veren sorgu

--------------------------------------------------

-- 2) Ürünlerde Max Stok değerini veren sorgu

------------------------------------------------

-- 3) Iki değişken tanımla ve bu değişkenlere değer ata sonra 1. değişkenin harflerini büyük 2. değişkenin harflerini küçük olacak şekilde veren sorgu

------------------------------------------------

-- 4) Northwind db'sinde ProductName,OrderId,CategoryName veren sorgu

----------------------------------------------

-- 5) Tablo oluştur . Tablo içerisinde aşağıdaki kolonlar olsun :

-- 1. Id kolonu PK ve otomatik artsın

 

-- 2. Ürün Adı Not Null

 

-- 3. Satış Tarihi Default değer Bugünün Tarihi

 

-- 4. Barkod Unique

---------------------------------------------

-- 6) Tablo oluştur :

 

-- 1. KitapAdı metinsel

 

-- 2. Yazar Adı

 

--2 kolonuda oluşturduktan sonra KitapAdı'nı Clustered  Index Yap.Ardından YazarAdı'nın NonClustered Index Yap

--------------------------------------------------

-- 7) Northwind DB ' si için 5 dakika sonra Otomatik olarak BackUp alan bir Görev oluştur

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

pubs

deny

sql server agent

check

union

page

 

 

 

 

select substring('Bilge Adam',7,4)

select max(unitsInStock) from products

 

declare @a nvarchar (40)

declare @b nvarchar (40)

set @a='ali'

set @b='hasan'

select upper(@a)

select lower(@b)

 

select ProductName, OrderId, CategoryName from products inner join Orders on

 

create table Veri

(

Id int primary key Identity(1,1),

UrunAdi nvarchar(40) not null,

Barkod int unique,

SatisTarihi date default(GetDate())

)

 

create table Kitap

(

KitapAdi nvarchar(50),

Yazar nvarchar (50)

)

 

create Clustered Index CX_KitapAdi

on Kitap(KitapAdi)

 

create NonClustered Index NX_Yazar

on Kitap(Yazar)

 

 