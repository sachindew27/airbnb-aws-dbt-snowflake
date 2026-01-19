{% set bedrooms = 1 %}

SELECT * FROM {{ ref('bronze_listings') }}
WHERE bedrooms > {{ bedrooms }}