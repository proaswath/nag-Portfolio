SHELL := /bin/bash

.PHONY: help venv install smoke migrate_csv dq api_demo

help:
	@echo "Available targets:"
	@echo "  venv        - Create python virtual environment"
	@echo "  install     - Install Python dependencies"
	@echo "  smoke       - Run quick script help checks"
	@echo "  migrate_csv - Load sample CSV to local SQLite (demo)"
	@echo "  dq          - Run data quality demo on sample data"
	@echo "  api_demo    - Run API->DB ingestion with placeholder URL"

venv:
	python -m venv .venv

install:
	. .venv/bin/activate && pip install -r requirements.txt

smoke:
	python projects/postgres-to-mysql-migration/migrate_pg_to_mysql.py -h || true
	python projects/csv-to-warehouse-etl/load_csv_to_db.py -h || true
	python projects/data-quality-framework/dq_check.py -h || true
	python projects/api-to-db-ingestion/api_to_db.py -h || true

migrate_csv:
	python projects/csv-to-warehouse-etl/load_csv_to_db.py \
		--db-url sqlite:///stage.db \
		--csv projects/csv-to-warehouse-etl/sample_data/customers.csv \
		--table stage_customers

dq:
	python projects/data-quality-framework/dq_check.py \
		--csv projects/data-quality-framework/sample_data/orders.csv \
		--rules projects/data-quality-framework/dq_rules.yml

api_demo:
	python projects/api-to-db-ingestion/api_to_db.py \
		--api-url https://example.com/api/v1/items \
		--db-url sqlite:///api.db \
		--table items || true
