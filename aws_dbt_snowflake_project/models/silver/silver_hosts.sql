{{ 
  config(
    materialized = 'incremental',
    unique_key = 'HOST_ID',
    )
}}

SELECT
    HOST_ID,
    REPLACE(HOST_NAME, ' ', '_') AS HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    RESPONSE_RATE,
    CREATED_AT
FROM {{ ref('bronze_hosts') }}
{% if is_incremental() %}
  where CREATED_AT > (select max(CREATED_AT) from {{ this }})
{% endif %}
