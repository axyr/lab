# Kubernetes commands

## Cheatsheet

https://kubernetes.io/docs/reference/kubectl/quick-reference

k is aliased to kubectl in bash:

ALIAS k ="kubectl"

## Global interactions

List all API resources and the short names
```bash
k api-resources 
```

## Simple pod interactions

List all pods
```bash
k get pods
```

Get a pod with name <name>
```bash
k get pod <name>
```

Edit a pod with name <name>
```bash
k edit pod <name>
```

Delete a pod with name <name>
```bash
k delete pod <name>
# Fast delete alternative
k delete pod <name> --grace-period 0 --force
```

Show information about a pod with name <name>
```bash
k describe pod <name>
```

Show a lot more information about pods
```bash
k get pods -o wide
```

## Create pod

This command writes pod configuration from a dry-run example for nginx.
```bash
k run nginx-yaml --image=nginx --dry-run=client -o yaml > nginx.yaml
```

Creates pod config for given <filename>. Errors if resource exists.
```bash
k create -f <filename>
```

Applies pod config for given <filename>. Create resource if not exists.
```bash
k apply -f <filename>
```

Edit a pod with name <pod>
```bash
k edit pod <pod>
```

Replace and editted pod with changes in <filename> and ignore any warnings.
```bash
k replace -f <filename> --force
```

Delete everything
```bash
k delete all --all
```

## Interacting with pods

Access a container <name> with a bash shell
```bash
k exec -it <name> -- /bin/bash
```

Exit a container. Alternative type exit + ENTER
```bash
CTRL+D
```

Execute the date command in container <name>
```bash
k exec <name> -- date
```

Open an interactive shell into a container busybox within a pod nginx-storage
```bash
k exec -it nginx-storage -c busybox -- sh
```

Get the user that
```bash
k exec <pod> -- whoami
```

## Deployments

Create a deployment for an image with 3 replicas
```bash
k create deploy test --image=httpd --replicas=3
```

Show all deployments
```bash
k get deployments.apps
```

Edit a deployment <name>
```bash
k edit deployments.apps <name>
```

Show condensed information about a deployment <name>
```bash
k describe deployments.apps <name>
```

Delete a deployment <name>
```bash
k delete deployments.apps <name>
```

## Create a deployment

This command create a deployment yaml file from a minimal example by using --dry-run and yaml formatting
```bash
k create deploy <name> --image=httpd --replicas=3 --dry-run=client -o yaml > deploy.yaml
```

Creates a deployment from a deployment file
```bash
k apply -f deploy.yaml
```

List all sets of pod replicates
```bash
k get replicasets.apps
```

Show infomdation about a replica.
```bash
k describe replicasets.apps <name>
```

Show all namespaces
```bash
k get namespaces
```

Create a new namespace with name of <name>
```bash
k create namespace <name>
```

Apply the namespace file
```bash
k apply -f <filename>
```

Apply all yaml files recursively in a directory <dirname>
```bash
k apply -R -f <dirname>
```

Set the default namespace to use to namespae <name>
```bash
k config set-context --current --namespace=<name>
```

Forward an external port to an internal portthe pod <pod> is running under
```bash
k port-forward pods/<name> 9000
```

## Taints and Tolerations

Add a Taint to a Node
```bash
k taint nodes <name> key=value:NoSchedule
```

Remove a Tain from Node
```bash
k taint nodes <name> key=value:NoSchedule-
```

## Node Selectors & Affinity

A add a Label to a Node
```bash
k lavel nodes <node> <labelkey>:<labelvalue>
```

## Ingress

Get all ingress
```bash
k get ingress
```

Create ingress
```bash
k create ingress <name> -n <namespace> --rule=/<path>=<service-name>:<port> --rule=/<other>=<etc>:<port>
```

## Network Policies

## Debugging

Run a temporary Pod with nginx and execute the curl command on ip <ip>:<port>
```bash
k run tmp --restart=Never --rm -i --image=nginx:alpine -- curl -m 5 <ip>:<port>
```

Run a temporary Pod with busybox and execute the wget command on ip <ip>:<port>
```bash
k run tmp --restart=Never --rm --image=busybox -i -- wget -O- <ip>:<port>
```