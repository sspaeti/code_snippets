#download:curl http://localhost:3000/druid/v2/datasources
#docker pull druidio/example-cluster

#start cluster
docker run --rm -i -p 3000:8082 -p 3001:8081 druidio/example-cluster


#Wait a minute or so for Druid to start up and download the sample.

#List datasources
curl http://localhost:3000/druid/v2/datasources
#access the coordinator console
open http://localhost:3001/


#see docker processes:
docker ps

#start docker bash inside container
docker exec -i -t <id of container> bash
