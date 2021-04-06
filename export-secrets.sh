#!/bin/bash
export AIRFLOW_PASSWORD=$(kubectl get secret --namespace default airflow -o jsonpath="{.data.airflow-password}" | base64 --decode)
export AIRFLOW_FERNETKEY=$(kubectl get secret --namespace default airflow -o jsonpath="{.data.airflow-fernetKey}" | base64 --decode)
export POSTGRESQL_PASSWORD=$(kubectl get secret --namespace default airflow-postgresql -o jsonpath="{.data.postgresql-password}" | base64 --decode)
export REDIS_PASSWORD=$(kubectl get secret --namespace default airflow-redis -o jsonpath="{.data.redis-password}" | base64 --decode)
export POSTGRESQL_PVC=$(kubectl get pvc -l app.kubernetes.io/instance=airflow,app.kubernetes.io/name=postgresql -o jsonpath="{.items[0].metadata.name}")
