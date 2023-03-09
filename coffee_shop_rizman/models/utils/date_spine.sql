with generated as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2021-01-01' as date)",
        end_date="cast('2021-06-30' as date)"
    ) }}
)

select
    cast(date_day as timestamp) as date_day
from generated