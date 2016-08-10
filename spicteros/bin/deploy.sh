#!/bin/bash

target="$1"      # describe the target
command="$2"     # describe the command for the target. only used for vagrant

#
# ---------- deploy_single_remote -----------
function deploy_single_remote () {

	local home_dir='../site/single-node'
	local bin_dir=$(pwd)
	sh ../lib/generate_ssh_config $home_dir"/hosts"
	
	cd $bin_dir
	ansible-playbook $home_dir"/site.yml" --extra-vars "home_dir=$home_dir/"
}

#
# ----------- deploy_single_local ----------
function deploy_single_local () {
  
  local home_dir='../site/single-node/vagrant'
  local bin_dir=$(pwd)
  sh ../lib/generate_vagrant_ssh_config $home_dir"/hosts"
  
  if [ -n "$command" ]; then 
     if [ "$command" = 'clean' ]; then
        cd $home_dir
        echo "******* destroy vm"
        vagrant destroy --force
        echo "******* fire up new vm"
        vagrant up
     fi
  fi
  cd $bin_dir
  ansible-playbook $home_dir"/site.yml" --extra-vars "home_dir=$home_dir/"
}

#
# ----------- deploy_multi_local ----------
function deploy_multi_local () {
  
  local home_dir='../site/multi-node/vagrant'
  local bin_dir=$(pwd)
#  sh ../lib/generate_vagrant_ssh_config $home_dir"/hosts"
  
  if [ -n "$command" ]; then 
     if [ "$command" = 'clean' ]; then
        cd $home_dir
        echo "******* destroy vm"
        vagrant destroy --force
        echo "******* fire up new vm"
        vagrant up
     fi
  fi
  cd $bin_dir
#  ansible-playbook $home_dir"/site.yml" --extra-vars "home_dir=$home_dir/"
}

#
# ------------------ Main -----------------

case $target in
"local-single")
   deploy_single_local
   exit 0
   ;;
"remote-single")
   deploy_single_remote
   exit 0
   ;;
"local-multi")
   deploy_multi_local
   exit 0
   ;;
"remote-multi")
   message="found"
   exit 0
   ;;
esac
   
echo "------------------------------------------"
echo ""
echo "undefined deployment target <" $type "> !"
echo ""
echo "only single-local, single-remote, multi-local, multi-remote allowed"
echo ""
echo "------------------------------------------"
echo ""