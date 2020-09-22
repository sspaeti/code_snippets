


#https://www.openshift.com/blog/transferring-files-in-and-out-of-containers-in-openshift-part-1-manually-copying-files

oc login..

oc get pods
#or: oc get pods --selector app=blog

#connect with bash to container:
oc rsh <container-name>

cd opt

#create a gz
tar -czf myfiles.tar.gz *

#exit connection
exit


#copy myfiles to local directory
oc rsync anaconda-0:/opt/myfiles.tar.gz .