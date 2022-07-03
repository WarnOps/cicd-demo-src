#!/bin/bash
while getopts "f:g:s:u:r:t:d:" option;
    do
    case "$option" in
        f ) SRC_FOLDER=${OPTARG};;
        g ) GITHUB_WORKSPACE=${OPTARG};;
        s ) SOURCE_LOCATION=${OPTARG};;
        r ) REPOSITORY=${OPTARG};;
        t ) TASKNAME=${OPTARG};;
        d ) DOCKER_FILE=${OPTARG};;
    esac
done
echo $SRC_FOLDER
echo $GITHUB_WORKSPACE
echo $SOURCE_LOCATION
echo $REPOSITORY
echo $TASKNAME
echo $DOCKER_FILE

set -euxo pipefail  # fail on error
  
imageTag=latest

set +x
echo "setting IMAGE_TAG output for task $TASKNAME"
echo "##vso[task.setvariable variable=IMAGE_TAG;isOutput=true]$imageTag"

# write a file containing the image tag
mkdir -p $GITHUB_WORKSPACE/image_tags      
echo "$imageTag" > $GITHUB_WORKSPACE/image_tags/$TASKNAME
