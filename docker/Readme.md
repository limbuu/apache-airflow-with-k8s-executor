# Apache Airflow SetUp using Docker
## Apache-Airflow Version 1.10 by Bitnami
To start apache-airflow=1.10, run following command:
```
$ cd bitnami-1.10
$ docker-compose up
```
To check the deployed apache-airflow=1.10 containerized workloads, run:
```
$ docker ps
CONTAINER ID        IMAGE                         COMMAND                  CREATED             STATUS              PORTS                    NAMES
73b68242f955        bitnami/airflow-worker:1      "/app-entrypoint.sh …"   1 minute ago      Up 1 minute       8793/tcp                 bitnami-110_airflow-worker_1
21e0b73b4fff        bitnami/airflow:1-debian-10   "/app-entrypoint.sh …"   1 minute ago      Up 1 minute       0.0.0.0:8080->8080/tcp   bitnami-110_airflow_1
e1e7f3d7b962        bitnami/redis:6.0             "/opt/bitnami/script…"   1 minute ago      Up 1 minute       6379/tcp                 bitnami-110_redis_1
fff911bafea1        bitnami/postgresql:10         "/opt/bitnami/script…"   1 minute ago      Up 1 minute       5432/tcp                 bitnami-110_postgresql_1
c11b74e5f490        bitnami/airflow-scheduler:1   "/app-entrypoint.sh …"   1 minute ago      Up 1 minutes                                bitnami-110_airflow-scheduler_1
```

Now, access the apache-airflow `web-ui` at `http://localhost:8080`.
Use default `username:user` and `password:bitnami123` to access airflow.

To stop and then remove the apache-airflow container workloads, run following:
```
$ docker-compose stop
$ docker-compose down
```

## Apache-Airflow Version 2.0 by Bitnami

To start apache-airflow=2.10, run following command:
```
$ cd bitnami-2.0
$ docker-compose up
```
To check the deployed apache-airflow=1.10 containerized workloads, run:
```
$ docker ps
CONTAINER ID        IMAGE                         COMMAND                  CREATED             STATUS              PORTS                    NAMES
d3990a625e58        bitnami/airflow-worker:2      "/app-entrypoint.sh …"   9 seconds ago       Up 4 seconds        8793/tcp                 bitnami-20_airflow-worker_1
9ec3f31780dd        bitnami/airflow:2-debian-10   "/app-entrypoint.sh …"   9 seconds ago       Up 6 seconds        0.0.0.0:8080->8080/tcp   bitnami-20_airflow_1
2b9247cf4aac        bitnami/airflow-scheduler:2   "/app-entrypoint.sh …"   9 seconds ago       Up 4 seconds                                 bitnami-20_airflow-scheduler_1
6693ff8288bb        bitnami/postgresql:10         "/opt/bitnami/script…"   9 seconds ago       Up 5 seconds        5432/tcp                 bitnami-20_postgresql_1
0f2a584fb3d0        bitnami/redis:6.0             "/opt/bitnami/script…"   9 seconds ago       Up 6 seconds        6379/tcp                 bitnami-20_redis_1
```

Now, access the apache-airflow `web-ui` at `http://localhost:8080`.
Use default `username:user` and `password:bitnami123` to access airflow.

To stop and then remove the apache-airflow container workloads, run following:
```
$ docker-compose stop
$ docker-compose down
```