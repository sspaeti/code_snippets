
#start postgres app and db "postgres app 2"
#use pgadmin4 for queriying table etc.

cd $git/etl-with-airflow
source activate banking


#starting up with debuging:
#docker-compose -f docker-compose-LocalExecutor.yml up --abort-on-container-exit

#This is how you can clear the containers, so that you can run the install again after resolving any issues:
#docker-compose -f docker-compose-LocalExecutor-banking.yml down

#And this is how you’d typically run the container if everything is ready (as a daemon in the background):

#this starts banking etl example in docker
docker-compose -f docker-compose-LocalExecutor-banking.yml up -d


open http://localhost:8080


!! after that Configure airflow:
#We need to declare two postgres connections in airflow, a pool resource and one variable. 
#The easiest way to do this is to run the "init_docker_example" DAG that was created. 
#It will apply these settings that you’d normally do by hand. Activate the DAG by setting it to ‘on’.

