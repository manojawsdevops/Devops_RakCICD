#!/bin/bash
/usr/local/bin/oc login -u kubeadmin -p pNEYN-4x6FF-WhdXS-gS3t4 --insecure-skip-tls-verify=true
x=devopsimage
y=$(/usr/local/bin/oc get routes | awk '{print $1}' | grep devopsimage)
if [ "$x" == "$y" ]
then
    echo "Pod and services already existed in openshift"
else
    /usr/local/bin/oc new-app --image-stream=manoj1/devopsimage:v1 -e LICENSE=accept && /usr/local/bin/oc expose svc devopsimage --port=7800
fi
