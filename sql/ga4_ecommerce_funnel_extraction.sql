WITH 
-- CTE-1: Parameters and slices captured exclusively at the session start stage (session_start)
session_params AS (
  SELECT
    CONCAT(user_pseudo_id, '-', CAST((SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') AS STRING)) AS user_session_id,
    TIMESTAMP_MICROS(event_timestamp) AS session_start_time,
    (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_location') AS landing_page,
    traffic_source.source AS source,
    traffic_source.medium AS medium,
    traffic_source.name AS campaign,
    device.category AS device_category,
    device.language AS device_language,
    device.operating_system AS device_os
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE event_name = 'session_start'
),

-- CTE-2: Events and funnel step timestamps
funnel_events AS (
  SELECT
    CONCAT(user_pseudo_id, '-', CAST((SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') AS STRING)) AS user_session_id,
    event_name,
    TIMESTAMP_MICROS(event_timestamp) AS event_time
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE event_name IN (
    'session_start',
    'view_item',
    'add_to_cart',
    'begin_checkout',
    'add_shipping_info',
    'add_payment_info',
    'purchase'
  )
)

-- Main query: joining session parameters with funnel events
SELECT
  s.user_session_id,
  s.session_start_time,
  s.landing_page,
  s.source,
  s.medium,
  s.campaign,
  s.device_category,
  s.device_language,
  s.device_os,
  e.event_name,
  e.event_time
FROM session_params s
LEFT JOIN funnel_events e 
  ON s.user_session_id = e.user_session_id;