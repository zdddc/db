with p as(
    SELECT ProductName,Product.Id
    FROM 'Order'
             INNER JOIN Customer on CustomerId = Customer.Id
             INNER JOIN OrderDetail on 'Order'.Id = OrderDetail.OrderId
             INNER JOIN Product on OrderDetail.ProductId = Product.Id
    where CompanyName = 'Queen Cozinha' AND Date(OrderDate) = '2014-12-25'
),
     c as (
         select row_number() over (order by p.id asc) as seqnum,
                p.ProductName as name
         from p
     ),
     flattened as(
         select seqnum,name as name from c
         where seqnum = 1
         union all
         select c.seqnum,f.name || ',' || c.name
         from c join
              flattened f
              on c.seqnum = f.seqnum + 1
     )
select name from flattened
ORDER BY seqnum Desc limit 1;