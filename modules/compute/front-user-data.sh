#!/bin/bash
  exec > /var/log/user-data.log 2>&1
  set -x

  apt update -y
  apt install -y nginx git

  # Clone the repo
  git clone https://github.com/philopateermansour/3-tier-code.git /var/www/app

  # Replace default index.html with your custom one
    rm -f /var/www/html/index.html
    cp  /var/www/app/frontend/index.html /var/www/html/

      cat > /etc/nginx/sites-available/default << NGINX
    server {
        listen 80;

        location / {
            root /var/www/html;
            index index.html;
            try_files \$uri \$uri/ =404;
        }

        location /like {
            proxy_pass http://${back_alb_dns}:8080/like;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto \$scheme;
        }

        location /likes {
            proxy_pass http://${back_alb_dns}:8080/likes;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto \$scheme;
        }
    }
NGINX

      systemctl enable nginx
      systemctl restart nginx