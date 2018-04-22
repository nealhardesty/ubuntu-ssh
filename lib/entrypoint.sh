#!/bin/bash
if [ ! $(id "$USERNAME" >> /dev/null 2>&1) ]; then
  echo Creating user $USERNAME
  /usr/sbin/useradd -m -s /bin/bash "$USERNAME"
  echo "$USERNAME:$PASSWORD" | /usr/sbin/chpasswd

  echo Enabling password authentication
  /bin/sed -i -e "s/#PasswordAuthentication.*/PasswordAuthentication yes/" /etc/ssh/sshd_config

  echo Enabling sudo for $USERNAME
  echo "$USERNAME ALL=(ALL:ALL) ALL" >> /etc/sudoers
fi

mkdir -p /var/run/sshd
/usr/bin/ssh-keygen -A 

exec /usr/sbin/sshd -D -e 
