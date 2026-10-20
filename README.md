# 🛒 E-Commerce Funnel & Conversion Intelligence Dashboard

[![Tableau Public](https://img.shields.io/badge/Tableau_Public-Interactive_Dashboard-E97627?logo=tableau&logoColor=white)](https://public.tableau.com/views/EcommerceFunnelOverview/EcommerceFunnelOverview)
[![Google BigQuery](https://img.shields.io/badge/Google_BigQuery-GA4_SQL_Pipeline-669DF6?logo=googlecloud&logoColor=white)](sql/ga4_ecommerce_funnel_extraction.sql)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 📌 Executive Summary
An end-to-end E-Commerce funnel optimization and conversion intelligence solution analyzing user behavior and checkout drop-offs across a multi-stage customer journey. Built on raw Google Analytics 4 (GA4) event logs in **Google BigQuery** (867,735 records) and visualized via **Tableau Desktop / Tableau Public**, the dashboard provides marketing and product stakeholders with granular visibility into drop-off friction, acquisition channel efficiency, and landing page conversion power.

* **Live Interactive Dashboard:** [Tableau Public Report](https://public.tableau.com/views/EcommerceFunnelOverview/EcommerceFunnelOverview)
* **Dataset Scope:** 867,735 raw event logs consolidated into 354,857 distinct user sessions and 4,745 completed purchases across November 2020 – January 2021.

---

## 📊 Visualizations & Dashboard Overview

![Ecommerce Funnel Overview](images/01_ecommerce_funnel_dashboard.png)

---

## 🛠 Technical Architecture & Pipeline

* **Data Engineering & Extraction Layer (Google BigQuery):**
  * Extracted and aggregated 867k+ raw nested GA4 event logs partitioned across user sessions (`user_session_id`).
  * Structured chronological e-commerce event taxonomies: `session_start` ➔ `view_item` ➔ `add_to_cart` ➔ `begin_checkout` ➔ `add_shipping_info` ➔ `add_payment_info` ➔ `purchase`.
  * Sanitized dirty dimensional parameters: normalized null device languages into explicit categories and stripped varying domain prefixes (`shop.googlemerchandisestore.com`, `www.`, HTTP/HTTPS protocols) from landing page paths.
* **BI & Semantic Modeling Layer (Tableau):**
  * **Symmetrical Dual-Axis Funnel:** Engineered a bidirectional bar chart (`AGG(Sessions Count)` copied to Columns with left-axis `Reversed`), allowing concurrent reading of absolute visitor volume on the left and dynamic conversion efficiency (%) relative to initial sessions on the right.
  * **Ratio & Label Calculations:** Built non-additive Calculated Fields (`[Conversion Rate] = 1.34%`) and managed directional Table Calculation addressing across the funnel journey.
  * **UI & Visual Best Practices:** Applied Modern Card UI principles, zero-line grid cleaning, 100% white sheet contrast, and streamlined horizontal layouts preserving full readability of source strings and landing page categorizations without truncated text labels.
  * **Interactive Slice & Dice:** Implemented multi-select dimensional parameters (`Date Range`, `Landing Page`, `Traffic Source`, `Medium`, `Campaign`, `Device Category`, `OS`, `Language`) with global broadcast across all visual layers (`All Using This Data Source`).

---

## 📈 Key Business Findings

* **Overall Conversion Efficiency:** Out of **354,857 sessions**, **4,745 resulted in purchases**, establishing a baseline blended conversion rate of **1.34%**.
* **Primary Journey Drop-Offs:**
  * **Top-of-Funnel Drop:** The largest traffic loss occurs immediately after discovery — only **21.21%** of sessions advance from `Session Start` to `View Item` (a **78.79%** discovery drop-off).
  * **Consideration-to-Intent Drop:** An additional sharp contraction happens between item evaluation and cart addition: only **4.20%** of initial sessions add items to cart (`Add to Cart`).
* **Checkout Micro-Conversion Resilience:** Once a customer reaches checkout (`Begin Checkout` at **3.06%**), intent remains exceptionally sticky through payment (`Add Payment Info` at **1.88%**), with a **43.8%** finalization rate into `Purchase` (**1.34%**).
* **Traffic Driver Attribution:** Organic search (`Google Organic` with 111,488 sessions) and direct entry (`Direct` with 82,362 sessions) dominate total volume, delivering predictable high-intent conversion volume.
* **Landing Page Concentration:** `Home Page` accounts for **159,190 sessions** (>44% of total traffic), followed by `Apparel` (40k) and `Brand: YouTube` merchandise (24k).

---

## 💡 Strategic Recommendations

1. **Mid-Funnel Recommendation Engines:** Implement personalized recommendations and social proof on high-bounce catalog pages (`Home Page` and `Apparel`) to increase transition from browsing to `View Item` and `Add to Cart`.
2. **Checkout Friction Removal:** Since cart abandonment accounts for significant drop-off between `Add to Cart` (14.9k) and `Begin Checkout` (10.8k), deploy exit-intent promo prompts and 1-click cart drawers.
3. **Channel-Specific Landing Strategy:** Direct paid campaigns (`Google CPC`) specifically to high-converting subcategory landing pages rather than the generic root `Home Page`.

---

## 🗂 Project Structure & Deliverables

```text
Ecommerce-funnel-conversion-analytics-tableau/
├── LICENSE
├── README.md
├── dashboards/
│   └── Ecommerce Funnel Overview.twb          # Tableau Workbook file
├── sql/
│   └── ga4_ecommerce_funnel_extraction.sql    # BigQuery extraction SQL
├── data/
│   └── README.md                              # Data dictionary & schemas
└── images/
    └── 01_ecommerce_funnel_dashboard.png      # High-resolution dashboard view

```
---
## ✉️ Contact

**Author:** Oleksandr Hordashevskyi

- LinkedIn: [Oleksandr Hordashevskyi](https://www.linkedin.com/in/oleksandr-hordashevskyi)
- Email: [o.hordashevskyi@gmail.com](mailto:o.hordashevskyi@gmail.com)
