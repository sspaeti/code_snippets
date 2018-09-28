


#start airflow in background
start postgres db first!

source activate airflow

cd $AIRFLOW_HOME
airflow webserver -D

airflow scheduler -D


######kill running tasks cannot be forced. only with terminal:

#list all python processes
pgrep -lf python

#kill all processes with python
pkill -f python





#Start jupyter notebook in background

cd $VS_Projects/real-estate_BS/

source activate real-estate

jupyter notebook & 



#see running servers: 
#jupyter notebook list

#stop server:
#jupyter notebook stop 8888.


#superset virtual env -> not a conda, its a normal
/Users/sspaeti/Documents/virtualenvs
source superset/bin/activate      #activate in the right folder, alternative: source /Users/sspaeti/Documents/virtualenvs/superset/bin/activate      

# To start a development web server on port 8088, use -p to bind to another port
superset runserver -d

#http://localhost:8088  

