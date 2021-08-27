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
insert into reserves (sid,bid,day,price) values (2,3,to_date('2020-07-12','YYYY-mm-dd'),764321);
insert into reserves (sid,bid,day,price) values (5,3,to_date('2020-08-13','YYYY-mm-dd'),756311);
insert into reserves (sid,bid,day,price) values (1,3,to_date('2020-09-14','YYYY-mm-dd'),786521);
insert into reserves (sid,bid,day,price) values (2,3,to_date('2020-10-15','YYYY-mm-dd'),716621);
insert into reserves (sid,bid,day,price) values (3,3,to_date('2020-11-16','YYYY-mm-dd'),746325);
insert into reserves (sid,bid,day,price) values (1,2,to_date('2020-12-17','YYYY-mm-dd'),726921);
insert into reserves (sid,bid,day,price) values (1,4,to_date('2019-12-18','YYYY-mm-dd'),736721);
insert into reserves (sid,bid,day,price) values (1,1,to_date('2019-11-19','YYYY-mm-dd'),749322);
insert into reserves (sid,bid,day,price) values (1,5,to_date('2019-10-20','YYYY-mm-dd'),756421);
insert into reserves (sid,bid,day,price) values (2,1,to_date('2019-09-21','YYYY-mm-dd'),767331);
insert into reserves (sid,bid,day,price) values (2,2,to_date('2019-08-22','YYYY-mm-dd'),775321);
insert into reserves (sid,bid,day,price) values (2,3,to_date('2019-07-23','YYYY-mm-dd'),786421);
insert into reserves (sid,bid,day,price) values (2,4,to_date('2019-06-24','YYYY-mm-dd'),796391);
insert into reserves (sid,bid,day,price) values (2,5,to_date('2019-05-25','YYYY-mm-dd'),706621);
insert into reserves (sid,bid,day,price) values (3,3,to_date('2019-04-26','YYYY-mm-dd'),806321);
insert into reserves (sid,bid,day,price) values (3,5,to_date('2019-03-27','YYYY-mm-dd'),816321);
insert into reserves (sid,bid,day,price) values (4,2,to_date('2019-02-28','YYYY-mm-dd'),826321);
insert into reserves (sid,bid,day,price) values (4,1,to_date('2019-01-29','YYYY-mm-dd'),836321);
insert into reserves (sid,bid,day,price) values (5,3,to_date('2018-01-30','YYYY-mm-dd'),846321);
insert into reserves (sid,bid,day,price) values (1,2,to_date('2018-02-01','YYYY-mm-dd'),856321);
insert into reserves (sid,bid,day,price) values (2,3,to_date('2018-03-02','YYYY-mm-dd'),866321);
insert into reserves (sid,bid,day,price) values (4,3,to_date('2018-04-03','YYYY-mm-dd'),876321);
insert into reserves (sid,bid,day,price) values (5,5,to_date('2018-05-04','YYYY-mm-dd'),886321);
insert into reserves (sid,bid,day,price) values (2,3,to_date('2018-06-05','YYYY-mm-dd'),896321);
insert into reserves (sid,bid,day,price) values (3,4,to_date('2018-07-06','YYYY-mm-dd'),801321);
insert into reserves (sid,bid,day,price) values (5,2,to_date('2018-08-07','YYYY-mm-dd'),812321);
insert into reserves (sid,bid,day,price) values (4,5,to_date('2018-09-08','YYYY-mm-dd'),813321);
insert into reserves (sid,bid,day,price) values (5,4,to_date('2018-10-09','YYYY-mm-dd'),814321);
insert into reserves (sid,bid,day,price) values (3,1,to_date('2018-11-10','YYYY-mm-dd'),815321);
insert into reserves (sid,bid,day,price) values (5,1,to_date('2018-12-11','YYYY-mm-dd'),816321);
insert into reserves (sid,bid,day,price) values (2,3,to_date('2017-12-12','YYYY-mm-dd'),817321);
insert into reserves (sid,bid,day,price) values (2,3,to_date('2017-11-13','YYYY-mm-dd'),818321);
insert into reserves (sid,bid,day,price) values (2,3,to_date('2017-10-14','YYYY-mm-dd'),819321);
insert into reserves (sid,bid,day,price) values (1,3,to_date('2017-09-15','YYYY-mm-dd'),820321);
insert into reserves (sid,bid,day,price) values (2,1,to_date('2017-08-16','YYYY-mm-dd'),821321);
insert into reserves (sid,bid,day,price) values (1,2,to_date('2017-07-17','YYYY-mm-dd'),822321);
insert into reserves (sid,bid,day,price) values (2,4,to_date('2017-06-18','YYYY-mm-dd'),823321);
insert into reserves (sid,bid,day,price) values (1,1,to_date('2017-05-19','YYYY-mm-dd'),824321);
insert into reserves (sid,bid,day,price) values (3,1,to_date('2017-04-20','YYYY-mm-dd'),825321);
insert into reserves (sid,bid,day,price) values (4,1,to_date('2017-03-21','YYYY-mm-dd'),826321);
insert into reserves (sid,bid,day,price) values (5,1,to_date('2017-02-22','YYYY-mm-dd'),827321);
insert into reserves (sid,bid,day,price) values (1,2,to_date('2017-02-23','YYYY-mm-dd'),828321);
insert into reserves (sid,bid,day,price) values (2,2,to_date('2017-01-24','YYYY-mm-dd'),829321);
insert into reserves (sid,bid,day,price) values (3,2,to_date('2017-01-25','YYYY-mm-dd'),830321);
insert into reserves (sid,bid,day,price) values (4,2,to_date('2016-12-26','YYYY-mm-dd'),831321);
insert into reserves (sid,bid,day,price) values (5,2,to_date('2016-11-27','YYYY-mm-dd'),832321);
insert into reserves (sid,bid,day,price) values (1,3,to_date('2016-10-28','YYYY-mm-dd'),833321);
insert into reserves (sid,bid,day,price) values (2,3,to_date('2016-09-29','YYYY-mm-dd'),834321);
insert into reserves (sid,bid,day,price) values (3,3,to_date('2016-08-30','YYYY-mm-dd'),835321);
insert into reserves (sid,bid,day,price) values (4,3,to_date('2016-07-31','YYYY-mm-dd'),836321);
insert into reserves (sid,bid,day,price) values (5,3,to_date('2016-06-01','YYYY-mm-dd'),837321);
insert into reserves (sid,bid,day,price) values (1,4,to_date('2016-05-02','YYYY-mm-dd'),838321);
insert into reserves (sid,bid,day,price) values (2,4,to_date('2016-04-03','YYYY-mm-dd'),839321);
insert into reserves (sid,bid,day,price) values (3,4,to_date('2016-03-04','YYYY-mm-dd'),840321);
insert into reserves (sid,bid,day,price) values (4,4,to_date('2016-11-05','YYYY-mm-dd'),841321);
insert into reserves (sid,bid,day,price) values (5,4,to_date('2016-08-06','YYYY-mm-dd'),842321);
insert into reserves (sid,bid,day,price) values (1,5,to_date('2016-02-07','YYYY-mm-dd'),843321);
insert into reserves (sid,bid,day,price) values (2,5,to_date('2016-01-08','YYYY-mm-dd'),844321);
insert into reserves (sid,bid,day,price) values (3,5,to_date('2016-01-09','YYYY-mm-dd'),845321);
insert into reserves (sid,bid,day,price) values (4,5,to_date('2015-12-10','YYYY-mm-dd'),846321);
insert into reserves (sid,bid,day,price) values (5,5,to_date('2015-12-11','YYYY-mm-dd'),847321);
insert into reserves (sid,bid,day,price) values (1,1,to_date('2015-11-12','YYYY-mm-dd'),848321);
insert into reserves (sid,bid,day,price) values (1,2,to_date('2015-11-13','YYYY-mm-dd'),849321);
insert into reserves (sid,bid,day,price) values (1,3,to_date('2015-10-14','YYYY-mm-dd'),850321);
insert into reserves (sid,bid,day,price) values (1,4,to_date('2015-10-15','YYYY-mm-dd'),851321);
insert into reserves (sid,bid,day,price) values (1,5,to_date('2015-09-16','YYYY-mm-dd'),852321);
insert into reserves (sid,bid,day,price) values (2,1,to_date('2015-09-17','YYYY-mm-dd'),853321);
insert into reserves (sid,bid,day,price) values (2,2,to_date('2015-08-18','YYYY-mm-dd'),854321);
insert into reserves (sid,bid,day,price) values (2,3,to_date('2015-07-19','YYYY-mm-dd'),855321);
insert into reserves (sid,bid,day,price) values (2,4,to_date('2015-06-20','YYYY-mm-dd'),856321);
insert into reserves (sid,bid,day,price) values (2,5,to_date('2015-06-21','YYYY-mm-dd'),857321);
insert into reserves (sid,bid,day,price) values (3,1,to_date('2015-05-22','YYYY-mm-dd'),858321);
insert into reserves (sid,bid,day,price) values (3,2,to_date('2015-02-23','YYYY-mm-dd'),859321);
}
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


/*
5. ¿Qué marinero ha tenido reservas en todos los botes? Liste el nombre.
a. Asegurese que en el resultado aparezcan filas
*/
