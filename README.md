Prerequisites
Terraform Installed: Ensure Terraform is installed on your machine.
AWS Account: This guide assumes you are using AWS. Adjust the provider settings if you are using another cloud provider.
SSH Key: An SSH key pair to access the instances.

Initialize and Apply Terraform Configuration
Run the following commands to initialize and apply the Terraform configuration.


terraform init
terraform apply
Step : Configure MongoDB Replica Set
Once the instances are created, SSH into one of the instances and initiate the replica set.

Connect to an Instance

ssh -i /path/to/your/key.pem ec2-user@<instance_ip>
Initiate the Replica Set
Once inside the instance, open the MongoDB shell:


docker exec -it mongo mongo
Then run the following commands to initiate the replica set:


rs.initiate({
  _id : "rs0",
  members: [
    { _id: 0, host: "<instance_ip_1>:27017" },
    { _id: 1, host: "<instance_ip_2>:27017" },
    { _id: 2, host: "<instance_ip_3>:27017" }
  ]
})
Replace <instance_ip_1>, <instance_ip_2>, and <instance_ip_3> with the actual IP addresses of your instances.

Verify the Replica Set
Run the following command to check the status of the replica set:


rs.status()
