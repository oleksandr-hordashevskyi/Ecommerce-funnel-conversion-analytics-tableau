# 📊 Dataset Information & Data Dictionary

The dataset used in this project is extracted from the public Google Analytics 4 sample e-commerce database hosted on **Google BigQuery** (`bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`).

## 🗄 Extraction Scope
* **Extraction Period:** November 1, 2020 – January 31, 2021
* **Source Records Processed:** 867,735 raw event logs
* **Aggregated Volume:** 354,857 distinct user sessions and 4,745 completed purchase events.
* **Extraction Query:** Available in [`sql/ga4_ecommerce_funnel_extraction.sql`](../sql/ga4_ecommerce_funnel_extraction.sql).

---

## 📋 Schema & Field Definitions

| Field Name | Type | Description |
| :--- | :--- | :--- |
| `user_session_id` | STRING | Composite unique identifier (`user_pseudo_id` + `ga_session_id`). |
| `session_start_time` | TIMESTAMP | Exact timestamp when the user initiated the session. |
| `landing_page` | STRING | Full URL location of the first landing page of the session. |
| `source` | STRING | Marketing traffic source (e.g., `google`, `direct`, `youtube.com`). |
| `medium` | STRING | Acquisition channel medium (e.g., `organic`, `cpc`, `referral`). |
| `campaign` | STRING | Marketing campaign identifier/name. |
| `device_category` | STRING | Device form factor (`desktop`, `mobile`, `tablet`). |
| `device_language` | STRING | User device system language locale (e.g., `en-us`, `de`). |
| `device_os` | STRING | Operating system of the device (`Web`, `iOS`, `Windows`, `Android`, `Macintosh`). |
| `event_name` | STRING | Name of the e-commerce funnel step event. |
| `event_time` | TIMESTAMP | Timestamp of the specific funnel event. |

> **Note on Data Availability:** Due to GitHub's file size constraints (>25MB), the raw 170MB export is omitted. The data can be replicated directly using the SQL extraction script in BigQuery.
