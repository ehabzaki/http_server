# baqend challenge

## Tools:
- Terraform
- Terragrunt
- kubernetes
- helm

## Using terragrunt and terraform I create the following:
1 - Vpc with public and private subnet.

2 - EKS runs in private subnet.

3 - Create OIDC role to be used in the service account to use resources on aws from the cluster.

4 - Install eks addons like aws-load-balancer-controller to allow the cluster to  create alb. 

5 - Create s3 bucket.

6 - Create efs and install it's addon.

## To run the http server: 
In the dir of app run `kubectl apply -f app.yaml`

## Missing parts in the task 
1 - I used alb, because using nginx ec2 instance would need to be fault tolernat
so for that we can use nginx plus active passive ha using elastic ip 
https://docs.nginx.com/nginx/deployment-guides/amazon-web-services/high-availability-keepalived/ .

2 - Use dns and ssl cert, Just to avoid paying more money :(


