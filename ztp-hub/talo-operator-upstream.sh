#!/bin/bash

dnf install go -y

rm -rf cluster-group-upgrades-operator
git clone git@github.com:openshift-kni/cluster-group-upgrades-operator.git

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
mv kubectl /usr/local/bin/
chmod +x /usr/local/bin/kubectl

cd cluster-group-upgrades-operator
make deploy

sleep 20

oc get all -n openshift-cluster-group-upgrades

