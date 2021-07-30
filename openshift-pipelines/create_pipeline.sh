#!/bin/bash
set -x

INPUT=Book_sample.csv


#echo "What is your gitlab Acess token for private gitlab?"
#read PRIVATE_GITLAB_TOKEN
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while IFS=',' read project_name project_https_url
do	


if [ -f "dev-pipelines/${project_name}-dev-pipeline.yaml" ]; then
    echo "${project_name}-dev-pipeline already exist, applying changes... "
    oc apply -f dev-pipelines/${project_name}-dev-pipeline.yaml -n dev-namespace
else 
    cp dev-template-pipeline.yaml dev-pipelines/${project_name}-dev-pipeline.yaml
    sed -i "s/\${project_name}/$project_name/g" dev-pipelines/${project_name}-dev-pipeline.yaml
    sed -i "s&\${uri}&$project_https_url&g" dev-pipelines/${project_name}-dev-pipeline.yaml
    oc apply -f dev-pipelines/${project_name}-dev-pipeline.yaml -n dev-namespace

fi


done <  "$INPUT"

git add .
git commit -m "Add/Fix pipelines"
git push 
