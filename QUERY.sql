-- Kotas� limitsiz olan �r�nler hangileridir? ----Telco �emas� i�in--
    SELECT PRODUCT_NAME,QUOTA FROM TELCO.PRODUCT WHERE QUOTA ='LIMITLESS';
    
-- Stat�s� 'Initial' olan m��terileri bulunuz. ----Telco �emas� i�in
    SELECT CUSTOMER.NAME,STATUS FROM TELCO.CUSTOMER WHERE status ='INITIAL';
    
-- �ehir bilgisi 'ISTANBUL' olan adresleri bulunuz. ----Telco �emas� i�in
    SELECT FULL_ADDRESS,CITY FROM TELCO.ADDRESS WHERE CITY LIKE 'Istan%' OR CITY LIKE  'ISTANBUL%' ; -- SORUDA BEL�RT�LD��� �ZERE BUYUK HARFLE ISTANBUL YAZINCA GELMIYORDU LIKE ILE YAPMAK ZORUNDA KALDIM

-- Birim fiyat� 150'den b�y�k olan order_itemlar� bulunuz. ----Sales �emas� i�in
    SELECT UNIT_PRICE "(150 DEN BUYUK OLANLAR)" FROM SALES.order_�tems WHERE UNIT_PRICE >150.00;

-- ��e al�m tarihi May�s 2016 olan �al��anlar� bulunuz. ----Sales �emas� i�in
    SELECT FIRST_NAME, HIRE_DATE FROM SALES.EMPLOYEES WHERE HIRE_DATE BETWEEN '01/05/2016' AND '31/05/2016';

-- Ad� Charlie ya da Charlsie olan contactlar� bulunuz. ----Sales �emas� i�in
    SELECT FIRST_NAME FROM SALES.contacts WHERE FIRST_NAME = 'Charlie'  or FIRST_NAME = 'Charlsie' ;

--Y�l�n 4. aylar�nda en �ok hangi ama�la kredi �ekilmi?tir? ----Banking �emas� i�in  
    SELECT T.TYPE,T.OPERATION,COUNT( t.OPERATION) FROM bank�ng.TRANSACTIONS T WHERE t.month = 4 AND T.TYPE='Credit' GROUP BY T.TYPE,T.OPERATION; ----------------------yanl�� olabilir.

-- Adet say�s� 10dan b�y�k 50den k���k envanterleri bulunuz. ----Sales �emas� i�in
    SELECT (select P.product_name from SALES.products P WHERE p.product_�d=SI.product_�d) "PRODUCT NAME" ,quant�ty 
    FROM SALES.INVENTORIES SI where quant�ty >10 and quant�ty< 50 ;

-- Birincil ileti�im bilgisi olmayan telefon numaralar�n� bulunuz. ----Telco �emas� i�in
    SELECT cnt_type,cnt_value,IS_PRIMARY FROM TELCO.contact WHERE IS_PRIMARY = 0;

-- Bir sipari�te toplam 100.0000'den fazla �cret �deyen emirler nedir? ----Sales �emas� i�in
    SELECT * FROM SALES.ORDER_ITEMS WHERE un�t_pr�ce>100.00;

-- Bankan�n 50 ve ya 51 ya��nda kad�n m��terilerinden ayn� isme sahip olan m��terisi/m��terileri var m�? Varsa isimleri neler?----Banking �emas� i�in
    SELECT FIRST, COUNT(FIRST)"SAYISI"
    FROM BANKING.CLIENTS WHERE AGE =50 OR AGE =51 GROUP BY FIRST;

-- Hesap �deme �ekli nakit olmayan hesaplar hangileridir? ----Telco �emas� i�in
    SELECT ACCOUNT_NAME, payment_type FROM TELCO.ACCOUNT WHERE payment_type NOT LIKE 'CASH';

-- Stat�s� deaktif olan m��terilerin ba�lant� kesim tarihleri nedir? ----Telco �emas� i�in
    SELECT ACCOUNT_NAME, account_clos�ng_date,STATUS FROM TELCO.ACCOUNT WHERE STATUS = 'DEACTIVE';

-- Manager'� olmayan �al��anlar hangileridir? ----Sales �emas� i�in
    SELECT FIRST_NAME FROM SALES.employees WHERE MANAGER_ID=0 OR MANAGER_ID IS NULL;

-- State bilgisi bo� olan lokasyonlar� bulunuz.----Sales �emas� i�in
        SELECT ADDRESS, STATE FROM SALES.LOCATIONS WHERE STATE='' OR STATE IS NULL;

