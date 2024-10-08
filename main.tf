resource "aws_instance" "test_instances" {
  ami             = "ami-0ea3c35c5c3284d82"
  count           = 1
  instance_type   = "t2.micro"
  key_name        = "du-devops"

  user_data = <<-EOF
                #!/bin/bash
                sudo apt-get update -y
                sudo apt-get install -y git
                sudo git clone https://github.com/maclean23/Jenkins-server-setup
                sudo chmod -R 755 Jenkins-server-setup
                sudo chmod +x Jenkins-server-setup/ubuntu-setup-user.sh
                sudo Jenkins-server-setup/ubuntu-setup-user.sh
        EOF

  tags = {
    Name = "test${count.index + 1}"
    training = "devops"
  }
}
