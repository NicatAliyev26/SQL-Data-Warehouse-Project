# SQL Data Warehouse from Scratch: End-to-End Data Engineering Project

A professional, hands-on data engineering project demonstrating how to architect and implement a modern SQL Data Warehouse from scratch using Microsoft SQL Server. This repository showcases the pipeline design, data quality frameworks, and dimensional data modeling applied to disparate corporate CRM and ERP data sources.

---

## Project Description & Business Context

In modern corporate environments, data is frequently trapped in department-specific silos, leading to fragmented reporting, operational inefficiencies, and conflicting metrics. This project addresses a classic enterprise challenge: a growing company whose critical operations are divided across two legacy platforms:
1. **A CRM System:** Tracking core customer profiles, primary product data, and sales transactions.
2. **An ERP System:** Handling backend operations, including detailed customer demographics, geographical locations, and product category catalogs.

Because these systems operate independently, they suffer from data quality issues, inconsistent naming formats, missing historical records, and structural anomalies. 

### Core Objectives
The primary goal of this project is to design, automate, and implement a robust, centralized **SQL Data Warehouse** using Microsoft SQL Server to merge these disparate data streams into a single, high-performance analytical environment. 

The project achieves this through four distinct operational milestones:
* **Data Ingestion Automation:** Establishing a high-speed Bronze ingestion pipeline to capture raw source data securely using bulk insertion techniques.
* **Data Cleansing Quality Gate:** Enforcing a rigorous Silver transformation layer to standardize text string data, correct historical timeline overlaps, cast invalid data types, and purge duplicate entries.
* **Enterprise Integration:** Merging isolated cross-system profiles (such as CRM customer keys and ERP location markers) into a single, comprehensive customer profile based on master data priority rules.
* **Dimensional Modeling:** Structuring a business-ready Gold layer using an optimized **Star Schema** model. This provides clean, decoupled Fact and Dimension views that allow business intelligence tools (like Power BI) to execute sub-second analytical queries without complex processing.

---

## 🛠️ Tech Stack & Architecture Approach
* **Database Engine:** Microsoft SQL Server (Express Edition)
* **Database IDE:** SQL Server Management Studio (SSMS)
* **Version Control:** Git & GitHub
* **Data Architecture:** Medallion Layering (Bronze => Silver => Gold) using the **Separation of Concerns (SoC)** principle.

### 📐 Data Architecture Blueprint

```text
[ CRM Systems (CSV) ] ---\     +-------------------------------------------------------------+     [ Analytical Tools ]
                          |---> | Bronze Schema (Raw Data Tables / Bulk Insert / Full Load)  | --> [ Power BI / Tableau ]
[ ERP Systems (CSV) ] ---/     +-------------------------------------------------------------+                   ^
                                                              |                                                  |
                                                       (Data Cleansing)                                          |
                                                              v                                                  |
                               +-------------------------------------------------------------+                   |
                               | Silver Schema (Standardized Tables / Metadata Enrichment)    |                  |
                               +-------------------------------------------------------------+                   |
                                                              |                                                  |
                                                     (Business Logic & Lookups)                                  |
                                                              v                                                  |
                               +-------------------------------------------------------------+                   |
                               | Gold Schema (Star Schema Views / Fact & Dimension Models)   | ------------------/
                               +-------------------------------------------------------------+
