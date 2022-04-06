SELECT
  {{ dbt_utils.star(from = source('postgres', 'users'), except = ["updated_at", "created_at"]) }},
  created_at as user_created_at
from {{source('postgres', 'users')}}