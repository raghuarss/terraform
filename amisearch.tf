data "aws_ami" "ami" {
  most_recent      = true
  #executable_users = ["self"]
  #owners = ["143333925950"]

  /*filter {
    name   = "owner-alias"
    values = ["amazon"]
  }*/

  filter {
    name   = "name"
    values = ["ubuntu*"]
  }
  
  /*filter {
    name   = "name"
    values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
  }*/

  /*filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }*/
}

output "amiees" {
    value = "${data.aws_ami.ami.image_id}"

}

resource "aws_instance" "instance_create_ubuntu" {
  ami = "${data.aws_ami.ami.image_id}"
  instance_type = "t2.micro"
}