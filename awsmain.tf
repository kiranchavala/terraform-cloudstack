provider "aws" {
  region = "ap-south-1"

}




resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "test-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.10.0/24"
 

  tags = {
    Name = "subnet-1"
  }
}


resource "aws_instance" "foo" {
  ami           = "ami-001438776438a00f2" 
  instance_type = "t2.micro"
  tags = {
    Name = "vm01-subnet-1"


 
}
}
