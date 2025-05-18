#!/bin/bash
  sudo apt update -y
  sudo apt install -y curl git

  curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt install -y nodejs

  git clone https://github.com/philopateermansour/3-tier-code.git /home/ubuntu/app
  
  cat > /home/ubuntu/app/backend/.env <<'EOF'
  DB_HOST=${db_host}
  DB_USER=${db_user}
  DB_PASS=${db_pass}
  DB_NAME=${db_name}
EOF

  cd /home/ubuntu/app/backend
  npm install

  nohup node server.js > server.log 2>&1 &