provider "aws" {
  region = "ap-south-1"
}

module "my_vpc" {
    source = "./module/vpc"

    vpc_config = {
        cidr_block = "10.0.0.0/16"
        name       = "my-test-vpc"
    }

    subnet_config = {
        public_subnet_1 = {
            cidr_block        = "10.0.0.0/24"
            availability_zone = "ap-south-1a"
            public            = true
        }
        public_subnet_2 = {
            cidr_block        = "10.0.1.0/24"
            availability_zone = "ap-south-1a"
            public            = true
        }
        private_subnet_1 = {
            cidr_block        = "10.0.2.0/24"
            availability_zone = "ap-south-1b"
        }
    }
}