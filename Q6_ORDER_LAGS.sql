select Id,
       OrderDate,
       PrevOrderDate,
       round(julianday(OrderDate) - julianday(PrevOrderDate),2)
from (
         select Id,
                OrderDate,
                LAG(OrderDate,1,OrderDate)
                    OVER (order by OrderDate asc) as PrevOrderDate
         from 'Order'
         where CustomerId = 'BLONP'
         Order by OrderDate asc
         LIMIT 10
     )