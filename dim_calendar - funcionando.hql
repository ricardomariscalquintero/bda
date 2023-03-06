
set hivevar:start_date=2010-01-01;
set hivevar:days=10000;
set hivevar:table_name=dim_date;

CREATE TABLE IF NOT EXISTS ${table_name} AS
WITH dates AS (
    SELECT date_add("${start_date}", a.pos) as `date`
    FROM (SELECT posexplode(split(repeat(",", ${days}), ","))) a
),
dates_expanded AS (
  SELECT
    `date`,
    year(`date`) as year,
    month(`date`) as month,
    day(`date`) as day,
    date_format(`date`, 'u') as day_of_week
  FROM dates
)
SELECT
    `date`,
    year,
    cast(month(`date`)/4 + 1 AS BIGINT) as quarter,
    month,
    date_format(`date`, 'W') as week_of_month, 
    date_format(`date`, 'w') as week_of_year,
    day,
    day_of_week,
    date_format(`date`, 'EEE') as day_of_week_s, 
    date_format(`date`, 'D') as day_of_year, 
    datediff(`date`, "1970-01-01") as day_of_epoch,
    if(day_of_week BETWEEN 6 AND 7, true, false) as weekend
FROM dates_expanded
SORT BY `date`;