-- Hesap kapan�� tarihi dolu olan hesaplar� bulunuz. ----Telco �emas� i�in
    SELECT ACCOUNT_NAME,ACCOUNT_CLOSING_DATE FROM TELCO.ACCOUNT WHERE ACCOUNT_CLOSING_DATE IS NOT NULL;

-- Elektronik fatura mail adresi (E_bill_email) olan hesaplar hangileridir? ----Telco �emas� i�in
    SELECT ACCOUNT_NAME,E_BILL_EMAIL FROM TELCO.ACCOUNT WHERE E_BILL_EMAIL IS NOT NULL;

-- Durumu iptal olan ve sat�c�lar� olmayan emirler hangileridir? ----Sales �emas� i�in
    SELECT ORDER_ID, STATUS,SALESMAN_ID FROM SALES.ORDERS WHERE STATUS='Canceled' AND SALESMAN_ID IS NULL;

-- S�zle�me biti� tarihi 1 Ocak 2000'den b�y�k , 1 Ocak 2005'ten k���k olan s�zle�meleri bulunuz. ----Telco �emas� i�in
    SELECT * FROM TELCO.SUBSCRIPTION WHERE DEACTIVATION_DATE > '01/01/2000' AND DEACTIVATION_DATE < '01/01/2005';

-- Ocak 2016 ile Haziran 2016 aras�nda verilen sipari�ler hangileridir? ----Sales �emas� i�in
     SELECT ORDER_ID, ORDER_DATE FROM SALES.ORDERS WHERE order_date BETWEEN '01/01/2016' AND '01/06/2016';

-- 2005 y�l�ndan �nce yap�lan ve hala aktif olan subscriptionlar hangileridir?  ----Telco �emas� i�in
    SELECT * FROM TELCO.SUBSCRIPTION WHERE STATUS='ACTIVE' AND ACTIVATION_DATE < '01/01/2005';

-- S�zle�me ba�lang�� tarihi Ocak 2010'dan b�y�k olan s�zle�meleri bulunuz. ----Telco �emas� i�in
    SELECT * FROM TELCO.SUBSCRIPTION WHERE ACTIVATION_DATE > '31/01/2010';

-- �smi E ile ba�layan m��terileri bulunuz. ----Telco �emas� i�in
    SELECT NAME FROM TELCO.CUSTOMER WHERE NAME LIKE 'E%';

-- Product tipi 'DSL' ile biten �r�nleri bulunuz. ----Telco �emas� i�in
    SELECT product_name, product_type FROM TELCO.product WHERE product_type LIKE '%DSL';

-- Unvan� 'S' ile ba�lamayan �al��anlar� bulunuz. ----Sales �emas� i�in
    select FIRST_NAME,JOB_TITLE from SALES.employees where JOB_TITLE LIKE 'S%';

-- Herhangi bir �e�it Intel Xeon �r�nler hangileridir? ----Sales �emas� i�in
    SELECT PRODUCT_NAME, DESCRIPTION FROM SALES.PRODUCTS WHERE PRODUCT_NAME LIKE '%Xeon%';

-- �sminde ya da soyisminde '�' harfi ge�en m��teriler hangileridir? ----Telco �emas� i�in
    SELECT NAME FROM TELCO.CUSTOMER WHERE NAME LIKE '%�%' or SURNAME LIKE '%�%';

-- �smi 'C' ile ba�layan kontaklar hangileridir? Soyad�na g�re alfabetik s�ra ile s�ralayal�m. ----Sales �emas� i�in
    SELECT FIRST_NAME, last_name FROM sales.contacts WHERE FIRST_NAME LIKE 'C%' ORDER BY LAST_NAME  ASC ;

-- �r�n ad� 'Asus' ile ba�layan ve liste fiyat� standart �cretinden k���k olan �r�nleri bulunuz. ----Sales �emas� i�in
    SELECT product_name FROM SALES.PRODUCTS WHERE PRODUCT_NAME LIKE 'Asus%' AND LIST_PRICE < standard_cost;

-- �lke kodu UK ve AU olan adresleri bulunuz.----Telco �emas� i�in     --- BURDA MANTI�A G�RE OR DEMEK GEREK�YOR AND DE��L.
    select FULL_ADDRESS from TELCO.address WHERE COUNTRY_CD ='UK' OR COUNTRY_CD ='AU' ; 

-- 1,2,4,5 id'li kategorilerin bilgilerini bulunuz. ----Sales �emas� i�in  ------------------ SANIRIM BURDA PRODUCT IDLER� OLANLARIN B�LG�LER�N� BULUNUZ ANLAMINDA YOKSA KATEGOR� �DS�N�N B�LG�S� AYNI TABLODA ZATEN.
    select P.PRODUCT_ID, P.product_NAME, (SELECT C.CATEGORY_NAME FROM SALES.PRODUCT_CATEGORIES C
    WHERE c.CATEGORY_ID=P.CATEGORY_ID) from sales.products P WHERE PRODUCT_ID <6 ORDER BY PRODUCT_ID ASC;

