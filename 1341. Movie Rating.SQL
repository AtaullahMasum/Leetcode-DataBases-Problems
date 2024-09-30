# Write your MySQL query statement below
WITH CTE AS (
    (
        SELECT u.name AS results, COUNT(mr.movie_id) AS movierating
        FROM Users u INNER JOIN MovieRating mr
        ON u.user_id = mr.user_id
        GROUP BY u.user_id
        ORDER BY movierating DESC, results ASC
        LIMIT 1
    )
    UNION ALL
    (
        SELECT m.title AS results, AVG(mr.rating) AS avgRating
        FROM Movies m INNER JOIN MovieRating mr
        ON m.movie_id = mr.movie_id
        WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
        GROUP BY m.movie_id
        ORDER BY avgRating DESC, results ASC
        LIMIT 1
    )
)
SELECT results FROM CTE