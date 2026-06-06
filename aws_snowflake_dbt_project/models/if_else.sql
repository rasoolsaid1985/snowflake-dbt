{% set flag = 2 %}

select * from {{ ref('bronze_booking') }}
{% if flag == 1 %}
    where NIGHTS_BOOKED > 2
{% else %}
    where NIGHTS_BOOKED <= 2
{% endif %}