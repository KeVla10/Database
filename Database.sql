Modul 1
1.
create tablespace Kevin_06911
datafile 'E:\Kuliah\ITATS\Semester 6\Database\Praktikum\Modul 1\Kevin_06911.dbf'
size 30M;

2.
create user kevin06911
identified by kevla
default tablespace Kevin_06911
quota 30M on Kevin_06911;

3.
grant all privileges to kevin06911;

4.
create table supplier
(
id_supplier    integer       not null,
nama_supplier    varchar2(25),
nama_sales varchar2(25),
no_telp       varchar2(13),
alamat        varchar2(100),
constraint PK_supplier primary key(id_supplier)
);

5.
create table pembelian
(
id_pembelian 	integer 	not null,
id_supplier 	integer,
id_detail_pembelian 	integer,
username 	varchar2(10),
jumlah_pembelian 	number(3),
tgl_pembelian 	date,
constraint PK_pembelian primary key(id_pembelian)
);

6.
create table pengguna
(
username 	varchar2(10) 	not null,
id_pembelian 	integer,
id_penjualan 	integer,
password 	varchar2(10),
nama 	varchar2(25),
alamat 	varchar2(100),
no_tlp 	varchar(13),
constraint PK_us_er primary key(username)
);

7.
create table penjualan
(
id_penjualan 	integer not null,
username 	varchar2(10),
jumlah_penjualan numeric(3),
tgl_penjualan 	date,
constraint PK_penjualan primary key(id_penjualan)
);

8.
create table detail_penjualan
(
id_detail_penjualan 	integer not null,
id_barang integer,
id_penjualan integer,
jumlah numeric(3),
constraint PK_detail_penjualan primary key(id_detail_penjualan)
);

9.
create table detail_pembelian
(
id_detail_pembelian integer not null,
id_pembelian integer,
total_pembelian numeric(3),
constraint PK_detail_pembelian primary key(id_detail_pembelian)
);

10.
create table barang
(
id_barang integer not null,
id_kategori integer,
id_detail_pembelian integer,
nama_barang varchar2(25),
stok number(3),
harga number(7),
constraint PK_barang primary key(id_barang)
);

11.
create table kategori_barang
(
id_kategori integer not null,
nama_kategori varchar2(25),
deskripsi varchar2(25),
constraint PK_kategori_barang primary key(id_kategori)
);

12.
alter table pembelian
add constraint FK_id_supplier foreign key (id_supplier)
references supplier(id_supplier)
add constraint FK_id_detail_pembelian foreign key (id_detail_pembelian)
references detail_pembelian(id_detail_pembelian)
add constraint FK_username foreign key (username)
references pengguna(username);

13.
alter table pengguna
add constraint FK_id_pembelian foreign key (id_pembelian)
references pembelian(id_pembelian)
add constraint FK_id_penjualan foreign key (id_penjualan)
references penjualan(id_penjualan);

14.
alter table penjualan
add constraint FK_usernam foreign key (username)
references pengguna(username);

15.
alter table detail_penjualan
add constraint FK_barang foreign key(id_barang)
references barang(id_barang)
add constraint FK_id_penjuala foreign key (id_penjualan)
references penjualan(id_penjualan);

16.
alter table barang
add constraint FK_kategori foreign key (id_kategori)
references kategori_barang(id_kategori)
add constraint FK_id_detail_pembelia foreign key (id_detail_pembelian)
references detail_pembelian(id_detail_pembelian);

17.
create sequence id_barang
minvalue 1
maxvalue 999
start with 1
increment by 1
cache 20;

18.
alter table kategori_barang
rename column nama_kategori to kategori_06911/alter table PENGGUNA 
rename column NAMA to NAMA_06911;

19.
alter table barang
add constraint UQ_barang UNIQUE (nama_barang);

20.
alter table PENGGUNA modify(NO_TLP char (12));

21.
select * from user_sequences;

Modul 2
1.
create sequence id_supplier
minvalue 1
maxvalue 999
start with 1
increment by 1
cache 20;

insert into supplier (id_supplier,nama_supplier,nama_sales,no_telp,alamat) values (id_supplier.nextval,'Unilever','Sukijan','123456789','Jombang');
insert into supplier (id_supplier,nama_supplier,nama_sales,no_telp,alamat) values (id_supplier.nextval,'Wings','Eko','234567891','Gresik');

insert all
into supplier (id_supplier,nama_supplier,nama_sales,no_telp,alamat) values (3,'Indofood','Ibud','345678912','Malang')
into supplier (id_supplier,nama_supplier,nama_sales,no_telp,alamat) values (4,'Sidu','Joko','456789123','Surabaya')
into supplier (id_supplier,nama_supplier,nama_sales,no_telp,alamat) values (5,'Finna','Samsul','567891234','Sidoarjo')
select 1 from dual;

insert all
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(1, 'Makanan', 'Makan')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(2, 'Pensil', 'Alat Tulis')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(3, 'Tipe-X', 'Alat Tulis')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(4, 'Buku', 'Buku')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(5, 'Bolpoin', 'Alat Tulis')
select 1 from dual;

