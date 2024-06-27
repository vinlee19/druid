SELECT *
    FROM
    ( SELECT MAX(c7) OVER W as sm
      FROM "t_alltype.parquet"
          WINDOW W AS ( PARTITION BY c8 ORDER BY c1 RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING )
    ) subQry
WHERE subQry.sm > TIMESTAMP_TO_MILLIS(TIME_PARSE('1984-11-10', 'yyyy-MM-dd'))
