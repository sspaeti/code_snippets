

cd $git/etl-with-airflow

#
# etl airflow template including airflow
#
#https://gtoonstra.github.io/etl-with-airflow/etlexample.html#run-airflow-from-docker

#You may prefer to run the docker-compose process to become aware of issues that may pop up in the installation process. 
#The postgres database needs some initialization and this is only applied the first time the container is initialized. 
#This is how you start the containers the first time with the output to the console:

docker-compose -f docker-compose-LocalExecutor.yml up --abort-on-container-exit

#This is how you can clear the containers, so that you can run the install again after resolving any issues:
docker-compose -f docker-compose-LocalExecutor.yml down
docker-compose -f docker-compose-LocalExecutor-banking.yml down

#And this is how you’d typically run the container if everything is ready (as a daemon in the background):
#normal example
docker-compose -f docker-compose-LocalExecutor.yml up -d
docker-compose -f docker-compose-LocalExecutor-banking.yml up -d

#ms sql example
#docker-compose -f docker-compose-mssql.yml up -d
#etc
#docker-compose -f docker-compose-datavault2-bigdata.yml up -d
#docker-compose -f docker-compose-datavault2.yml up -d
#docker-compose -f docker-compose-dv.yml up -d
#docker-compose -f docker-compose-hive.yml up -d


!! after that Configure airflow:
We need to declare two postgres connections in airflow, a pool resource and one variable. 
The easiest way to do this is to run the "init_docker_example" DAG that was created. 
It will apply these settings that you’d normally do by hand. Activate the DAG by setting it to ‘on’.



#
# only docker from puckel - without ETL examples
#

#https://medium.com/@segal.levi/using-docker-to-explore-airflow-and-other-open-source-projects-e6349ffadf5a
#
#cd $git/docker-airflow/

#start Docker and Airflow
#make run

#see what processes are running in container
#docker ps

#open up a shell in the container you just started. -> only works with makefile above
#make tty