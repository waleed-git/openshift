# Installation of templates

- oc new-app jenkins-persistent -p VOLUME_CAPACITY=100Gi -p MEMORY_LIMIT=2Gi
- oc new-app -f openshift-templates/nexus3-persistent-template.yaml --param=NEXUS_VERSION=latest
- oc new-app -f openshift-templates/sonarqube-template.yaml
