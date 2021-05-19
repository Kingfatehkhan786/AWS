#!/bin/bash
set -eux


declare -A USERKEY
# Please change the user name as you want
USERKEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDjsDjwQg4UNyk2kTKXsYm6wDzOeEJyhX/1XavfxynwAm4Ss4Fk4wfTvhdoJXLt0iW2yvLwrJUwpB9nJOkC2M3KcdHu3Jz6TuXTs2bNUMJJmSt9tyNydQYj1Ev4JNHRcaCElekth6wmjazY4Hq3pLQB9hAKX3llZGRw+>"
declare -A SUDOUSER


user_name='moti'

# please change the group anme sudo to wheel when you r using centos or redhat
group_name='sudo'

sudo useradd -m  --shell /bin/bash -G ${group_name} ${user_name}

# -m  will create user folder under home by default
# -d will create user in custom location like /var/www/ ( -d /var/www/ )

sudo mkdir /home/$user_name/.ssh
sudo echo "${USERKEY}" >> /home/$user_name/.ssh/authorized_keys
  # Change ownership and access modes for the new directory/file

sudo chown -R $user_name:$user_name /home/$user_name/.ssh
sudo chmod -R go-rx /home/$user_name/.ssh
#allow password less access
sudo echo "$user_name ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users
