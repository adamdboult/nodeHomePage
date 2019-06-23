# Installation
Install APT dependencies:
sudo apt install node npm npx build-essential

Install NPM packages:
npm install

Install Bower components:
npx bower install

Prepare public files with gulp:
npx gulp

# Running
Run the webserver:
NODE_ENV=production npx forever start ./server.js

