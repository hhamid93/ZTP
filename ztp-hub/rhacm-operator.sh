#!/bin/bash

oc apply -k https://github.com/redhat-cop/gitops-catalog/advanced-cluster-management/operator/overlays/release-2.4

sleep 60

<<pods
hive-operator-86dcdddd44-trbzm                                    1/1
multicluster-observability-operator-59fb994fd-8jn7l               1/1
multicluster-operators-application-76b895d8c5-4g8pz               4/4
multicluster-operators-channel-659f5d794d-mh6x6                   1/1
multicluster-operators-hub-subscription-554cbcfcc8-w74zf          1/1
multicluster-operators-standalone-subscription-78f6c698c5-zlrfp   1/1
multiclusterhub-operator-787747c678-wgp7z                         1/1
submariner-addon-5d5b5f6cf9-cvrvz                                 1/1
pods

oc apply -k https://github.com/redhat-cop/gitops-catalog/advanced-cluster-management/instance/base

sleep 120
<<pods
application-chart-a6263-applicationui-794997ffcc-msptq            1/1
application-chart-a6263-applicationui-794997ffcc-s6tqq            1/1
application-chart-a6263-consoleapi-7648db5bf4-jbmxv               1/1
application-chart-a6263-consoleapi-7648db5bf4-w8pmz               1/1
clusterclaims-controller-7dd6ddbb9f-rf454                         2/2
clusterclaims-controller-7dd6ddbb9f-zlpp5                         2/2
cluster-curator-controller-75d559c4bc-hsmp8                       1/1
cluster-curator-controller-75d559c4bc-xbv4r                       1/1
clusterlifecycle-state-metrics-v2-64f668b6d6-s4w8p                1/1
console-chart-aa8e9-console-v2-5d78b9d774-hd584                   1/1
console-chart-aa8e9-console-v2-5d78b9d774-v44mn                   1/1
discovery-operator-6566dd56c4-j5kqs                               1/1
grc-a8f75-grcui-74d7b7c486-b7s5h                                  1/1
grc-a8f75-grcui-74d7b7c486-jq5gp                                  1/1
grc-a8f75-grcuiapi-79f7475fb9-2mw7w                               1/1
grc-a8f75-grcuiapi-79f7475fb9-6h6cr                               1/1
grc-a8f75-policy-propagator-86595c789-7jhjd                       2/2
grc-a8f75-policy-propagator-86595c789-92cbj                       2/2
infrastructure-operator-f9c86ccdd-px6zc                           1/1
klusterlet-addon-controller-v2-6f555bf465-nr9km                   1/1
klusterlet-addon-controller-v2-6f555bf465-z9rqn                   1/1
managedcluster-import-controller-v2-5444f5fd78-ct8sv              1/1
managedcluster-import-controller-v2-5444f5fd78-dgnq8              1/1
management-ingress-97870-6588765f9d-jrh2g                         2/2
management-ingress-97870-6588765f9d-p2cl6                         2/2
multiclusterhub-repo-5d7df78c45-jw665                             1/1
ocm-controller-7c878b95b6-c4nvk                                   1/1
ocm-controller-7c878b95b6-q2wbd                                   1/1
ocm-proxyserver-5f497dcfc-ckdvs                                   1/1
ocm-proxyserver-5f497dcfc-sm6x7                                   1/1
ocm-webhook-7489dbb8b4-kdxrw                                      1/1
ocm-webhook-7489dbb8b4-qvpw9                                      1/1
policyreport-41748-insights-client-665c44bbbd-hsxpt               1/1
policyreport-41748-metrics-585f747d75-5nqhn                       2/2
provider-credential-controller-767797bc48-tl8l4                   2/2
search-operator-7875976f86-5j68t                                  1/1
search-prod-05cd1-search-aggregator-bb5df7b9c-6xp96               1/1
search-prod-05cd1-search-api-65bc9cc6c4-lh5dp                     1/1
search-prod-05cd1-search-api-65bc9cc6c4-q88xd                     1/1
search-prod-05cd1-search-collector-d5dd5fb7f-g28vt                1/1
search-redisgraph-0                                               1/1
search-ui-578f949ff4-dxzp5                                        1/1
search-ui-578f949ff4-v2f6w                                        1/1
pods

oc get all -n open-cluster-management

