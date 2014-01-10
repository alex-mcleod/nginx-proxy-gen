
# Make sure to run apt-get update first. 
echo 'Installing nginx...' 
sudo apt-get install -y nginx

# Overwrite nginx.conf with proxy.conf file. TODO Perhaps it would
# be better to just create a new conf in sites-available?
echo 'Overwriting nginx.conf...'   
sudo cp ./proxy.conf /etc/nginx/nginx.conf 

echo 'Starting nginx...'
sudo nginx

echo 'Ensuring nginx will run on startup...' 
sudo update-rc.d nginx defaults 

echo 'Proxy started on port 80! Stop the proxy by running "sudo nginx -s stop"'
