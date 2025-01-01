# Kubernetes commands

## Cheatsheet

https://kubernetes.io/docs/reference/kubectl/quick-reference

k is aliased to kubectl in bash:

ALIAS k ="kubectl"

## Simple pod interactions

k get pods                       : List all pods
k get pod $NAME                  : Get a pod with name $NAME
k edit pod $NAME                 : Edit a pod with name $NAME
k delete pod $NAME               : Delete a pod with name $NAME
k describe pod $NAME             : Show information about a pod with name $NAME

k get pods -o wide               : Show a lot more information about pods

## Create pod

This command writes pod configuration from a dry-run example for nginx.

k run nginx-yaml --image=nginx --dry-run=client -o yaml > nginx.yaml

k create -f $FILENAME            : Creates pod config for given $FILENAME. Errors if resource exists.
k apply -f $FILENAME             : Applies pod config for given $FILENAME. Create resource if not exists.
k edit pod $POD                  : Edit a pod with name $POD
k replace -f $FILENAME --force   : Replace and editted pod with changes in $FILENAME and ignore any warnings.
k delete all --all               : Delete everything

## Interacting with pods

k exec -it $NAME -- /bin/bash    : Access a container $NAME with a bash shell
CTRL+D                           : Exit a container. Alternative type exit + ENTER
k exec $NAME -- date             : Execute the date command in container $NAME
k exec -it nginx-storage -c busybox -- sh : open an interactive shell into a container busybox within a pod nginx-storage
k exec $POD -- whoami            : Get the user that

## Deployments

k create deploy test --image=httpd --replicas=3 : Create a deployment for an image with 3 replicas

k get deployments.apps           : Show all deployments
k edit deployments.apps $NAME    : Edit a deployment $NAME
k describe deployments.apps $NAME: Show condensed information about a deployment $NAME
k delete deployments.apps $NAME  : Delete a deployment $NAME

## Create a deployment

This command create a deployment yaml file from a minimal example
by using --dry-run and yaml formatting

k create deploy $NAME --image=httpd --replicas=3 --dry-run=client -o yaml > deploy.yaml

k apply -f deploy.yaml           : Creates a deployment from a deployment file

k get replicasets.apps           : List all sets of pod replicates
k describe replicasets.apps $NAME: Show infomdation about a replica.

k get namespaces                 : Show all namespaces
k create namespace $NAME         : Create a new namespace with name of $NAME
k apply -f $FILENAME             : Apply the namespace file
k apply -R -f $DIRNAME           : Apply all yaml files recursively in a directory $DIRNAME

k config set-context --current --namespace=$NAME : Set the default namespace to use to namespae $NAME

k port-forward pods/$NAME 9000   : Forward an external port to an internal portthe pod $POD is running under

## Taints and Tolerations

k taint nodes $NAME key=value:NoSchedule  : Add a Taint to a Node
k taint nodes $NAME key=value:NoSchedule- : Remove a Tain from Node

## Node Selectors & Affinity

k lavel nodes $NODE $LABELKEY:$LABELVALUE : A add a Label to a Node

## Ingress

k get ingress                    : Get all ingress 

k create ingress $NAME -n $NAMESPACE --rule=/$PATH=$SERVICE-NAME:$PORT --rule=/$OTHER=$ETC:$PORT

## Network Policies