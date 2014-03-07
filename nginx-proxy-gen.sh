
# Make sure to run apt-get update first. 
echo 'Installing nginx...' 
sudo apt-get install -y nginx
echo 'Installing apache2-utils' 
apt-get install -y apache2-utils

# Overwrite nginx.conf with proxy.conf file. TODO Perhaps it would
# be better to just create a new conf in sites-available?
echo 'Overwriting nginx.conf...'   
sudo cp ./proxy.conf /etc/nginx/nginx.conf 

echo 'Ensuring nginx will run on startup...' 
sudo update-rc.d nginx defaults 

echo "Creating proxy auth credentials for user 'proxy-client'..." 
htpasswd -c /etc/nginx/conf.d/.htpasswd proxy-client

echo 'Starting nginx...'
sudo nginx

echo 'Proxy started on port 80! Stop the proxy by running "sudo nginx -s stop"'
