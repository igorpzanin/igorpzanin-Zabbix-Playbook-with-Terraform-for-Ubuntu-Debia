module "zabbix" {
  source         = "../terraform"
  instance_name  = "zabbix"
  instance_type  = "t2.micro"
  key_pair = "aws-ec2-server"

  private_key   = "/home/igor/Documentos/aws/aws-ec2-server.pem"          #Trocar pelo path da key
  playbook_path = "/home/igor/Documentos/zabbix/zabbix-server/zabbix.yml" #Trocar pelo path do playbook

  device_name = "/dev/xvda"
  volume_size = 8
  volume_type = "gp2"

  description = "zabbix-server"
}
