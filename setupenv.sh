#!/bin/bash
echo "Creating GKE Cluster..."

gcloud container clusters create sebootcamp --zone=us-central1-a --num-nodes=1 --machine-type=n1-standard-2 --image-type=Ubuntu

echo "Cluster created"
echo "Deploying OneAgent Operator"

kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value account)

kubectl create namespace dynatrace

LATEST_RELEASE=$(curl -s https://api.github.com/repos/dynatrace/dynatrace-oneagent-operator/releases/latest | grep tag_name | cut -d '"' -f 4)
kubectl create -f https://raw.githubusercontent.com/Dynatrace/dynatrace-oneagent-operator/$LATEST_RELEASE/deploy/kubernetes.yaml

kubectl -n dynatrace create secret generic oneagent --from-literal="apiToken="$1 --from-literal="paasToken="$2

curl -o cr.yaml https://raw.githubusercontent.com/Dynatrace/dynatrace-oneagent-operator/$LATEST_RELEASE/deploy/cr.yaml

sed -i 's/apiUrl: https:\/\/ENVIRONMENTID.live.dynatrace.com\/api/apiUrl: https:\/\/'$3'.dynatrace-managed.com\/e\/'$4'\/api/' cr.yaml

kubectl create -f cr.yaml

echo "Waiting for OneAgent to startup"

sleep 2m

echo "Deploying SockShop Application"

./deploy-sockshop.sh

echo "Deployment Complete"


