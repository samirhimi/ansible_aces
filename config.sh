#!/bin/sh

echo "Managed Node Preparation ..."

dnf check-update
dnf update -y
dnf install -y epel-release wget vim

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd

PASS=$(echo "rhel" | openssl passwd -1 -stdin)
useradd -p "$PASS" student
cat <<EOF > /etc/sudoers.d/student
student  ALL=NOPASSWD: ALL
EOF
