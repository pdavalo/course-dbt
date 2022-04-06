{% macro get_distinct_values(model, column) %}

{% set get_distinct_values_query %}
select 
  distinct {{column}}
from 
  {{ model }}
order by 1
{% endset %}

{% set results = run_query(get_distinct_values_query) %}

{% if execute %}
{% set distinct_values = results.columns[0].values() %}
{% else %}
{% set distinct_values = [] %}
{% endif %}

{{ return(distinct_values) }}

{% endmacro %}