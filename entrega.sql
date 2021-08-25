/*
Primera Entrega: Bases de datos
Grupo: 4
Nombres: David Palacios, SebastiÃ¡n Vergara, Nicolas Sanchez, Maria Camila Paternina, Paula Penuela
Cuentas: 
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
    day date not null,
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
insert into reserves (sid,bid,day,price) values (1,1,to_date('2021-01-08','YYYY-mm-dd'),254796);
insert into reserves (sid,bid,day,price) values (1,2,to_date('2021-02-09','YYYY-mm-dd'),353215);
insert into reserves (sid,bid,day,price) values (1,3,to_date('2021-03-10','YYYY-mm-dd'),479654);
insert into reserves (sid,bid,day,price) values (1,4,to_date('2021-04-11','YYYY-mm-dd'),235432);
insert into reserves (sid,bid,day,price) values (2,1,to_date('2021-05-12','YYYY-mm-dd'),154845);
insert into reserves (sid,bid,day,price) values (2,2,to_date('2021-06-13','YYYY-mm-dd'),354874);
insert into reserves (sid,bid,day,price) values (2,3,to_date('2021-07-14','YYYY-mm-dd'),313548);
insert into reserves (sid,bid,day,price) values (2,4,to_date('2021-08-15','YYYY-mm-dd'),231354);
insert into reserves (sid,bid,day,price) values (3,1,to_date('2021-07-16','YYYY-mm-dd'),148796);
insert into reserves (sid,bid,day,price) values (3,2,to_date('2021-06-17','YYYY-mm-dd'),132458);
insert into reserves (sid,bid,day,price) values (3,3,to_date('2021-05-18','YYYY-mm-dd'),146987);
insert into reserves (sid,bid,day,price) values (3,4,to_date('2021-04-19','YYYY-mm-dd'),214789);
insert into reserves (sid,bid,day,price) values (4,1,to_date('2021-03-20','YYYY-mm-dd'),369847);
insert into reserves (sid,bid,day,price) values (4,2,to_date('2021-02-21','YYYY-mm-dd'),784965);
insert into reserves (sid,bid,day,price) values (5,1,to_date('2021-01-22','YYYY-mm-dd'),632478);
insert into reserves (sid,bid,day,price) values (5,2,to_date('2020-12-31','YYYY-mm-dd'),854796);
insert into reserves (sid,bid,day,price) values (5,3,to_date('2020-12-01','YYYY-mm-dd'),147369);
insert into reserves (sid,bid,day,price) values (5,4,to_date('2020-11-02','YYYY-mm-dd'),789123);
insert into reserves (sid,bid,day,price) values (1,1,to_date('2020-10-03','YYYY-mm-dd'),159357);
insert into reserves (sid,bid,day,price) values (1,2,to_date('2020-09-04','YYYY-mm-dd'),852147);
insert into reserves (sid,bid,day,price) values (2,1,to_date('2020-08-05','YYYY-mm-dd'),963258);
insert into reserves (sid,bid,day,price) values (3,3,to_date('2020-07-06','YYYY-mm-dd'),789652);
insert into reserves (sid,bid,day,price) values (3,4,to_date('2020-06-07','YYYY-mm-dd'),745632);
insert into reserves (sid,bid,day,price) values (4,2,to_date('2020-05-08','YYYY-mm-dd'),985412);
insert into reserves (sid,bid,day,price) values (5,3,to_date('2020-04-09','YYYY-mm-dd'),789321);
insert into reserves (sid,bid,day,price) values (5,1,to_date('2020-05-10','YYYY-mm-dd'),123987);
insert into reserves (sid,bid,day,price) values (2,3,to_date('2020-06-11','YYYY-mm-dd'),746321);

--VIEWS
/*
1. ¿Cuál es el valor total de reservas por año? La vista debe tener el año y el valor total de reservas (price).
o Utilice la opción EXTRACT(year from fecha) para extraer el año
o Asegúrese que en el resultado aparezcan filas de diferentes años
*/

create or replace view v_totalreservasxanio(anio,total) as
(
        select extract(year from to_date(r.day, 'dd-mm-yyyy')), sum(r.price)
        from reserves r
        group by extract(year from to_date(r.day, 'dd-mm-yyyy'))
);

  
/*
2. ¿Cuál es el valor total de las reservas de un año, 
mes para los marineros hombres? La vista debe tener las
columnas año, mes, valor total reservas
*/

create or replace view v_reservashombres(anio,mes,total) as
( select extract(year from to_date(r.day, 'dd-mm-yyyy')) ANIO, 
                extract(month from to_date(r.day, 'dd-mm-yyyy')) MES,
                sum(r.price) Total
                from reserves r
                inner join sailors s on(s.sid = r.sid)
                where s.gender = 'M'
                group by (extract(year from to_date(r.day, 'dd-mm-yyyy')), extract(month from to_date(r.day, 'dd-mm-yyyy')))
);

/*
3. ¿Cuál es el valor total de las reservas de un año, 
mes para los marineros mujeres? La vista debe tener las
columnas año, mes, valor total reservas
*/
create or replace view v_reservasmujeres(anio,mes,total) as
( select extract(year from to_date(r.day, 'dd-mm-yyyy')) ANIO, 
                extract(month from to_date(r.day, 'dd-mm-yyyy')) MES,
                sum(r.price) Total
                from reserves r
                inner join sailors s on(s.sid = r.sid)
                where s.gender = 'F'
                group by (extract(year from to_date(r.day, 'dd-mm-yyyy')), extract(month from to_date(r.day, 'dd-mm-yyyy')))
);
--CONSULTAS
/*
1. Produzca un listado que contenga nombre y el 
sid del marinero, nombre del bote, fecha y valor de la reserva,
ordenado por nombre del marinero y nombre del bote
*/

select s.sid SID, s.sname NOMBREMARINERO, b.bname NOMBREBARCO, r.day FECHA, r.price PRECIO
from reserves r
inner join sailors s on (r.sid = s.sid)
inner join boats b on (r.bid = b.bid)
order by s.sname , b.bname;

/*
2. ¿Cuántas reservas tiene cada marinero? Liste el nombre, cantidad total de reservas. 
Los marineros que no tengan reservas deben aparecer en el 
resultado con 0 en la cantidad.
*/

select s.sname Nombre, count(r.bid) Reservas
from reserves r
right join sailors s on(s.sid = r.sid)
group by s.sname
order by Reservas desc;

/*
3. ¿Qué valor total de reservas tiene cada bote por año, mes? 
Liste nombre del bote, año, mes y valor total de
reservas.
*/
select b.bname NOMBREBARCO, extract(year from to_date(r.day, 'dd-mm-yyyy')) as ANIO, 
                extract(month from to_date(r.day, 'dd-mm-yyyy')) as MES,
                sum(r.price) Total
from reserves r
inner join boats b on(r.bid = b.bid)
group by (b.bname, extract(year from to_date(r.day, 'dd-mm-yyyy')), extract(month from to_date(r.day, 'dd-mm-yyyy')))
order by b.bname, ANIO desc, MES;


/*
4. ¿Cuál es el valor total de reservas por año? Liste el año y el valor total de reservas. 
En una última fila debe
aparecer el valor total de todas las reservas, esto es, la suma de reservas de todos los años.
a. Utilice la vista creada anteriormente

*/
select anio, total from v_totalreservasxanio
union
select 9999, sum(total) from v_totalreservasxanio;
;

/*
5. ¿Qué marinero ha tenido reservas en todos los botes que ha 
reservado? Liste el nombre.
a. Asegúrese que en el resultado aparezcan filas
*/
