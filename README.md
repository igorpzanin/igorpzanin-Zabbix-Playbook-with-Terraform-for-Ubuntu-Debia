<h1 align="center" dir="auto">Zabbix playbook with Terraform</h1>
<p> The main objective of this project is to show a model of a Zabbix playbook using Terraform (optional) and Ansible,</p>

<h2>How does it works?</h2>
<p>First of all it is design to AWS, so an account is needed, sure, only if you want to use Terraform code</p>
<p>So we have 2 cases here </p>
<h2>Case 1: Use Terraform and the playbook</h2>
1) First of all you must change your private key file on modules/hosts.yml for your path, i placed a comment where you should make the change on the archive 
2) then you must join the dir <strong>terraform/modules </strong> and type the Ansible command:

>     terraform init

>     terraform apply --auto-approve && public_dns=$(terraform output -json public_dns | jq -r '.') && terraform output -json public_dns | jq -r '"public_dns: " + .' | sed -i "s/{{public_dns}}/$public_dns/g" hosts.yml && sleep 30 && sudo ansible-playbook -i hosts.yml ../../ansible/zabbix.yml

A brief explanation of what this code does is basically on the first part terraform gets initializated, on the second code he will apply, start the ec2, get the DNS from the EC2 and change in hosts.yml to the DNS be the host of your playbook, then sure,
will initializate your playbook

<h2>Case 2: just the playbook</h2>
In this case theres no secret. you just have to initialize the following command

>      sudo ansible-playbook -i hosts.yml zabbix.yml

<strong>BUT</strong> an hosts.yml must be created on the directory where zabbix.yml is located, and you must put the host you want to run the playbook on.
You could use this model of hosts.yml

```yaml
all:
  hosts:
  children:
    zabbix:
      hosts:
        {{public_dns}} #change here for your host
      vars:
        ansible_user: ubuntu
        ansible_ssh_private_key_file: /home/igor/Documentos/aws/aws-ec2-server.pem # Change needed
        ansible_become: yes
        ansible_port: 22
```
