vpc_name = "var_testing_vpc"
subnet = "10.0.1.0/24"
instance_name = "var_testing_ec2"
sg_name = "var_testing_sg"
volume = {
    delete_on_termination = false
    encrypted = true
    volume_size = "20"
    volume_type = "standard"
}