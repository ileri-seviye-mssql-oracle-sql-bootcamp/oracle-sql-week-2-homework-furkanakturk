-- Kotasý limitsiz olan ürünler hangileridir? ----Telco þemasý için--
    SELECT PRODUCT_NAME,QUOTA FROM TELCO.PRODUCT WHERE QUOTA ='LIMITLESS';
    
-- Statüsü 'Initial' olan müþterileri bulunuz. ----Telco þemasý için
    SELECT CUSTOMER.NAME,STATUS FROM TELCO.CUSTOMER WHERE status ='INITIAL';
    
-- Þehir bilgisi 'ISTANBUL' olan adresleri bulunuz. ----Telco þemasý için
    SELECT FULL_ADDRESS,CITY FROM TELCO.ADDRESS WHERE CITY LIKE 'Istan%' OR CITY LIKE  'ISTANBUL%' ; -- SORUDA BELÝRTÝLDÝÐÝ ÜZERE BUYUK HARFLE ISTANBUL YAZINCA GELMIYORDU LIKE ILE YAPMAK ZORUNDA KALDIM

-- Birim fiyatý 150'den büyük olan order_itemlarý bulunuz. ----Sales þemasý için
    SELECT UNIT_PRICE "(150 DEN BUYUK OLANLAR)" FROM SALES.order_ýtems WHERE UNIT_PRICE >150.00;

-- Ýþe alým tarihi Mayýs 2016 olan çalýþanlarý bulunuz. ----Sales þemasý için
    SELECT FIRST_NAME, HIRE_DATE FROM SALES.EMPLOYEES WHERE HIRE_DATE BETWEEN '01/05/2016' AND '31/05/2016';

-- Adý Charlie ya da Charlsie olan contactlarý bulunuz. ----Sales þemasý için
    SELECT FIRST_NAME FROM SALES.contacts WHERE FIRST_NAME = 'Charlie'  or FIRST_NAME = 'Charlsie' ;

--Yýlýn 4. aylarýnda en çok hangi amaçla kredi çekilmi?tir? ----Banking þemasý için  
    SELECT T.TYPE,T.OPERATION,COUNT( t.OPERATION) FROM bankýng.TRANSACTIONS T WHERE t.month = 4 AND T.TYPE='Credit' GROUP BY T.TYPE,T.OPERATION; ----------------------yanlýþ olabilir.

-- Adet sayýsý 10dan büyük 50den küçük envanterleri bulunuz. ----Sales þemasý için
    SELECT (select P.product_name from SALES.products P WHERE p.product_ýd=SI.product_ýd) "PRODUCT NAME" ,quantýty 
    FROM SALES.INVENTORIES SI where quantýty >10 and quantýty< 50 ;

-- Birincil iletiþim bilgisi olmayan telefon numaralarýný bulunuz. ----Telco þemasý için
    SELECT cnt_type,cnt_value,IS_PRIMARY FROM TELCO.contact WHERE IS_PRIMARY = 0;

-- Bir sipariþte toplam 100.0000'den fazla ücret ödeyen emirler nedir? ----Sales þemasý için
    SELECT * FROM SALES.ORDER_ITEMS WHERE unýt_prýce>100.00;

-- Bankanýn 50 ve ya 51 yaþýnda kadýn müþterilerinden ayný isme sahip olan müþterisi/müþterileri var mý? Varsa isimleri neler?----Banking þemasý için
    SELECT FIRST, COUNT(FIRST)"SAYISI"
    FROM BANKING.CLIENTS WHERE AGE =50 OR AGE =51 GROUP BY FIRST;

-- Hesap ödeme þekli nakit olmayan hesaplar hangileridir? ----Telco þemasý için
    SELECT ACCOUNT_NAME, payment_type FROM TELCO.ACCOUNT WHERE payment_type NOT LIKE 'CASH';

-- Statüsü deaktif olan müþterilerin baðlantý kesim tarihleri nedir? ----Telco þemasý için
    SELECT ACCOUNT_NAME, account_closýng_date,STATUS FROM TELCO.ACCOUNT WHERE STATUS = 'DEACTIVE';

-- Manager'ý olmayan çalýþanlar hangileridir? ----Sales þemasý için
    SELECT FIRST_NAME FROM SALES.employees WHERE MANAGER_ID=0 OR MANAGER_ID IS NULL;

-- State bilgisi boþ olan lokasyonlarý bulunuz.----Sales þemasý için
        SELECT ADDRESS, STATE FROM SALES.LOCATIONS WHERE STATE='' OR STATE IS NULL;

