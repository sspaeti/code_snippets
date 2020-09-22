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
$SPARK_HOME/bin/spark-submit  \
    --master k8s://https://localhost:6443  \
    --deploy-mode cluster  \
    --conf spark.executor.instances=1  \
    --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark  \
    --conf spark.kubernetes.container.image=spark:spark-docker  \
    --class org.apache.spark.examples.SparkPi  \
    --name spark-pi  \
    local:///Users/sspaeti/Documents/spark/spark-3.0.1-bin-hadoop3.2/examples/jars/spark-examples_2.12-3.0.1.jar
```

# run spark-shell job on MinIo
```
$SPARK_HOME/bin/spark-shell \
  --master k8s://https://localhost:6443  \
  --deploy-mode client  \
  --conf spark.executor.instances=1  \
  --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark  \
  --conf spark.kubernetes.container.image=spark:spark-docker  \
  --packages io.delta:delta-core_2.12:0.7.0,org.apache.hadoop:hadoop-aws:3.0.1  \
  --conf spark.delta.logStore.class=org.apache.spark.sql.delta.storage.S3SingleDriverLogStore \
  --conf spark.hadoop.fs.path.style.access=true \
  --conf spark.hadoop.fs.s3a.access.key=minio \
  --conf spark.hadoop.fs.s3a.secret.key=miniostorage \
  --conf spark.hadoop.fs.s3a.endpoint=http://192.168.2.128:9000 \
  --conf spark.hadoop.fs.s3a.connection.ssl.enabled=false \
  --name spark-delta123
````

Two properties that was set in spark 2.4.4 but most probably not used anymore:
```
  --conf spark.hadoop.fs.impl=org.apache.hadoop.fs.s3a.S3AFileSystem \
  --conf spark.sql.extensions=io.delta.sql.DeltaSparkSessionExtension \
```


## read / write delta
```
spark.range(5).write.format("delta").mode("overwrite").save("s3a://test/delta-table123")

val df = spark.read.format("delta").load("s3a://test/delta-table123")
df.show()
```


## Run Docker Image locally
docker ps
docker run --publish 80:88 --detach --name spark spark:spark-docker
