#!/bin/bash

rm -rf ./out
mkdir -p ./out

podman run --log-driver=none --rm registry.redhat.io/openshift4/ztp-site-generate-rhel8:v4.10 extract /home/ztp --tar | tar x -C ./out

oc patch argocd openshift-gitops -n openshift-gitops --type=merge --patch-file ./out/argocd/deployment/argocd-openshift-gitops-patch.json

cp clusters-app.yaml ./out/argocd/deployment/
cp policies-app.yaml ./out/argocd/deployment/

oc apply -k ./out/argocd/deployment

sleep 15

oc get pods -n openshift-gitops

