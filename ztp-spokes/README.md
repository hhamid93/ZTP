A repo to provision ZTP spoke clusters

## Repo Structure

An example of the git repo structure:
```shell
[root@hub-helper ztp-spokes]
├── prereqs
│   └── snoexample.yaml
├── README.md
└── sites
    ├── kustomization.yaml
    └── snoexample.yaml
```
- [sites](./sites) to save SiteConfig CRs for all managed clusters
- [prereqs](./prereqs) to save the BMC secret and pull secret for the managed clusters

## Upgrade a cluster

- Define an upgrade PolicyGenTemplate and put the desired OCP version
- Policy will be copied from template to target namespace and set as 'inform'
- Create a ClusterGroupUpgrade so that the policy will be enforced to upgrade OCP cluster

## Cleanup

To delete a site:
- Remove the site and its policy from kustomize.yaml in git repo

To delete a site completely:
- Remove the site and its policy from kustomize.yaml in git repo
- Delete all related SiteConfig and PolicyGenTemplate from git repo


## Troubleshoot Tips

### General checking flow
1. Login ArgoCD to check sync status
2. Login RHACM web console to check cluster status
3. Check BMH(BaremetalHost) status

    ```shell
    oc get bmh -n <target_namespace>
    oc describe bmh -n <target_namespace>
    ```
4. (In context of multiple nodes cluster)Be sure each host should have its own BMC secret, cannot be shared.

5. Check metal3 pod logs

    ```shell
    oc -n openshift-machine-api logs -f $(oc get pods -n openshift-machine-api -o name --selector baremetal.openshift.io/cluster-baremetal-operator=metal3-state)  metal3-ironic-conductor
    ```

6. BMC console

7. Node journal logs

8. Policy related troubleshooting
    ```shell
     oc get policy -A
     oc describe policy
    ```
9. Check events
   
    ```shell
    oc get events <namespace>
   ```

### Objects remained in the namespace and ns could not be deleted

1. When deleting a site, some time ArgoCD could not delete all associated objects in the namespace:
   - Check what objects are remaining:
      ```shell
      [root@hub-helper ~]# alias ocgetall
      alias ocgetall='oc api-resources --verbs=list --namespaced -o name | xargs -t -n 1 oc get --show-kind --ignore-not-found'
   
      ocgetall -n <namespace>
      ```

   - Remove the finalizer of the remaining objects, for example:
      ```shell
      oc patch -n sno146 secret/bmh-secret  --type=merge -p '{"metadata": {"finalizers":null}}'
      oc patch -n sno146 baremetalhost.metal3.io/XXXXXXXXXXXXX  --type=merge -p '{"metadata": {"finalizers":null}}'
