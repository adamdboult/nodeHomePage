# Installation
Install APT dependencies:
sudo apt install node npm build-essential

Install NPM packages:
npm install

Install Bower components:
sudo npm install -g npx
npx bower install

Prepare public files with gulp:
npx gulp

# Running
Copy the service file to 
/lib/systemd/system/
And then run
sudo systemctl daemon-reload
sudo systemctl start node-artificial-economist.service