-- Taahh�t s�resi 240 ve 120 ay olan b�t�n s�zle�meleri bulmak istiyoruz.----Telco �emas� i�in
    SELECT * FROM telco.AGREEMENT WHERE comm�tment_durat�on = '120 MONTHS' OR comm�tment_durat�on = '240 MONTHS';

-- Sipari� durumu 'Shipped'den farkl� olan m��terilerin bilgilerini bulunuz. ----Sales �emas� i�in
    select O.STATUS,(SELECT C.NAME FROM SALES.CUSTOMERS C where C.CUSTOMER_ID = O.CUSTOMER_ID ) "MUSTERI ADI" 
    from SALES.ORDERS O WHERE O.STATUS NOT LIKE 'Shipped' ;

-- Adet say�s� 100e e�it olan envanterlerin product bilgisini bulunuz. ----Sales �emas� i�in
    SELECT (SELECT P.PRODUCT_NAME FROM SALES.PRODUCTS P WHERE P.PRODUCT_ID=SI.PRODUCT_ID) "URUN ADI",SI.QUANTITY
    FROM SALES.INVENTORIES SI WHERE s�.QUANTITY=100;

-- S�zle�me alt tipi MAIN olan ka� tane s�zle�me vard�r?----Telco �emas� i�in
    SELECT SUBTYPE, COUNT(*)"SAYISI" FROM telco.AGREEMENT WHERE SUBTYPE ='MAIN' GROUP BY SUBTYPE ;

-- Deaktif m��terilerin say�s�n� bulunuz.----Telco �emas� i�in
    SELECT STATUS, COUNT (*) "SAYISI" FROM telco.customer WHERE STATUS ='DEACTIVE'  GROUP BY STATUS;

-- Beijing (8 numaral� warehouse)'da ka� farkl� envanter vard�r? ----Sales �emas� i�in    --------- YANLI� OLAB�L�R BU SORUYU ANLAMADIM. 3. SELECT CUMLES�NE GE�ECEKT�M. GELEN �R�NLER�N FARKLI ENVANTER� DEMEK ?.. PRODUCT IDLER�NDEN YOLA �IKARAK FARKLI �S�MDE OLAN �R�NLER�N SAYILMASI DEMEK ??? 
   -- SELECT W.WAREHOUSE_NAME, (SELECT COUNT(SI.WAREHOUSE_ID) FROM SALES.INVENTORIES SI WHERE SI.WAREHOUSE_ID= W.WAREHOUSE_ID ) "SAYDIRILAN"   
   -- FROM SALES.WAREHOUSES W WHERE W.WAREHOUSE_ID = 8;

-- �leti�im tipi olarak email ve statusu kullan�mda olan ka� m��teri var?----Telco �emas� i�in
    select SUM(( SELECT COUNT(*) FROM TELCO.CUSTOMER CU WHERE CU.ID=co.CUSTOMER_ID)) "SAYISI"
    FROM TELCO.contact CO WHERE CO.CNT_TYPE ='EMAIL' AND CO.STATUS = 'USED'  ;

-- Liste fiyati 1000 ile 3000 arasinda olan ka� product var?----Sales �emas� i�in
    select COUNT(PRODUCT_ID) from sales.PRODUCTS WHERE l�st_pr�ce BETWEEN 1000 AND 3000  ;

--Hangi y�llarda ka� hesap a��lm��t�r?----Banking �emas� i�in     ------------HESAP A�ILI� TAR�H�N� BULAMADIM.
    SELECT DISTINCT(year), COUNT(*) "say�s�" FROM BANKING.accounts GROUP BY year;

-- ��lemlerin tiplerine g�re toplam say�lar�n�n b�y�kten k����e s�ralamas� nedir?----Banking �emas� i�in     ��LEMLER�N T�PLER� TRANSACTIONS DAK� OpERATION MU
    SELECT DISTINCT(OPERATION), COUNT(*) "say�s�" FROM BANKING.TRANSACTIONS GROUP BY OPERATION order by COUNT(*) desc;  --ALTINI ��Z�YOR AMA �ALI�IYOR .

-- ��lemlerin tiplerine g�re toplam tutarlar�n�n b�y�kten k����e s�ralamas� nedir?----Banking �emas� i�in
    SELECT DISTINCT(OPERATION), sum(amount) "toplam tutar"  from BANKING.TRANSACTIONS GROUP BY OPERATION order by sum(amount) desc;