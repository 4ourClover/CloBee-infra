#!/bin/bash

if [ -z "$PEM_PATH" ]; then
  echo "❗️PEM_PATH 환경변수가 설정되지 않았습니다."
  exit 1
fi

IPS=$(aws ec2 describe-instances \
  --filters "Name=tag:KubernetesCluster,Values=clobee.k8s.local" "Name=tag:Name,Values=*bastion*" \
  --query "Reservations[*].Instances[*].PublicIpAddress" \
  --output text | awk '{print $1}')

echo "[bastion]" > inventory.ini

i=1
for ip in $IPS; do
  echo "bastion$i ansible_host=$ip ansible_user=ubuntu ansible_ssh_private_key_file=$PEM_PATH" >> inventory.ini
  ((i++))
done

ansible-playbook -i inventory.ini playbook.yml