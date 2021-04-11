# openshift-pipeline
Installation of templates
# oc new-app jenkins-persistent -p VOLUME_CAPACITY=100Gi -p MEMORY_LIMIT=2Gi
# oc new-app -f openshift-templates/nexus3-persistent-template.yaml --param=NEXUS_VERSION=latest
# oc new-app -f openshift-templates/sonarqube-template.yaml

Spring Boot Project deployed with Jenkins pipeline on OpenShift
Deploy Spring Boot Project with Jenkins CICD pipeline on OpenShift

Introduction
On every pipeline execution, the code goes through the following steps:

Code is cloned from Github , built, tested and analyzed for bugs and The JAR artifact is pushed to Nexus Repository manager
A container image is built based on the  application JAR artifact , The image is deployed in a fresh new container in dev project
If tests successful.


The application used in this pipeline is a Spring Boot application and NodeJs

![image](https://user-images.githubusercontent.com/29263294/114311075-8ee17900-9aed-11eb-9547-601db436f3f1.png)


Prerequisites

![image](https://user-images.githubusercontent.com/29263294/114311051-7a04e580-9aed-11eb-9fd8-4637ec74bf0e.png)

OpenShift Config side 

oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n dev-namspace

oc apply -f buildconfig_pipeline.yaml

openshift sync plugin

add  dev-namspace

