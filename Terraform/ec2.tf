provider "aws" {
region = "us-west-2"
}

resource "aws_instance" "k8s-master" {
ami = "ami-0d12f7a11de8a0809"
instance_type = "t2.micro"
subnet_id = "subnet-2e98af05, subnet-3eb31f46"
vpc_security_group_ids = "sg-d8a8d4fa"
key_name = "k8s"
user_data     =<<EOF
#!/bin/bash
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

EOF

tags = {
Name 			= "Kube-master"
ansibleFilter	= "k8s"
ansibleNodeType = "master"

}
}


resource "aws_instance" "k8s-nodes" {
count = "4"
ami = "ami-0d12f7a11de8a0809"
instance_type = "t2.micro"
subnet_id = "subnet-2e98af05, subnet-3eb31f46"
vpc_security_group_ids = "sg-d8a8d4fa"
key_name = "k8s"
user_data     =<<EOF
#!/bin/bash
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

EOF

tags = {
Name = "Kube-node-${count.index +1}"
ansibleFilter	= "k8s"
ansibleNodeType = "node"
}
}
