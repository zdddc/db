select distinct Shipper.CompanyName,DelayRate
from 'Order',
     (select D.ShipVia,D.late,C.cnt,round((D.late * 1.0/C.cnt)*100,2) as DelayRate
      from
          (select ShipVia,count(Id) as late
           from 'Order'
           where ShippedDate > RequiredDate
           group by ShipVia)
              as D, (select ShipVia,count(Id) as cnt from 'Order' group by ShipVia) as C
      where D.ShipVia = C.ShipVia
     )as Res
        ,Shipper
where Shipper.Id = 'Order'.ShipVia and Res.ShipVia = 'Order'.ShipVia
order by DelayRate desc;