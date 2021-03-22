
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

```
$ helm install myrelease bitnami/airflow \
--set airflow.cloneDagFilesFromGit.enabled=true \
--set airflow.cloneDagFilesFromGit.repository=REPOSITORY_URL \
--set airflow.cloneDagFilesFromGit.branch=master \
--set airflow.baseUrl=http://127.0.0.1:8080
```
### Access Apache Airflow at Localhost

To access aiflow at `http://localhost:8080` or `http://127.0.0.1:8080`,run following command:
```
$ kubectl port-forward --namespace default svc/myrelease-airflow 8080:8080
```
For username use `user` and for passowrd, run following commands:
```
$ export AIRFLOW_PASSWORD=$(kubectl get secret --namespace "default" myrelease-airflow -o jsonpath="{.data.airflow-password}" | base64 --decode)
$ echo $AIRFLOW_PASSWORD
```



