kubectl create -f ./manifests/jenkins/k8s-jenkins-ns.yaml
kubectl create -f ./manifests/jenkins/k8s-jenkins-pvcs.yaml
kubectl create -f ./manifests/jenkins/k8s-jenkins-deployment.yaml
kubectl create -f ./manifests/jenkins/k8s-jenkins-rbac.yaml
kubectl create -f ./manifests/jenkins/k8s-jenkins-secret.yaml

echo "Waiting for Jenkins to start..."

sleep 1m

export JENKINS_URL=$(kubectl describe svc jenkins -n cicd | grep "LoadBalancer Ingress:" | sed 's~LoadBalancer Ingress:[ \t]*~~')
export JENKINS_URL_PORT=24711
export JENKINS_USERNAME=$(kubectl get secret jenkins-secret -n cicd -o yaml | grep "username:" | sed 's~username:[ \t]*~~')
export JENKINS_PASSWORD=$(kubectl get secret jenkins-secret -n cicd -o yaml | grep "password:" | sed 's~password:[ \t]*~~')



echo "----------------------------------------------------"
echo "Jenkins is running @ : http://$JENKINS_URL:$JENKINS_URL_PORT"
echo "Username is :" $(echo $JENKINS_USERNAME | base64 --decode)
echo "Password is :" $(echo $JENKINS_PASSWORD | base64 --decode)
echo "----------------------------------------------------"