#!/bin/bash

__create_user() {
# Create a user to SSH into as.
USERNAME=jenkins
useradd $USERNAME
SSH_USERPASS=Password
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin $USERNAME)
echo ssh $USERNAME password: $SSH_USERPASS
}

# Call all functions
__create_user
