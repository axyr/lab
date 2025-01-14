# HELM commands

>Namespaces are optional!

List all helm applications
```bash
helm list -a
```

Create a new sample "w
 application
```bash
helm create <name>
```

Install an application (in a given namespace)
```bash
helm install <release-name> <directory> -n<namespace>
```
Add --dry-run to only show the output without actually installing the application

Upgrade an application
```bash
helm upgrade <release-name> <directory> -n<namespace>
```

Rollback an application
```bash
helm rollback <release-name> <release-number> -n<namespace>
```

Debugging and inspecting
```bash
helm template <directory>
```

Linting
```bash
helm lint <directory>
```

Uninstall an application
```bash
helm uninstall <release-name>
```


