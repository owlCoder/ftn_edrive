select idv, imev, prezv from vozac order by imev asc; --1

select idv, imev, prezv, godrodj from vozac
where godrodj between 1970 and 1985; --2


alter table drzava 
add(BROJSTAN integer default null); -- ili is null --3

select* from drzava;

select distinct ids, nazivs, drzs, nazivd
from staza s, drzava d, rezultat r
where s.ids = r.stazar and s.drzs = d.idd 
and zavrsio = 'N' and
r.maksbrzina > (select avg(maksbrzina) from rezultat); --4


--5

select nazivs, nazivd, imev, prezv, (select nazivd from drzava  where v.drzv = idd) as drzt
from staza s, drzava d, vozac v, rezultat r
where v.idv = r.vozacr and s.ids = r.stazar and s.drzs = d.idd 
and 
r.sezona = 2019;


--6
select nazivs
from vozac v, staza s, rezultat r
where v.idv = r.vozacr and s.ids = r.stazar and
prezv in (select prezv from vozac where prezv='Raikkonen')
and prezv not in (select prezv from vozac where prezv='Vettel')
and s.ids not in (select stazar from rezultat where vozacr = 
        (select idv from vozac where prezv = 'Vettel'));
        

(select nazivs
from vozac v, staza s, rezultat r
where v.idv = r.vozacr and s.ids = r.stazar and
prezv in (select prezv from vozac where prezv='Raikkonen'))
minus
(select nazivs
from vozac v, staza s, rezultat r
where v.idv = r.vozacr and s.ids = r.stazar and
prezv in (select prezv from vozac where prezv='Vettel'));


--7
select  ids, avg(nvl(maksbrzina, 0)) from
(select *
from staza s left outer join rezultat r
on r.stazar = s.ids)
group by ids
having avg(nvl(maksbrzina, 0)) < 350;



select  ids, avg(nvl(maksbrzina, 0)) from
(select *
from staza s, rezultat r
where r.stazar(+) = s.ids)
group by ids
having avg(nvl(maksbrzina, 0)) < 350;

--8


update vozac set prezv = 
substr(prezv, 1, length(prezv)-1) ||
upper(substr(prezv, length(prezv),1));


select imev, prezv from vozac;

--9

create or replace view Pogled_Vozac_Pobede as
(select idv, imev, prezv
from vozac v, rezultat r
where v.idv(+) = r.vozacr and 
plasman = 1 and
godrodj < 1986);

select * from Pogled_Vozac_Pobede;

--10
select * from
((select imev, prezv, nvl(nvl(round(maksbrzina, 2), 0)*0.62 || ' mp/h', '0 -') as "jedinica" 
from vozac v, rezultat r
where v.idv(+) = r.vozacr
and maksbrzina = (select max(nvl(maksbrzina, 0)) from rezultat where vozacr = v.idv)
and v.drzv in (select idd from drzava where nazivd in('Germany', 'Great Britain')))
union
(select imev, prezv, nvl(nvl(round(maksbrzina, 2), 0) || ' km/h', '0 -') as "jedinica"
from vozac v, rezultat r
where v.idv(+) = r.vozacr
and maksbrzina = (select max(nvl(maksbrzina, 0)) from rezultat where vozacr = v.idv)
and v.drzv not in (select idd from drzava where nazivd in('Germany', 'Great Britain'))))
order by imev desc;









