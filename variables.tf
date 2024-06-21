variable "aws_region" {
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The type of instance to create"
  default     = "t3.medium"
}

variable "key_name" {
  description = "The name of the SSH key pair"
}

variable "replica_count" {
  description = "Number of MongoDB replica set members"
  default     = 3
}
