
# Docker instructions

```bash
sudo docker-compose build --no-cache
sudo docker-compose up --detach
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

Install bower components.

```bash
npx bower install
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

