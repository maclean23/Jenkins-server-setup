### vim main.tf

resource "aws_instance" "test_instances" {
  ami  = "ami-0ea3c35c5c3284d82"
  count = "1"
  instance_type = "t2.micro"
  key_name = "du-devops"
  user_data = <<-EOF
                #! /bin/bash
                sudo apt-get update
                sudo git clone http://github.com/maclean23/Jenkins-server-setup
                sudo chmod -R Jenkins-server-setup 
                sudo Jenkins-server-setup/ubuntu-setup-user.sh
        EOF

  tags = {
    Name = "test${count.index + 1}"
    training = "devops"
  }
}
