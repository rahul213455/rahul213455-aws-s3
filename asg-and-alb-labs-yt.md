# User data for EC2

```bash
#!/bin/bash

# Update the system and install Apache
yum update -y
yum install -y httpd

# Start and enable Apache to run on boot
systemctl start httpd
systemctl enable httpd

# Fetch the latest token for accessing EC2 instance metadata
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Fetch the instance ID
INSTANCEID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id -H "X-aws-ec2-metadata-token: $TOKEN")

# Create or overwrite index.html with the instance ID information
echo "<center><h1>This instance has the ID: $INSTANCEID </h1></center>" > /var/www/html/index.html

# Ensure httpd can read the index.html file and its directory
chown apache:apache /var/www/html/index.html
chmod 755 /var/www/html
chmod 644 /var/www/html/index.html

# Restart Apache to apply changes
systemctl restart httpd
```


# Run the following command to create connections to the ALB after creating a scaling policy:

```bash
for i in {1..500}; do curl http://<alb-dns-name>/; done
```

## sample apache app from youtube

#!/bin/bash
sudo apt update
sudo apt install -y software-properties-common language-pack-en-base dialog apt-utils
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
sudo cp /usr/share/zoneinfo/America/New_York /etc/localtime
sudo LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install -yq apache2 php5.6 php5.6-mysql mysql-client
sudo rm -rf /var/www/html/*
sudo wget https://github.com/devopsdemoapps/devops-demo/raw/master/devops-demo.tar.gz 
sudo tar -xvzf devops-demo.tar.gz -C/var/www/html/
sudo wget https://raw.githubusercontent.com/devopsdemoapps/devops- demo/master/devops-demo.sql
sudo service apache2 restart

## add database detial in it & create ami & autoscaling and LB
