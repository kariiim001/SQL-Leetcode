-- SOLUTION USING JOINTS
SELECT e1.name
FROM Employee e1
    JOIN Employee e2 ON e1.id = e2.managerId
GROUP BY
    e1.id,
    e1.name
HAVING
    COUNT(e2.id) >= 5;

--SOLUTION USING SUBQUERY
SELECT name
FROM Employee
WHERE
    id IN (
        select managerId
        from Employee
        group by
            managerId
        having
            count(id) > 4
    )