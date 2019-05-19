# Installation
sudo apt install node npm build-essential

sudo npm -g install artillery forever@0.14.2 gulp@3.9.1 bower@1.4.1

NB: gulp version should match package.json. Others aren't in package.json so no need to match.

npm install
bower install
gulp

# Running
NODE_ENV=production forever start server.js

