# AWS Terraform `aws/eks/nodegroup` Module

This module provisions an EKS Node Group.

```
module "eks-nodegroup" {
  for_each = toset(module.vpc.az_list)

  source = "git@github.com:CloudExpertise-org/IaC-Modules.git//aws/eks/nodegroup?ref=v0.0.1"

  eks_cluster_name = module.this.eks["cluster_name"]
  eks_version      = module.this.eks["version"]

  node_group_name = "${var.environment_name}-eks-${element(reverse(split("-", each.value)), 0)}"
  permissions_boundary = var.permissions_boundary
  
  subnet_ids = [module.vpc.subnets["workload"][each.value].id]

  taints = [
    {
      key    = "somekey"
      value  = "true"
      effect = "NO_SCHEDULE"
    }
  ]

  labels = {
    workload = "someworkload"
  }

  tags = {
    Name = "${var.environment_name}-eks-${element(reverse(split("-", each.value)), 0)}"
  }

  ami_type       = "AL2_x86_64"
  instance_types = ["r6i.large"]

  size_max = 2
  size_min = 0

  max_unavailable_percentage = 50
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group_tag.label](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/autoscaling_group_tag) | resource |
| [aws_autoscaling_group_tag.tags](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/autoscaling_group_tag) | resource |
| [aws_autoscaling_group_tag.taint](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/autoscaling_group_tag) | resource |
| [aws_eks_node_group.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/eks_node_group) | resource |
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_release_version"></a> [ami\_release\_version](#input\_ami\_release\_version) | The AMI version of the EKS Node Group. | `string` | `null` | no |
| <a name="input_ami_type"></a> [ami\_type](#input\_ami\_type) | The type of AMI to be used. Default = AL2\_x86\_64 | `string` | `"AL2_x86_64"` | no |
| <a name="input_assume_role_allowed_services"></a> [assume\_role\_allowed\_services](#input\_assume\_role\_allowed\_services) | List of services allowed to assume this role, i.e., ["ec2.amazonaws.com"]. | `list(string)` | <pre>[<br>  "ec2.amazonaws.com"<br>]</pre> | no |
| <a name="input_capacity_type"></a> [capacity\_type](#input\_capacity\_type) | Type of capacity associated with EKS node group. | `string` | `"ON_DEMAND"` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Disk size in GiB for nodes. | `string` | `20` | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | Name of EKS Cluster. | `string` | n/a | yes |
| <a name="input_eks_version"></a> [eks\_version](#input\_eks\_version) | Version of EKS Cluster. | `string` | n/a | yes |
| <a name="input_force_update_version"></a> [force\_update\_version](#input\_force\_update\_version) | Force version update if existing pods are unable to be drained due to a pod disruption budget issue. | `bool` | `true` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | List of instance types associated with the ELS node group. | `list(string)` | <pre>[<br>  "m6i.large"<br>]</pre> | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Map of Kubernetes labels to be added to the Node Group. | `map(any)` | `{}` | no |
| <a name="input_max_unavailable_percentage"></a> [max\_unavailable\_percentage](#input\_max\_unavailable\_percentage) | Maximum unavailable percentage of the nodes during a version update. | `string` | `25` | no |
| <a name="input_node_group_name"></a> [node\_group\_name](#input\_node\_group\_name) | Name of EKS Node Group. | `string` | n/a | yes |
| <a name="input_node_role_arn"></a> [node\_role\_arn](#input\_node\_role\_arn) | IAM Role ARN to be assigned to the Node Group. If unspecified a new IAM Role is created. | `string` | `null` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | The ARN of the policy that is used to set the permissions boundary for the role. | `string` | `null` | no |
| <a name="input_policy_attachment_arns"></a> [policy\_attachment\_arns](#input\_policy\_attachment\_arns) | List of IAM Policy ARNs to be attached to this role. | `list(string)` | <pre>[<br>  "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",<br>  "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",<br>  "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"<br>]</pre> | no |
| <a name="input_size_max"></a> [size\_max](#input\_size\_max) | Maximum size of ASG. (Also used to set Desired Size at creation.) | `string` | n/a | yes |
| <a name="input_size_min"></a> [size\_min](#input\_size\_min) | Minimum size of ASG. | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of VPC Subnet IDs to be associated with this Node Group. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of AWS Tags to be added to the Auto Scaling Group created by EKS Node Group. | `map(any)` | `{}` | no |
| <a name="input_taints"></a> [taints](#input\_taints) | List of taints to be added to the Node Group. | <pre>list(object({<br>    key    = string<br>    value  = string<br>    effect = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of Node Group created. |
| <a name="output_asg_name"></a> [asg\_name](#output\_asg\_name) | List of Autoscaling Groups. |
| <a name="output_id"></a> [id](#output\_id) | EKS Cluster name and EKS Node Group name separated by a colon. |
| <a name="output_node_role_arn"></a> [node\_role\_arn](#output\_node\_role\_arn) | The ARN of IAM role used for launching Node Group. |
| <a name="output_resources"></a> [resources](#output\_resources) | List of objects containing information about underlying resources. |

## Node Group Instance Bootstrapping

AWS SSM Association is the preferred method to bootstrap new Node Group instances.

An example code is provided below to configure a custom CA on the target instances. 

```
# Create SSM Document
module "ssm-doc-add-ca" {
  source = "git@github.com:CloudExpertise-org/IaC-Modules.git//aws/ssm/document?ref=v0.0.1"

  name             = "add-ca"
  document_format  = "YAML"
  document_type    = "Command"
  document_content = <<EOF
schemaVersion: '2.2'
description: "Bootstrap CA certificate onto EKS Managed Node Group instances."
parameters: {}
mainSteps:
- action: aws:runShellScript
  name: configureServer
  inputs:
    runCommand:
    - echo -n > /tmp/docker.hosts
    - echo "example.com" >> /tmp/docker.hosts
    - echo "{}"  > /etc/docker/daemon.json
    - while read host; do sudo mkdir -p /etc/docker/certs.d/$host/ && sudo openssl s_client -showcerts -connect $host:443 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /etc/docker/certs.d/$host/ca.crt; done < /tmp/docker.hosts
    - openssl s_client -showcerts -connect example.com:443 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /tmp/example.ca.crt
    - sudo cp /tmp/example.ca.crt /usr/share/pki/ca-trust-source/anchors/
    - sudo update-ca-trust
EOF
}

# Create SSM Association
module "ssm-asso-add-ca" {
  for_each = toset(module.vpc.az_list)
  source   = "git@github.com:CloudExpertise-org/IaC-Modules.git//aws/ssm/association?ref=v0.0.1"

  ssm_document_name    = module.ssm-doc-add-ca.name
  ssm_document_version = "$DEFAULT"

  target_key         = "tag:aws:autoscaling:groupName"
  target_values_list = flatten(module.eks-nodegroup[each.value].asg_name)

  max_concurrency = "100%"
  max_errors      = "100%"
}

```