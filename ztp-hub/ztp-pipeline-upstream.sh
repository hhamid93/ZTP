#!/bin/bash

rm -rf cnf-features-deploy
git clone git@github.com:openshift-kni/cnf-features-deploy.git

oc patch argocd openshift-gitops -n openshift-gitops --type=merge --patch-file ./cnf-features-deploy/ztp/gitops-subscriptions/argocd/deployment/argocd-openshift-gitops-patch.json

cp clusters-app.yaml ./cnf-features-deploy/ztp/gitops-subscriptions/argocd/deployment/
cp policies-app.yaml ./cnf-features-deploy/ztp/gitops-subscriptions/argocd/deployment/

oc apply -k ./cnf-features-deploy/ztp/gitops-subscriptions/argocd/deployment/