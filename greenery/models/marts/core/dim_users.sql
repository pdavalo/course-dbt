select 
    user_id,
    first_name,
    last_name,
    email,
    phone_number,
    user_created_at,
    users.address_id,
    address, 
    zipcode, 
    state, 
    country
from 
    {{ref('stg_users')}} users left join 
    {{ref('stg_addresses')}} addresses on users.address_id = addresses.address_id