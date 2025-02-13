/* Write your T-SQL query statement below */
SELECT ip, COUNT(ip) AS invalid_count
FROM logs
WHERE
    ip LIKE '%[3-9][0-9][0-9]%' OR
    ip LIKE '%2[6-9][0-9]%' OR
    ip LIKE '%25[6-9]%'

    OR
    ip LIKE '%[^0-9]0[0-9]%'

    OR
    LEN(ip) - LEN(REPLACE(ip, '.', '')) != 3
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;
