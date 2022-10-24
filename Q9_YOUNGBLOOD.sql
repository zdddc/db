SELECT RegionDescription, FirstName, LastName, bday
FROM
    (
        SELECT RegionId  AS rid,EmployeeId,FirstName,LastName,Birthdate,MAX(Employee.Birthdate) AS bday
        FROM Employee
                 INNER JOIN EmployeeTerritory ON Employee.Id = EmployeeTerritory.EmployeeId
                 INNER JOIN Territory ON TerritoryId = Territory.Id
        GROUP BY RegionId
    )
        INNER JOIN Region ON Region.Id = rid
GROUP BY EmployeeId
ORDER BY rid;