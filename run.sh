#!/usr/bin/bash

git pull

sudo apt install ansible 

ansible-playbook playbook.yml --extra-vars "main_user=$(logname)"