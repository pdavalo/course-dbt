{{ config(materialized='table') }}

SELECT
  user_id,
  first_name,
  last_name,
  email
from {{source('postgres', 'users')}}