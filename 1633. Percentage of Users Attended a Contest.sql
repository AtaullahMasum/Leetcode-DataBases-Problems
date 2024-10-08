Method 1:
SELECT 
    r.contest_id, 
    ROUND(COUNT(DISTINCT r.user_id) * 100.0 / (SELECT COUNT(DISTINCT user_id) FROM Users), 2) AS percentage
FROM 
    Register r
GROUP BY 
    r.contest_id
ORDER BY 
    percentage DESC, 
    r.contest_id ASC;

Method 2:
SELECT r.contest_id , ROUND((COUNT(DISTINCT r.user_id))/(SELECT COUNT(DISTINCT user_id) FROM Users)*100, 2) AS percentage
FROM Users u 
JOIN Register r
ON u.user_id = r.user_id
GROUP BY contest_id
ORDER BY percentage DESC, r.contest_id ASC

