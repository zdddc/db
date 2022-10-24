select CategoryName,
       count(*) as CategoryCount,
       round(avg(UnitPrice),2),
       min(UnitPrice) AS MinUnitPrice,
       max(UnitPrice) AS MaxUnitPrice,
       sum(UnitsOnOrder) AS TotalUnitsOnOrder
from Product
         INNER JOIN Category on Product.CategoryId = Category.Id
group by CategoryId
HAVING CategoryCount > 10
Order BY CategoryId;