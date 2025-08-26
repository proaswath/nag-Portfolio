# Data Engineering Portfolio — Nagendra Panduranga

This repository showcases hands-on projects aligned to my resume: **ETL pipelines, SQL optimization, data migration, API integrations, data quality, and cloud-ready workflows**.
Each project includes a clear README with problem statement, architecture, instructions, and sample data.

> Designed to be **tech-light (ETL/SQL/Cloud)** and recruiter-friendly.


## How to Use

1. **Create a virtual env & install deps**
```bash
python -m venv .venv && source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

2. **Explore projects**
- `projects/postgres-to-mysql-migration` — DB migration with reconciliation
- `projects/erp-to-salesforce-migration` — Mapping + validation for FinancialForce
- `projects/csv-to-warehouse-etl` — Load CSV to staging/warehouse
- `projects/data-quality-framework` — YAML-driven data quality checks
- `projects/api-to-db-ingestion` — ETL from REST API to DB

3. **Run smoke checks locally**
```bash
python projects/postgres-to-mysql-migration/migrate_pg_to_mysql.py -h
python projects/csv-to-warehouse-etl/load_csv_to_db.py -h
python projects/data-quality-framework/dq_check.py -h
python projects/api-to-db-ingestion/api_to_db.py -h
```

4. **CI**
A minimal GitHub Actions workflow (`.github/workflows/ci.yml`) compiles Python and prints file inventory.
