

provider "aws" {
  
  region = "us-east-1"
  
}

#  1. create a VPC  - 10.81.0.0/16

resource "aws_vpc" "prod_vpc" {
  cidr_block       = "10.81.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "prod_vpc"
  }
}

# 2. Create Internet Gateway 

resource "aws_internet_gateway" "prod_igw" {
  
    vpc_id = aws_vpc.prod_vpc.id

    tags = {
    Name = "prod_igw"
  }
}

#  3. Create Custom Route Table 

resource "aws_route_table" "prod_rt" {
  
  vpc_id = aws_vpc.prod_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod_igw.id
  }

  tags = {
    Name = "prod_rt"
  }

}

#  4. Create a Subnet  -- 10.81.3.0/24

resource "aws_subnet" "prod_sn" {
  
   vpc_id = aws_vpc.prod_vpc.id
   cidr_block = "10.81.3.0/24"

    tags = {
    Name = "prod_sn"
  }
}

#  5. Associate subnet with Route Table 

resource "aws_route_table_association" "public_rta" {

    subnet_id = aws_subnet.prod_sn.id
    route_table_id = aws_route_table.prod_rt.id
}

#  6. Create Security Group to allow port 22,80,443 or all ports , traffic  

resource "aws_security_group" "prod_sg" {
  name        = "prod-web-sg"
  description = "Allow HTTP , HTTPS and SSH traffic"
  vpc_id      = aws_vpc.prod_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]     # Replace with your actual IP address
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "prod_sg"
  }
}

 # 7. Create a network interface with an ip in the subnet that was created in step 4  


resource "aws_network_interface" "prod_nic" {
  subnet_id       = aws_subnet.prod_sn.id
  security_groups = [aws_security_group.prod_sg.id]
  private_ips     = ["10.81.3.33"]

  tags = {
    Name = "prod_nic"
  }
}

 # 8. Assign an elastic IP to the network interface created in step 7 

 resource "aws_eip" "prod_eip" {

    domain                    = "vpc"
    network_interface         = aws_network_interface.prod_nic.id
    associate_with_private_ip = "10.81.3.33"
   
     tags = {
    Name = "prod_eip"
    }
 }


 #  9. Create an ec2  server - LAUNCH APLICATION IN IT 

 resource "aws_instance" "prod_server" {
   
   ami = "ami-084a7d336e816906b"
   instance_type = "t2.micro"
   key_name = "b16key"
   user_data     = file("facebook.sh")
  
   network_interface {
    network_interface_id = aws_network_interface.prod_nic.id
    device_index         = 0
    }
  
    
   tags = {
    Name = "prod_server"
    }
 }


 output "prod_server_public_ip" {
    value = aws_instance.prod_server.public_ip
   }
