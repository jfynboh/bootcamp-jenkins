#!/bin/bash
echo 'Hello World!'

export CARTS_URL=$(kubectl describe svc carts -n dev | grep 'LoadBalancer Ingress:' | sed 's~LoadBalancer Ingress:[ \t]*~~')
echo $CARTS_URL