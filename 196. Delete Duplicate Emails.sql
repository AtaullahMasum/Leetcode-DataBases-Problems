WITH duplicate AS (
    SELECT MIN(id) AS id
    FROM Person
    GROUP BY email
)
DELETE  FROM Person 
WHERE id NOT IN (SELECT id FROM duplicate)

# Solution 2
DELETE p1 
FROM Person p1
JOIN Person p2
WHERE p1.email = p2.email AND p1.id > p2.id
