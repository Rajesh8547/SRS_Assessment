resource "aws_elb" "kubernetes_api" {
    name = "kube-srs"
    instances = ["${aws_instance.k8s-*.id}"]
    subnets = "subnet-2e98af05, subnet-3eb31f46"
    cross_zone_load_balancing = false

    security_groups = "sg-d8a8d4fa"

    listener {
      lb_port = 6443
      instance_port = 6443
      lb_protocol = "TCP"
      instance_protocol = "TCP"
    }

    health_check {
      healthy_threshold = 2
      unhealthy_threshold = 2
      timeout = 15
      target = "HTTP:8080/healthz"
      interval = 30
    }

    tags {
      Name = "kubernetes"
    }
}