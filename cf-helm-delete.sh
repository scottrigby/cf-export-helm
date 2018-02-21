#!/bin/sh

kubectl config use-context ${KUBE_CONTEXT}

RELEASE_NAME=cf-${CF_REPO_OWNER}-${CF_REPO_NAME}-${CF_PR_NUMBER}
cf_export RELEASE_NAME=${RELEASE_NAME}
echo RELEASE_NAME ${RELEASE_NAME}

if helm status ${RELEASE_NAME} > /dev/null 2>&1; then
  helm delete --purge ${RELEASE_NAME}
  echo 'Deleted PR env'
else
  echo 'No PR env to delete'
fi
