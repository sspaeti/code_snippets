



######kill running tasks cannot be forced. only with terminal:

#list all python processes
#pgrep -lf python

#kill all processes with python
#pkill -f python





#Start jupyter notebook in background

cd $VS_Projects/real-estate_BS/

source activate real-estate

jupyter notebook & 



#see running servers: 
#jupyter notebook list

#stop server:
#jupyter notebook stop 8888.



