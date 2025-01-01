# Prometheus monitoring dashboard

## Installation

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus-stack prometheus-community/kube-prometheus-stack
```

### Get default password

```bash
helm show values prometheus-community/kube-prometheus-stack | grep -C 5 Password
```