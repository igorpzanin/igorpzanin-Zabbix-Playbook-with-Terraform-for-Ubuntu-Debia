resource "aws_instance" "instance" {
  ami           = var.aws_ami
  instance_type = var.instance_type
  key_name      = var.key_pair

  user_data     = <<-EOF
                    #!/bin/bash
                    sudo mkdir  /usr/share/doc/zabbix-server-mysql/
                    sudo touch /usr/share/doc/zabbix-server-mysql/create.sql.gz
                  EOF
  tags = {
    Name       = var.instance_name
    managed-by = "terraform"
  }

  vpc_security_group_ids = [aws_security_group.sg.id]
  ebs_block_device {
    device_name           = var.device_name
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = true
  }

  provisioner "local-exec" {
    command = "sudo ansible-playbook -i hosts ${var.playbook_path} --extra-vars 'zabbix_version=5.0' --private-key=${var.private_key}"
  }

}
