1) you need to provide AWS credentials which user have proper access to create EC2 instances. 
These credentials will be needed for terraform and ansible to create resources. 

$ export AWS_ACCESS_KEY_ID=<access-key-id>
$ export AWS_SECRET_ACCESS_KEY="<secret-key>"


2) Run Terraform commands from ./terraform subdirectory.

$ terraform plan
$ terraform apply


3) Install and set up Kubernetes cluster

$ ansible-playbook dependencies.yaml

4) Setup kubectl in your machine or login to kube-master 

check the cluster is created and nodes are in ready state 

$ kubectl get nodes

5) Deploy nginx web server to cluster 

$ kubectl apply -f nginx.yaml

6) check the status of the deployment 

$  kubectl describe deployment nginx-deployment

$ kubectl get pods







