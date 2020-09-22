kubectl cluster-info
kubectl get nodes

#Some Kubernetes commands with local Docker-Kubernetes on MacOS


## Kubernetes Dashboard
<!-- apply kubernetes dashboard -->
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-rc7/aio/deploy/recommended.yaml

kubectl get pods --namespace kube-system

kubectl port-forward kubernetes-dashboard-7798c48646-ctrtl 8443:8443 --namespace=kube-system

## starting dashboard
kubectl proxy

Dashboard available at:
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.

get access token:
1. kubectl get secrets
NAME                  TYPE                                  DATA   AGE
default-token-q56jg   kubernetes.io/service-account-token   3      4d6h
spark-token-cpztt     kubernetes.io/service-account-token   3      2d9h
2. ❯ kubectl describe secret default-token-q56jg
--> will get you the token