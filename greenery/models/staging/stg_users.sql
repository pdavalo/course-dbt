SELECT
  user_id,
  first_name,
  last_name,
  email,
  phone_number,
  created_at as user_created_at,
  address_id
from {{source('postgres', 'users')}}