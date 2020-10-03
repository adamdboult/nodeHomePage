
# Docker instructions
npg is the name of the app? can change.
```bash
sudo docker build -t "nhp:Dockerfile" .
sudo docker run --detach -p 3000:3000 nhp:Dockerfile
```

# Installation
Install APT dependencies:
```bash
sudo apt install nodejs npm build-essential apache2
```

Install npx
```bash
sudo npm -g install npx
```

Install NPM packages
```bash
npm install
```

Install Bower components
```bash
npx bower install
```

Prepare public files with gulp
```bash
npx gulp
```

# Running
For testing
```bash
node server.js
```

Copy the service file.
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

# Setting up SSL
```bash
sudo systemctl stop apache2.service
sudo apt install certbot
sudo certbot certonly
sudo systemctl start apache2.service
```
# Renewing certificates
```bash
sudo certbot renew
```

