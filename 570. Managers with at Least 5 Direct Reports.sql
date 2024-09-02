Method 1:
SELECT name FROM Employee 
WHERE id  IN (SELECT managerId FROM Employee GROUP BY managerId HAVING COUNT(*)>=5 )
Method 2:
