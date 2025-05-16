#!/bin/bash

IP=$(aws ec2 describe-instances \
  --filters "Name=tag:KubernetesCluster,Values=clobee.k8s.local" "Name=tag:Name,Values=*bastion*" \
  --query "Reservations[*].Instances[*].PublicIpAddress" \
  --output text | awk '{print $1}')

cat <<EOF
all:
  hosts:
    bastion:
      ansible_host: $IP
      ansible_user: ubuntu
      ansible_ssh_private_key_file: $PEM_PATH_LINUX
EOF