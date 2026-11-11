#!/bin/bash

set -e

apt-get update -y
apt-get install -y nginx

systemctl enable nginx
systemctl start nginx

cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Azure VMSS Web Hosting</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #0078d4, #142d4e);
            color: white;
            text-align: center;
        }

        .container {
            margin-top: 120px;
            padding: 40px;
        }

        .card {
            background: white;
            color: #222;
            padding: 35px;
            margin: auto;
            max-width: 650px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,.3);
        }

        h1 { color: #0078d4; }

        .status {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <h1>Azure VM Scale Set</h1>
            <h2>Nginx Web Hosting Project</h2>
            <p class="status">Website is running successfully!</p>
            <p>Hosted on Azure Linux Virtual Machines.</p>
            <p>Infrastructure: Azure Load Balancer + VMSS</p>
            <p>High Availability | Autoscaling | Terraform</p>
        </div>
    </div>
</body>
</html>
EOF

systemctl restart nginx
