select ProductName,CompanyName,ContactName from
    (select ProductName,min(OrderDate),CompanyName,ContactName from
        (select Id,ProductName
         from  Product
         where Discontinued = 1
        )as P
            join OrderDetail as OD on OD.ProductId = P.Id
            join 'Order' as O on O.Id = OD.OrderId
            join Customer as C on C.Id = O.CustomerId
     group by ProductName
    ) as T
Order by ProductName asc;