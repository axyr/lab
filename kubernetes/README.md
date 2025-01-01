# Kubernetes playground

This repository contains Kubernetes experiments for my home lab.

As a Laravel adept, I have a separate repository for Laravel Kubernetes setups:

[Laravel Kubernetes](https://github.com/axyr/laravel-kubernetes-examples)

## DNS

I am using `*.internal` TLD to experiment with Ingress and real domain name resulotions.

In this way we don't need to divide applications by port numbers or paths,
but instead have real domains like `monitor.internal` or `application.internal`

On a Mac:

```bash
brew install dnsmasq
echo 'address=/.internal/127.0.0.1' >> $(brew --prefix)/etc/dnsmasq.conf
echo 'port=53' >> $(brew --prefix)/etc/dnsmasq.conf
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/internal'
sudo brew services start dnsmasq 
```