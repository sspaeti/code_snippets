
#list
lsof -i :3000      #also: netstat -vanp tcp | grep 3000
#kill
kill -9 <PID>


#list all python processes
pgrep -lf python

#kill all processes with python
pkill -f python

