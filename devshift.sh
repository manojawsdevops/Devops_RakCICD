#!/bin/bash
/usr/local/bin/oc login -u kubeadmin -p r6PzC-4hayC-TjCIg-NaL4m --insecure-skip-tls-verify=true
x=devopsimage
y=$(/usr/local/bin/oc get routes | awk '{print $1}' | grep devopsimage)
if [ "$x" == "$y" ]
then
    echo "Pod and services already existed in openshift"
else
    /usr/local/bin/oc new-app --image-stream=default-route-openshift-image-registry.apps.ocp4.eidikointernal.com/manojprod/devopsimage:v1 -e LICENSE=accept && /usr/local/bin/oc expose service devopsimage -l name=devopsimage --port=7800
fi
