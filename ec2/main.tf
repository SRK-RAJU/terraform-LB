# Get Availability Zones
#resource "tls_private_key" "qrst" {
#  algorithm = "RSA"
#  rsa_bits  = 4096
#}
#
## Generate a Private Key and encode it as PEM.
##resource "aws_key_pair" "key_pair" {
##  key_name   = "kumar"
##  public_key = tls_private_key.sree.public_key_openssh
##
##  provisioner "local-exec" {
##    command = "echo '${tls_private_key.sree.private_key_pem}' > ./kumar.pem"
##  }
##}
#
##resource "tls_private_key" "example" {
##  algorithm = "RSA"
##  rsa_bits  = 4096
##}
##variable "key_name" {}
#resource "local_file" "adftstad" {
#  content  = tls_private_key.qrst.private_key_pem
#  filename = "adftstad.pem"
#}
#resource "aws_key_pair" "generated_key" {
##  key_name   = "var"
#  key_name   = "adftstad"
#  public_key = "${tls_private_key.qrst.public_key_openssh}"
#}


#resource "aws_instance" "web" {
#  ami           = "ami-5b673c34"
#  instance_type = "t2.micro"
#  key_name      = "${aws_key_pair.generated_key.key_name}"
#
#  tags = {
#    Name = "HelloWorld"
#  }
#}

# Create a EC2 Instance (amazon 20)
resource "aws_instance" "node" {
  ami                    = "ami-0c2ab3b8efb09f272"
  instance_type          = "t2.micro"
#  key_name               = aws_key_pair.key_pair.id
 # key_name      = "${aws_key_pair.generated_key.key_name}"

  vpc_security_group_ids = [var.public_sg]
  subnet_id              = var.public_subnet

  tags = {
    Name = "TF Generated EC2"
  }

  user_data = file("${path.root}/ec2/userdata.tpl")

  root_block_device {
    volume_size = 10
  }
#  connection {
#    type        = "ssh"
#    user        = ubuntu
#    private_key = tls_private_key.qrst.private_key_pem
#    host        = aws_instance.node.public_ip
#  }
}

# Create and assosiate an Elastic IP
resource "aws_eip" "eip" {
  instance = aws_instance.node.id
}