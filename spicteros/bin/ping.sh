#!/bin/bash

sh ../lib/generate_ssh_config ../site/single-node/vagrant/hosts
ansible all -m ping