Method 1:
SELECT name FROM Employee 
WHERE id  IN (SELECT managerId FROM Employee GROUP BY managerId HAVING COUNT(*)>=5 )
Method 2:
SELECT e.name FROM Employee e 
JOIN Employee m
ON e.id = m.managerId 
GROUP BY m.managerId
HAVING COUNT(*) >= 5