-- Hesap kapanýþ tarihi dolu olan hesaplarý bulunuz. ----Telco þemasý için
    SELECT ACCOUNT_NAME,ACCOUNT_CLOSING_DATE FROM TELCO.ACCOUNT WHERE ACCOUNT_CLOSING_DATE IS NOT NULL;

-- Elektronik fatura mail adresi (E_bill_email) olan hesaplar hangileridir? ----Telco þemasý için
    SELECT ACCOUNT_NAME,E_BILL_EMAIL FROM TELCO.ACCOUNT WHERE E_BILL_EMAIL IS NOT NULL;

-- Durumu iptal olan ve satýcýlarý olmayan emirler hangileridir? ----Sales þemasý için
    SELECT ORDER_ID, STATUS,SALESMAN_ID FROM SALES.ORDERS WHERE STATUS='Canceled' AND SALESMAN_ID IS NULL;

-- Sözleþme bitiþ tarihi 1 Ocak 2000'den büyük , 1 Ocak 2005'ten küçük olan sözleþmeleri bulunuz. ----Telco þemasý için
    SELECT * FROM TELCO.SUBSCRIPTION WHERE DEACTIVATION_DATE > '01/01/2000' AND DEACTIVATION_DATE < '01/01/2005';

-- Ocak 2016 ile Haziran 2016 arasýnda verilen sipariþler hangileridir? ----Sales þemasý için
     SELECT ORDER_ID, ORDER_DATE FROM SALES.ORDERS WHERE order_date BETWEEN '01/01/2016' AND '01/06/2016';

-- 2005 yýlýndan önce yapýlan ve hala aktif olan subscriptionlar hangileridir?  ----Telco þemasý için
    SELECT * FROM TELCO.SUBSCRIPTION WHERE STATUS='ACTIVE' AND ACTIVATION_DATE < '01/01/2005';

-- Sözleþme baþlangýç tarihi Ocak 2010'dan büyük olan sözleþmeleri bulunuz. ----Telco þemasý için
    SELECT * FROM TELCO.SUBSCRIPTION WHERE ACTIVATION_DATE > '31/01/2010';

-- Ýsmi E ile baþlayan müþterileri bulunuz. ----Telco þemasý için
    SELECT NAME FROM TELCO.CUSTOMER WHERE NAME LIKE 'E%';

-- Product tipi 'DSL' ile biten ürünleri bulunuz. ----Telco þemasý için
    SELECT product_name, product_type FROM TELCO.product WHERE product_type LIKE '%DSL';

-- Unvaný 'S' ile baþlamayan çalýþanlarý bulunuz. ----Sales þemasý için
    select FIRST_NAME,JOB_TITLE from SALES.employees where JOB_TITLE LIKE 'S%';

-- Herhangi bir çeþit Intel Xeon ürünler hangileridir? ----Sales þemasý için
    SELECT PRODUCT_NAME, DESCRIPTION FROM SALES.PRODUCTS WHERE PRODUCT_NAME LIKE '%Xeon%';

-- Ýsminde ya da soyisminde 'ü' harfi geçen müþteriler hangileridir? ----Telco þemasý için
    SELECT NAME FROM TELCO.CUSTOMER WHERE NAME LIKE '%ü%' or SURNAME LIKE '%ü%';

-- Ýsmi 'C' ile baþlayan kontaklar hangileridir? Soyadýna göre alfabetik sýra ile sýralayalým. ----Sales þemasý için
    SELECT FIRST_NAME, last_name FROM sales.contacts WHERE FIRST_NAME LIKE 'C%' ORDER BY LAST_NAME  ASC ;

-- Ürün adý 'Asus' ile baþlayan ve liste fiyatý standart ücretinden küçük olan ürünleri bulunuz. ----Sales þemasý için
    SELECT product_name FROM SALES.PRODUCTS WHERE PRODUCT_NAME LIKE 'Asus%' AND LIST_PRICE < standard_cost;

-- Ülke kodu UK ve AU olan adresleri bulunuz.----Telco þemasý için     --- BURDA MANTIÐA GÖRE OR DEMEK GEREKÝYOR AND DEÐÝL.
    select FULL_ADDRESS from TELCO.address WHERE COUNTRY_CD ='UK' OR COUNTRY_CD ='AU' ; 

-- 1,2,4,5 id'li kategorilerin bilgilerini bulunuz. ----Sales þemasý için  ------------------ SANIRIM BURDA PRODUCT IDLERÝ OLANLARIN BÝLGÝLERÝNÝ BULUNUZ ANLAMINDA YOKSA KATEGORÝ ÝDSÝNÝN BÝLGÝSÝ AYNI TABLODA ZATEN.
    select P.PRODUCT_ID, P.product_NAME, (SELECT C.CATEGORY_NAME FROM SALES.PRODUCT_CATEGORIES C
    WHERE c.CATEGORY_ID=P.CATEGORY_ID) from sales.products P WHERE PRODUCT_ID <6 ORDER BY PRODUCT_ID ASC;

-- Taahhüt süresi 240 ve 120 ay olan bütün sözleþmeleri bulmak istiyoruz.----Telco þemasý için
    SELECT * FROM telco.AGREEMENT WHERE commýtment_duratýon = '120 MONTHS' OR commýtment_duratýon = '240 MONTHS';

-- Sipariþ durumu 'Shipped'den farklý olan müþterilerin bilgilerini bulunuz. ----Sales þemasý için
    select O.STATUS,(SELECT C.NAME FROM SALES.CUSTOMERS C where C.CUSTOMER_ID = O.CUSTOMER_ID ) "MUSTERI ADI" 
    from SALES.ORDERS O WHERE O.STATUS NOT LIKE 'Shipped' ;

-- Adet sayýsý 100e eþit olan envanterlerin product bilgisini bulunuz. ----Sales þemasý için
    SELECT (SELECT P.PRODUCT_NAME FROM SALES.PRODUCTS P WHERE P.PRODUCT_ID=SI.PRODUCT_ID) "URUN ADI",SI.QUANTITY
    FROM SALES.INVENTORIES SI WHERE sý.QUANTITY=100;

-- Sözleþme alt tipi MAIN olan kaç tane sözleþme vardýr?----Telco þemasý için
    SELECT SUBTYPE, COUNT(*)"SAYISI" FROM telco.AGREEMENT WHERE SUBTYPE ='MAIN' GROUP BY SUBTYPE ;

-- Deaktif müþterilerin sayýsýný bulunuz.----Telco þemasý için
    SELECT STATUS, COUNT (*) "SAYISI" FROM telco.customer WHERE STATUS ='DEACTIVE'  GROUP BY STATUS;

-- Beijing (8 numaralý warehouse)'da kaç farklý envanter vardýr? ----Sales þemasý için    --------- YANLIÞ OLABÝLÝR BU SORUYU ANLAMADIM. 3. SELECT CUMLESÝNE GEÇECEKTÝM. GELEN ÜRÜNLERÝN FARKLI ENVANTERÝ DEMEK ?.. PRODUCT IDLERÝNDEN YOLA ÇIKARAK FARKLI ÝSÝMDE OLAN ÜRÜNLERÝN SAYILMASI DEMEK ??? 
   -- SELECT W.WAREHOUSE_NAME, (SELECT COUNT(SI.WAREHOUSE_ID) FROM SALES.INVENTORIES SI WHERE SI.WAREHOUSE_ID= W.WAREHOUSE_ID ) "SAYDIRILAN"   
   -- FROM SALES.WAREHOUSES W WHERE W.WAREHOUSE_ID = 8;

-- Ýletiþim tipi olarak email ve statusu kullanýmda olan kaç müþteri var?----Telco þemasý için
    select SUM(( SELECT COUNT(*) FROM TELCO.CUSTOMER CU WHERE CU.ID=co.CUSTOMER_ID)) "SAYISI"
    FROM TELCO.contact CO WHERE CO.CNT_TYPE ='EMAIL' AND CO.STATUS = 'USED'  ;

-- Liste fiyati 1000 ile 3000 arasinda olan kaç product var?----Sales þemasý için
    select COUNT(PRODUCT_ID) from sales.PRODUCTS WHERE lýst_prýce BETWEEN 1000 AND 3000  ;

--Hangi yýllarda kaç hesap açýlmýþtýr?----Banking þemasý için     ------------HESAP AÇILIÞ TARÝHÝNÝ BULAMADIM.
    SELECT DISTINCT(year), COUNT(*) "sayýsý" FROM BANKING.accounts GROUP BY year;

-- Ýþlemlerin tiplerine göre toplam sayýlarýnýn büyükten küçüðe sýralamasý nedir?----Banking þemasý için     ÝÞLEMLERÝN TÝPLERÝ TRANSACTIONS DAKÝ OpERATION MU
    SELECT DISTINCT(OPERATION), COUNT(*) "sayýsý" FROM BANKING.TRANSACTIONS GROUP BY OPERATION order by COUNT(*) desc;  --ALTINI ÇÝZÝYOR AMA ÇALIÞIYOR .

-- Ýþlemlerin tiplerine göre toplam tutarlarýnýn büyükten küçüðe sýralamasý nedir?----Banking þemasý için
    SELECT DISTINCT(OPERATION), sum(amount) "toplam tutar"  from BANKING.TRANSACTIONS GROUP BY OPERATION order by sum(amount) desc;