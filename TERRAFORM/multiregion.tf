
provider "aws" {
  
  region = "us-east-1"
  alias = "nv"

  
}

provider "aws" {
  
  region = "ap-south-1"
  alias = "mumbai"
}

resource "aws_instance" "server1-nv" {  
    ami  = "ami-020cba7c55df1f615"
    instance_type = "t2.micro"
    key_name = "b16key"
    count  = 1
    provider = aws.nv

    tags = {
      
      Name = "server1-nv"
    }

}

resource "aws_instance" "server1-mumbai" {
  
    ami  = "ami-0d54604676873b4ec"
    instance_type = "t2.micro"
    key_name = "mumbaikey"
    count  = 1
    provider = aws.mumbai

    tags = {      
      Name = "server4-bombay"
    }

}
