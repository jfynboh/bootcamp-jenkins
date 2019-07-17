export CARTS_IP=$(kubectl describe svc carts -n dev | grep 'LoadBalancer Ingress:' | sed 's~LoadBalancer Ingress:[ \t]*~~')
export CARTS_URL="http://"$CARTS_IP":8080/cart"
echo $CARTS_URL

curl -d '{"id":"510a0d7e-8e83-4193-b483-e27e09ddc34d"}' -H "Content-Type: application/json" -X POST "$CARTS_URL"