/*
Primera Entrega: Bases de datos
Grupo: 4
Nombres: David Palacios, Sebastián Vergara, Nicolás Sánchez, Maria Camila Paternina, Paula Peñuela
*/

--CREACI�N DE TABLAS
--TABLA SAILORS
drop table sailors;
create table sailors(
    sid number(1,10) generated always as identity primary key,
    sname varchar2(30) not null, --Nombre marinero
    email varchar2(30) unique not null, --Email
    age int not null check (age between 0 and 150),
    gender char not null check(gender ='F' or gender ='M')
);
grant select on sailors to jcarreno;

--TABLA BOATS
drop table boats;
create table boats(
    bid number(1,10) generated always as identity primary key,
    bname varchar(30) unique not null, --Nombre bote
    color varchar(20) not null
);
grant select on boats to jcarreno;

--TABLA RESERVES
drop table reserves;
create table reserves(
    sid int not null,
    bid int not null,
    day date not null,
    price numeric default 0 check(price>=0) not null,
    primary key (sid,bid,day),
    foreign key (sid) references sailors(sid),
    foreign key (bid) references boats(bid)
);
grant select on reserves to jcarreno;

