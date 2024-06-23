provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "mongo" {
  count         = var.replica_count
  ami           = "ami-03a9bcb2cbc1a2960"  # Amazon Linux 2 AMI
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "mongo-${count.index}"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -a -G docker ec2-user
              docker run --name mongo -d -p 27017:27017 -v /data/db:/data/db mongo
              EOF

  lifecycle {
    create_before_destroy = true
  }
}
