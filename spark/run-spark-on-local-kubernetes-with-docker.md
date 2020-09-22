<!-- https://medium.com/faun/apache-spark-on-kubernetes-docker-for-mac-2501cc72e659 -->


1. download spark binaries from https://spark.apache.org/downloads.html
2. tar zxvf spark-3.0.1-bin-hadoop3.2.tgz
3. build docker image with `./bin/docker-image-tool.sh -t spark-docker build`
4. Let’s create a custom service account with ClusterRole :
```
kubectl create serviceaccount spark
kubectl create clusterrolebinding spark-role --clusterrole=edit  --serviceaccount=default:spark --namespace=default
```

5. submit spark-job:
```
bin/spark-submit  \
    --master k8s://https://localhost:6443  \
    --deploy-mode cluster  \
    --conf spark.executor.instances=1  \
    --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark  \
    --conf spark.kubernetes.container.image=spark:spark-docker  \
    --class org.apache.spark.examples.SparkPi  \
    --name spark-pi  \
    local:///Users/sspaeti/Documents/spark/spark-3.0.1-bin-hadoop3.2/examples/jars/spark-examples_2.12-3.0.1.jar
```
