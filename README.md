# Azure VMSS LoadBalancer Nginx-WebHosting

This project demonstrates how to deploy a highly available web hosting infrastructure on Microsoft Azure using Virtual Machine Scale Sets (VMSS), Azure Standard Load Balancer, and Nginx.
Terraform automates the provisioning of Azure infrastructure, while Custom Script Extension automatically installs and configures Nginx on every VMSS instance.

## Architecture


## Technologies Used

- Microsoft Azure
- Terraform
- Linux Ubuntu
- Nginx
- Bash Scripting
- Azure Load Balancer
- Azure VM Scale Sets
  

## Key Features

1. High Availability: Multiple Nginx instances serve incoming requests.
2. Load Balancing: Incoming HTTP traffic is distributed across healthy instances.
3. Automatic Deployment: Nginx is installed automatically using Custom Script Extension.
4. Autoscaling: VMSS scales between 2 and 5 instances based on CPU utilization.
5. Infrastructure as Code: All infrastructure is provisioned using Terraform.

## Commands used for authentication 

- Log in to Azure
```
- az login
```

- Create Service Principal 
```
az ad sp create-for-rbac -n az-demo --role="Contributor" --scopes="/subscriptions/$SUBSCRIPTION_ID"
```
Note: Use the values generated here to export the variables in the next step

- Set env vars so that the service principal is used for authentication

```
export ARM_CLIENT_ID=""
export ARM_CLIENT_SECRET=""
export ARM_SUBSCRIPTION_ID=""
export ARM_TENANT_ID=""
```

## Deployment

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

Get the website URL:

```bash
terraform output website_url
```

## Testing

- Verify the website using the Load Balancer public IP.
- Check VMSS instances.
- Verify backend health.
- Generate CPU load to test autoscaling.
- Verify traffic distribution between instances.



## Cleanup

```bash
terraform destroy
```

**Note:** Production deployment should additionally include HTTPS, SSH-key authentication, restricted administrative access, monitoring alerts, and secure secret management.

## Author
Saranjib Kuanar
