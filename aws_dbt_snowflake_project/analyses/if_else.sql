{% set cols = ['LISTING_ID', 'HOST_ID', 'BEDROOMS'] %}

SELECT
{% for col in cols %}
    {{ col }}
    {% if not loop.last %}, {% endif %}
{% endfor %}

FROM {{ ref('bronze_listings') }}