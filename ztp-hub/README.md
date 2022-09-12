Repo to setup ZTP hub instance

## Assisted Installer Service

Assisted Installer Service (AIS) deploys OpenShift Container Platform clusters. Red Hat Advanced Cluster Management (RHACM) ships with AIS. AIS is deployed when you enable the MultiClusterHub Operator on the RHACM hub cluster.

Procedures to install AIS:
- Install OCP cluster as hub cluster
- RHACM requires a storage solution, we chose OpenShift Local Storage Operator
- Install RHACM and create MultiClusterHub instance

### Local Storage Operator

```shell
./local-storage-operator.sh
```
### RHACM Operator and MultiClusterHub instance

```shell
./rhacm-operator.sh
./rhacm-hub-instance.sh
```

## ZTP and ZTP Pipeline

Next we will install ZTP setup ZTP pipeline.

### OpenShift GitOps Operator

```shell
./gitops-operator.sh
```

### TALM Operator

We will install TALM ([Topology Aware Lifecycle Manager]((https://docs.openshift.com/container-platform/4.10/scalability_and_performance/cnf-talm-for-cluster-upgrades.html))) operator on the cluster.

```shell
./talm-operator.sh
```

### ZTP Pipeline

We will install ZTP 4.10 Pipeline on the cluster.

```shell
./ztp-pipeline.sh
```

This will create 2 ArgoCD applications: [ztp-app-project](clusters-app.yaml) and [policy-app-project](policies-app.yaml). And GitOps will take over the cluster provisioning and policies enforcement based on the changes in git [repo](../ztp-spokes). 

## ArgoCD Repository Credential

In order to make sure ArgoCD can access to the git repo (github in this case), we need to set the credential on ArgoCD console:

(TBD)Find a way to automate the process below:

- Generate SSH key pairs
    
    ```shell
    ssh-keygen -t ed25519 -C "my github repo"
    ```
  
- Put public key on github repo as 'deploy' key
    ```shell
    cat /root/.ssh/id_ed25519.pub
    ```
- Save private key on ArgoCD repository

    ```shell
    cat /root/.ssh/id_ed25519
    ```