insert all
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(1,1, 'Andi', to_date('01/01/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(2,2, 'Dwi', to_date('02/02/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(3,3, 'Tri', to_date('03/03/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(4,4, 'Budi', to_date('04/04/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(5,5, 'Hudi', to_date('05/05/2017','dd/mm/yyyy'))
select 1 from dual;

insert all 
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(1,1,20)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(2,2,30)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(3,3,40)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(4,4,50)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(5,5,60)
select 1 from dual;

insert all 
into penjualan(id_penjualan, username, tgl_penjualan) values(1,'Andi', to_date('01/02/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(2,'Dwi', to_date('02/03/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(3,'Tri', to_date('03/04/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(4,'Budi', to_date('04/05/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(5,'Hudi', to_date('05/06/2017','dd/mm/yyyy'))
select 1 from dual;

insert all
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(1,1,1,3)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(2,2,2,3)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(3,3,3,5)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(4,4,4,2)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(5,5,5,8)
select 1 from dual;

insert all
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(1,1,1,'Nasi Goreng', 20, 5000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(2,2,2,'Faber Castle 2B', 30, 2000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(3,3,3,'Kenko', 40, 3000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(4,4,4,'Sinar Dunia', 50, 1500)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(5,5,5,'PILOT', 60, 2500)
select 1 from dual;

insert all
into pengguna(username, password, nama_06911, alamat , no_tlp) values('Andi','andi', 'andi', 'Sidoarjo','123456789')
into pengguna(username, password, nama_06911, alamat , no_tlp) values('Dwi', 'dwi', 'dwi', 'Jombang','123456789')
into pengguna(username, password, nama_06911, alamat , no_tlp) values('Tri', 'tri', 'tri', 'Mojokert','123456789')
into pengguna(username, password, nama_06911, alamat , no_tlp) values('Budi', 'budi', 'budi', 'Surabaya','123456789')
into pengguna(username, password, nama_06911, alamat , no_tlp) values('Hudi', 'hudi', 'hudi', 'Madiun','123456789')
select 1 from dual;

update supplier set alamat = 'Suramadu'
where no_telp = '123456789';

update supplier set nama_sales = 'Hudi'
where nama_sales ='Budi' AND alamat = 'Suramadu' or id_supplier = 1;

update pengguna set alamat = 'Madura'
where nama_06911 like'h%';

Delete from detail_penjualan Where id_detail_penjualan < 3 OR jumlah = '5'; 

savepoint sp1;
update supplier set nama_sales = 'Hudi'
where nama_sales ='Budi' AND alamat = 'Suramadu' or id_supplier = 1;
rollback to sp1;
commit

select * from supplier
order by nama_sales asc;

select nama_sales
from supplier
group by nama_sales;

Modul 3
1.
insert all
into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(6,'Kraft Foods.', 'Aditya', '123456789', 'Bogor')
into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(7,'Nestl� S.A', 'Andy', '123456789', 'Depok')
into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(8,'Procter', 'Pratama', '123456789', 'Sukabumi')
into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(9,'Johnson', 'Nur', '123456789', 'Tasikmalaya')
into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(10,'SIDU', 'Malik', '123456789', 'Cirebon');

insert all
into pengguna(username, password, nama_06911, alamat , no_tlp) values('Bayu','bayu', 'bayu', 'Batu','123456789')
into pengguna(username, password, nama_06911, alamat , no_tlp) values('Bambang', 'bambang', 'bambang', 'Tegal','123456789')
into pengguna(username, password, nama_06911, alamat , no_tlp) values('Hafidz', 'hafidz', 'hafidz', 'Mojokerto','123456789')
into pengguna(username, password, nama_06911, alamat , no_tlp) values('Anwar', 'anwar', 'anwar', 'Surabaya','123456789')
into pengguna(username, password, nama_06911, alamat , no_tlp) values('Putra', 'putra', 'putra', 'Madiun','123456789')
select 1 from dual;

insert all
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(6, 'Jangka', 'Alat Tulis')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(7, 'Gunting', 'Alat Tulis')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(8, 'Kertas', 'Alat Tulis')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(9, 'Penggaris', 'Alat Tulis')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(10, 'Pakaian Sekolah', 'Keperluan Sekolah')
select 1 from dual;

insert all
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(6,6, 'Bayu', to_date('06/06/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(7,7, 'Bambang', to_date('07/07/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(8,8, 'Hafidz', to_date('08/08/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(9,9, 'Anwar', to_date('09/09/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(10,10, 'Putra', to_date('10/10/2017','dd/mm/yyyy'))
select 1 from dual;

insert all 
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(6,6,60)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(7,7,50)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(8,8,40)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(9,9,30)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(10,10,20)
select 1 from dual;

insert all
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(6,6,6,'Joyko', 60, 5000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(7,7,7,'IKEA', 50, 7000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(8,8,8,'SIDU', 40, 1000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(9,9,9,'Butterfly', 30, 2500)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(10,10,10,'Purnama', 20, 10000)
select 1 from dual;

insert all 
into penjualan(id_penjualan, username, tgl_penjualan) values(6,'Bayu', to_date('01/02/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(7,'Dwi', to_date('02/03/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(8,'Anwar', to_date('03/04/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(9,'Putra', to_date('04/05/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(10,'Hudi', to_date('05/06/2017','dd/mm/yyyy'))
select 1 from dual;

insert all
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(6,6,6,8)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(7,7,7,5)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(8,8,8,2)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(9,9,9,10)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(10,10,10,8)
select 1 from dual;

2.
select max(total_pembelian) as BARANG_MASUK_TERBANYAK, min(total_pembelian) as BARANG_MASUK_TERKECIL
from detail_pembelian;

select id_detail_pembelian, count(id_detail_pembelian) as BANYAK_TRANSAKSI
from detail_pembelian where id_detail_pembelian = 5 AND total_pembelian = 60
group by id_detail_pembelian;

select id_detail_penjualan, sum(jumlah) as total_item
from detail_penjualan
where id_detail_penjualan = 3
group by id_detail_penjualan;

select avg(jumlah) as rata_rata_pembelian from detail_penjualan;

3.
select 
id_detail_pembelian, total_pembelian
from detail_pembelian
where total_pembelian = (select min(total_pembelian)
from detail_pembelian)
or total_pembelian = (select max(total_pembelian)
from detail_pembelian);

select 
id_detail_pembelian
from detail_pembelian
where id_detail_pembelian = (select count(id_detail_pembelian) 
from detail_pembelian where id_detail_pembelian = 5 AND total_pembelian = 60
group by id_detail_pembelian);

select id_detail_penjualan,(select sum(jumlah) as total_item from detail_penjualan)
as total_item from detail_penjualan
group by id_detail_penjualan, jumlah;

select jumlah,(select avg(jumlah) as rata_rata_pembelian from detail_penjualan )
as rata_rata_pembelian from detail_penjualan
group by jumlah;

select id_detail_penjualan from detail_penjualan 
where id_detail_penjualan < (select sum(jumlah) as data from detail_penjualan);

select id_detail_penjualan, (select max(total_pembelian) from detail_pembelian
where id_detail_penjualan < (select sum(jumlah) from detail_penjualan
where id_detail_penjualan < (select avg(jumlah) from detail_penjualan)))
as total_tertinggi from detail_penjualan;

Modul 4
1.
insert all
into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(11,'Fiesta', 'Slamet', '123456789', 'Jakarta')
into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(12,'Sutra', 'Jumadi', '123456789', 'Bandung')
into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(13,'Vivo', 'Dwi', '123456789', 'Banten')
into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(14,'Durex', 'Kasman', '123456789', 'Purwodadi')
into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(15,'Kimia Farma', 'Jhon', '123456789', 'Bandung')
select 1 from dual;

insert all
into pengguna(username, password, nama_06911, alamat , no_tlp) values('Komeng','Komeng', 'Komeng', 'Batu','123456789')
into pengguna(username, password, nama_06911, alamat , no_tlp) values('Lontong', 'Lontong', 'Lontong', 'Tegal','123456789')
into pengguna(username, password, nama_06911, alamat , no_tlp) values('Akbar', 'Akbar', 'Akbar', 'Mojokerto','123456789')
into pengguna(username, password, nama_06911, alamat , no_tlp) values('Surya', 'Surya', 'Surya', 'Surabaya','123456789')
into pengguna(username, password, nama_06911, alamat , no_tlp) values('Paija', 'Paija', 'Paija', 'Madiun','123456789')
select 1 from dual;

insert all
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(11, 'Palu', 'Alat Konstruksi')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(12, 'Bata', 'Alat Konstruksi')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(13, 'Semen', 'Alat Konstruksi')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(14, 'Kabel', 'Alat Konstruksi')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(15, 'Kapi', 'Alat Konstruksi')
select 1 from dual;

insert all
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(11,11, 'Komeng', to_date('06/06/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(12,12, 'Lontong', to_date('07/07/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(13,13, 'Akbar', to_date('08/08/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(14,14, 'Surya', to_date('09/09/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(15,15, 'Paija', to_date('10/10/2017','dd/mm/yyyy'))
select 1 from dual;

insert all 
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(11,11,60)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(12,12,50)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(13,13,40)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(14,14,30)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(15,15,20)
select 1 from dual;

insert all
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(11,11,11,'Joyko', 60, 5000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(12,12,12,'IKEA', 50, 7000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(13,13,13,'SIDU', 40, 1000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(14,14,14,'Butterfly', 30, 2500)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(15,15,15,'Purnama', 20, 10000)
select 1 from dual;

insert all 
into penjualan(id_penjualan, username, tgl_penjualan) values(11,'Bayu', to_date('01/02/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(12,'Dwi', to_date('02/03/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(13,'Anwar', to_date('03/04/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(14,'Putra', to_date('04/05/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(15,'Hudi', to_date('05/06/2017','dd/mm/yyyy'))
select 1 from dual;

insert all
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(11,11,11,8)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(12,12,12,5)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(13,13,13,2)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(14,14,14,10)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(15,15,15,8)
select 1 from dual;
