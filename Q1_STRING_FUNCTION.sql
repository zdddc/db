select distinct ShipName, subStr(ShipName,0,instr(ShipName,'-')) as PreHyphen from 'Order' where shipname like '%-%' order by ShipName asc;