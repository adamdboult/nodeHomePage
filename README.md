
# Docker instructions

```bash
sudo docker-compose build --no-cache
sudo docker-compose up --detach
```

# Kubernetes instructions

Terminology:
+ Pods are collections of docker containers. Can be just one docker container or more
+ Nodes are where pods are deployed. Could be one node, or more.
+ Cluster is a collection of nodes

## General setup

Enable things.
Registry allows the use of local Docker builds.

```bash
microk8s enable dns dashboard storage registry
```

Enable loadbalancer. Separate as asks questions.
```bash
microk8s enable metallb
```



Run dashboard. Go to IP and port for service/kubernetes-dashboard.

```bash
sudo microk8s dashboard-proxy
```

## Private docker repository


Build
```bash
sudo docker build -t localhost:32000/homepage-nodejs -f ./docker/web/Dockerfile .
```

Push

```bash
sudo docker push localhost:32000/homepage-nodejs
```

## Specific setup

First convert the docker compose file to a kubernetes file.

```bash
kompose convert
```

But change image name to local

```bash

    spec:
      containers:
      - image: localhost:32000/homepage-nodejs
```
Then apply:

```bash
sudo microk8s kubectl apply -f homepage-nodejs-deployment.yaml

sudo microk8s kubectl apply -f homepage-nodejs-service.yaml
```

## Creating example

Create a service.

```bash
microk8s kubectl create deployment microbot --image=dontrebootme/microbot:v1
microk8s kubectl scale deployment microbot --replicas=2
```

Expose the service
```bash
microk8s kubectl expose deployment microbot --type=NodePort --port=80 --name=microbot-service
```

# Non-docker installation

Install apt dependencies. See Dockerfile.

Install npx.

```bash
sudo npm -g install npx
```

Install npm packages.

```bash
npm install
```

Prepare public files with gulp.

```bash
npx gulp
```

# Non-docker running

For testing.

```bash
node server.js
```

For production, copy the service file.

```bash
sudo cp ./node-homepage.service /lib/systemd/system
sudo systemctl daemon-reload
sudo systemctl start node-homepage.service
```

# Setting up Apache

Node homepage does not listen on standard HTTP or HTTPS ports.

```bash
sudo a2enmod rewrite
sudo a2enmod ssl
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo cp ./node-homepage.conf /etc/apache2/sites-available
sudo a2ensite node-homepage.conf
sudo systemctl reload apache2
```

