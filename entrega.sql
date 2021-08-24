/*
Primera Entrega: Bases de datos
Grupo: 4
Nombres: David Palacios, SebastiÃ¡n Vergara, Nicolas Sanchez, Maria Camila Paternina, Paula Penuela
*/

--CREACIÓN DE TABLAS
--TABLA SAILORS
drop table reserves;
drop table sailors;
drop table boats;
create table sailors(
    sid number(10,0) generated always as identity primary key,
    sname varchar2(50) not null, --Nombre marinero
    email varchar2(50) unique not null, --Email
    age numeric check (age between 0 and 150) not null,
    gender varchar2(20) not null check(gender ='F' or gender ='M')
);
grant select on sailors to jcarreno;

--TABLA BOATS

create table boats(
    bid number(10,0) generated always as identity primary key,
    bname varchar(30) unique not null, --Nombre bote
    color varchar(20) not null
);
grant select on boats to jcarreno;

--TABLA RESERVES

create table reserves(
    sid number(10,0) not null,
    bid number(10,0) not null,
    day date unique not null,
    price numeric default 0 check(price>=0) not null,
    primary key (sid,bid,day),
    foreign key (sid) references sailors(sid),
    foreign key (bid) references boats(bid)
);
grant select on reserves to jcarreno;

--INSERCIÓN DE REGISTROS
--SAILORS
insert into sailors(sname, email, age, gender) values ('Julio Carreno','jcarreno@javeriana.edu.co',50,'M');
insert into sailors(sname, email, age, gender) values ('David Palacios','david_palacios@javeriana.edu.co',20,'M');
insert into sailors(sname, email, age, gender) values ('Paula Penuela','paula_penuela@javeriana.edu.co',18,'F');
insert into sailors(sname, email, age, gender) values ('Sebastian Vergara','s_vergara@javeriana.edu.co',18,'M');
insert into sailors(sname, email, age, gender) values ('Maria Camila Paternina','maria-paternina@javeriana.edu.co',23,'F');
insert into sailors(sname, email, age, gender) values ('Nicolas Sanchez','sanchezl-na@javeriana.edu.co',19,'M');

--BOATS
insert into boats(bname, color) values ('La Nina','AZUL');
insert into boats(bname, color) values ('La Pinta','ROJO');
insert into boats(bname, color) values ('La Santa Maria','AMARILLO');
insert into boats(bname, color) values ('La Esperanza','AZUL');
insert into boats(bname, color) values ('La Maravilla','ROJO');


--RESERVES
insert into reserves (sid,bid,day,price) values (1,1,to_date('2021-01-08','yyyy-mm-dd'),254796);
insert into reserves (sid,bid,day,price) values (1,2,to_date('2021-02-09','yyyy-mm-dd'),353215);
insert into reserves (sid,bid,day,price) values (1,3,to_date('2021-03-10','yyyy-mm-dd'),479654);
insert into reserves (sid,bid,day,price) values (1,4,to_date('2021-04-11','yyyy-mm-dd'),235432);
insert into reserves (sid,bid,day,price) values (2,1,to_date('2021-05-12','yyyy-mm-dd'),154845);
insert into reserves (sid,bid,day,price) values (2,2,to_date('2021-06-13','yyyy-mm-dd'),354874);
insert into reserves (sid,bid,day,price) values (2,3,to_date('2021-07-14','yyyy-mm-dd'),313548);
insert into reserves (sid,bid,day,price) values (2,4,to_date('2021-08-15','yyyy-mm-dd'),231354);
insert into reserves (sid,bid,day,price) values (3,1,to_date('2021-07-16','yyyy-mm-dd'),148796);
insert into reserves (sid,bid,day,price) values (3,2,to_date('2021-06-17','yyyy-mm-dd'),132458);
insert into reserves (sid,bid,day,price) values (3,3,to_date('2021-05-18','yyyy-mm-dd'),146987);
insert into reserves (sid,bid,day,price) values (3,4,to_date('2021-04-19','yyyy-mm-dd'),214789);
insert into reserves (sid,bid,day,price) values (4,1,to_date('2021-03-20','yyyy-mm-dd'),369847);
insert into reserves (sid,bid,day,price) values (4,2,to_date('2021-02-21','yyyy-mm-dd'),784965);
insert into reserves (sid,bid,day,price) values (5,1,to_date('2021-01-22','yyyy-mm-dd'),632478);
insert into reserves (sid,bid,day,price) values (5,2,to_date('2020-12-31','yyyy-mm-dd'),854796);
insert into reserves (sid,bid,day,price) values (5,3,to_date('2020-12-01','yyyy-mm-dd'),147369);
insert into reserves (sid,bid,day,price) values (5,4,to_date('2020-11-02','yyyy-mm-dd'),789123);
insert into reserves (sid,bid,day,price) values (1,1,to_date('2020-10-03','yyyy-mm-dd'),159357);
insert into reserves (sid,bid,day,price) values (1,2,to_date('2020-09-04','yyyy-mm-dd'),852147);
insert into reserves (sid,bid,day,price) values (2,1,to_date('2020-08-05','yyyy-mm-dd'),963258);
insert into reserves (sid,bid,day,price) values (3,3,to_date('2020-07-06','yyyy-mm-dd'),789652);
insert into reserves (sid,bid,day,price) values (3,4,to_date('2020-06-07','yyyy-mm-dd'),745632);
insert into reserves (sid,bid,day,price) values (4,2,to_date('2020-05-08','yyyy-mm-dd'),985412);
insert into reserves (sid,bid,day,price) values (5,3,to_date('2020-04-09','yyyy-mm-dd'),789321);
insert into reserves (sid,bid,day,price) values (6,1,to_date('2020-05-10','yyyy-mm-dd'),123987);





