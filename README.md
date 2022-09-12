# Outbound Team Billerica Lab ZTP

A repo to run ZTP in Outbound Team Billerica lab

## Outbound Team Billerica lab

[Server Information](https://docs.google.com/spreadsheets/d/1FLUAhX9ycr1A26UmvwD7Ck2eEhkYA6Xv7DXUvU_ql-4/edit#gid=0)

|  Node  |  Type   |   IPMI IPv4    |       IPMI IPv6       |                         
|:------:|:-------:|:--------------:|:---------------------:|
| sno146 | Proteus | 192.168.13.146 | 2600:52:7:213::146/64 |
| sno147 | Proteus | 192.168.13.147 | 2600:52:7:213::147/64 | 
| sno148 | Proteus | 192.168.13.148 | 2600:52:7:213::148/64 |
| sno149 | Proteus | 192.168.13.149 | 2600:52:7:213::149/64 |

## Jump Server

- hostname: jumphost.outbound.vz.bos2.lab
- IP:
    - 192.168.13.12/25
    - 192.168.58.14/25 (vlan58, routable)
    - 2600:52:7:58::14/64 (vlan58, routable)
- IPMI: 192.168.13.201
- Host: RHEL8, 112 CPU, 512G RAM

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

- [Set up OCP virtual cluster](./ocp-virtual-cluster/README.md)
- [Set up ZTP Hub](./ztp-hub/README.md)
- [Set up ZTP Spokes](./ztp-spokes/README.md)
