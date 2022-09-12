## ZTP Procedures 

### Overview

Following is a high-level overview of using ZTP to provision the spoke clusters.

- Prepare a hub cluster which has RHACM installed.
- Install ZTP and setup ZTP pipeline.
- Prepare a git repo as the single source of truth for the spoke clusters and policies.
- Plan the spoke sites inventory file and their policies, and commit/push to the git repo.
  - SiteConfig: BMC and cluster info
  - PolicyGenTemplate: 
    - common
    - group
    - sites
    - cluster
- Create BMC secret for the spoke clusters
- GitOps operator/ArgoCD and RHACM will take over afterwards. 
  - Deploy the cluster
  - Generate the policies with remediationAction state as 'inform'.
- Create ClusterGroupUpgrade CRs, this will enforce the 'inform' policies on demand.

### Detailed Information
- [Set up ZTP Hub](./ztp-hub/README.md)
- [Set up ZTP Spokes](./ztp-spokes/README.md)
