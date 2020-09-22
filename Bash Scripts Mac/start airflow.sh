#start airflow in background
#start postgres db first!

source activate airflow

cd $AIRFLOW_HOME
airflow webserver -D

airflow scheduler -D


######kill running tasks cannot be forced. only with terminal:

#list all python processes
#pgrep -lf python

#kill all processes with python
#pkill -f python


