#!/bin/bash

#oc patch hiveconfig hive --type merge -p '{"spec":{"targetNamespace":"hive","logLevel":"debug","featureGates":{"custom":{"enabled":["AlphaAgentInstallStrategy"]},"featureSet":"Custom"}}}'

oc patch provisioning provisioning-configuration --type merge -p '{"spec":{"watchAllNamespaces": true }}'

cat <<EOF | oc apply -f -
apiVersion: agent-install.openshift.io/v1beta1
kind: AgentServiceConfig
metadata:
  name: agent
  namespace: open-cluster-management
spec:
  databaseStorage:
    accessModes:
      - ReadWriteOnce
    resources:
      requests:
        storage: 100Gi
  filesystemStorage:
    accessModes:
      - ReadWriteOnce
    resources:
      requests:
        storage: 100Gi
  osImages:
    - openshiftVersion: "4.8"
      version: "49.84.202110081407-0"
      url: "https://mirror.openshift.com/pub/openshift-v4/x86_64/dependencies/rhcos/4.8/4.8.14/rhcos-4.8.14-x86_64-live.x86_64.iso"
      rootFSUrl: "https://mirror.openshift.com/pub/openshift-v4/x86_64/dependencies/rhcos/4.8/4.8.14/rhcos-4.8.14-x86_64-live-rootfs.x86_64.img"
      cpuArchitecture: "x86_64"
    - openshiftVersion: "4.9"
      version: "49.84.202110081407-0"
      url: "https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.9/4.9.0/rhcos-4.9.0-x86_64-live.x86_64.iso"
      rootFSUrl: "https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.9/4.9.0/rhcos-4.9.0-x86_64-live-rootfs.x86_64.img"
      cpuArchitecture: "x86_64"
    - openshiftVersion: "4.10"
      version: "410.84.202202251620-0"
      url: "https://mirror.openshift.com/pub/openshift-v4/x86_64/dependencies/rhcos/4.10/4.10.3/rhcos-4.10.3-x86_64-live.x86_64.iso"
      rootFSUrl: "https://mirror.openshift.com/pub/openshift-v4/x86_64/dependencies/rhcos/4.10/4.10.3/rhcos-4.10.3-x86_64-live-rootfs.x86_64.img"
      cpuArchitecture: "x86_64"
EOF

sleep 20

oc get pods -n open-cluster-management

