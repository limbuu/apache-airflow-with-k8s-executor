
# Apache Airflow SetUp in Minikube 
## Using Helm
### Prequesties
* minikube: `minikube` is a tool that creates a single node(Virtual Machine) Kubernetes cluster on your computer using VirtualBox or Docker. To install minikube follow this [link.](https://minikube.sigs.k8s.io/docs/start/)

* kubectl: `kubectl` is a CLI tool that can be used to deploy applications, inspect and manage cluster resources and view logs. To installl kubectl follow this [link.](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

* docker: `docker` is an open source containerization technology for building and containerizing your applications.We will
 use docker as VM driver for minikube. To install docker follow this [link.](https://docs.docker.com/engine/install/ubuntu/)

* helm: `helm` is a package manager for Kubernetes that packages multiple Kubernetes resources into single logical deployment unit call `Chart`. To install `helm` follow this [link.](https://helm.sh/docs/intro/install/)

### Start Minikube 
First start minikube in seprate profile and cluster as:
```
$ minikube start -p airflow-cluster
```

### Add Airflow Helm Charts Repo
Then, add the helm chart repo of apache airflow from Bitnami.
```
$ helm repo add bitnami https://charts.bitnami.com/bitnami
```

### Install Apache Airflow
Now, deploy apache-airflow and to get your DAG files from a Git Repository at deployment time, replce REPOSITORY_URL with your github repository. 

Before installing apache-airflow, export secrets and other dependent values:
```
## export one by one :
$ export AIRFLOW_PASSWORD=$(kubectl get secret --namespace default airflow -o jsonpath="{.data.airflow-password}" | base64 --decode)
$ export AIRFLOW_FERNETKEY=$(kubectl get secret --namespace default airflow -o jsonpath="{.data.airflow-fernetKey}" | base64 --decode)
$ export POSTGRESQL_PASSWORD=$(kubectl get secret --namespace default airflow-postgresql -o jsonpath="{.data.postgresql-password}" | base64 --decode)
$ export REDIS_PASSWORD=$(kubectl get secret --namespace default airflow-redis -o jsonpath="{.data.redis-password}" | base64 --decode)
$ export POSTGRESQL_PVC=$(kubectl get pvc -l app.kubernetes.io/instance=airflow,app.kubernetes.io/name=postgresql -o jsonpath="{.items[0].metadata.name}")

## export using scrit(alternative):
$ chmod +x export-secrets.sh
$ ./export-secrets.sh
```

```
$ helm install airflow bitnami/airflow \
    --set loadExamples=true \
    --set web.baseUrl=http://127.0.0.1:8080 \
    --set auth.password=$AIRFLOW_PASSWORD \
    --set auth.fernetKey=$AIRFLOW_FERNETKEY \
    --set postgresql.postgresqlPassword=$POSTGRESQL_PASSWORD \
    --set postgresql.persistence.existingClaim=$POSTGRESQL_PVC \
    --set redis.password=$REDIS_PASSWORD \
    --set redis.cluster.enabled=true
```
### Access Apache Airflow at Localhost

To access aiflow at `http://localhost:8080` or `http://127.0.0.1:8080`,run following command:
```
$ kubectl port-forward --namespace default svc/airflow 8080:8080

## If there is port-forwarding issue, use this command instead:
$ kubectl port-forward --namespace default deploy/airflow-web 8080:8080
```
For username use `user` and for passowrd, run following commands:
```
$ export AIRFLOW_PASSWORD=$(kubectl get secret --namespace "default" myrelease-airflow -o jsonpath="{.data.airflow-password}" | base64 --decode)
$ echo $AIRFLOW_PASSWORD
```

### Clean Up
To uninstall/delete the airflow deployment:
```
$ helm ls --n default
$ helm delete -n default airflow

## If failed to complelete delete all the workloads:
$ kubectl delete pods --all 
$ kubectl delete svc --all
$ kubectl delete deploy --all
$ kubectl delete pv,pvc --all
```
## Useful Links 
* [Apache Airflow Helm Chart Documentation](https://github.com/bitnami/charts/tree/master/bitnami/airflow/#installing-the-chart)



