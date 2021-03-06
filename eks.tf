module "my-cluster" {
        source = "terraform-aws-modules/eks/aws"
        version = "12.0.0"
        cluster_name = var.cluster_name
        cluster_version = var.cluster_version
        subnets = var.subnets
        vpc_id = var.vpc_id
        cluster_create_security_group = true
        worker_groups = [{
        instance_type = var.instance_type
        asg_max_size = var.asg_max_size
        asg_min_size = var.asg_min_size #min size should be 1
                }
        ]
        tags = var.tags
}

output "cluster_id" {
        value = module.my-cluster.cluster_id
}
output "cluster_arn" {
        value = module.my-cluster.cluster_arn
}
output "cluster_version" {
        value = module.my-cluster.cluster_version
}
output "cluster_security_group_id" {
        value = module.my-cluster.cluster_security_group_id
}
output "workers_asg_names" {
        value = module.my-cluster.workers_asg_names
}
