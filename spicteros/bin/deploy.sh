#!/bin/bash

target="$1"      # describe the target
command="$2"     # describe the command for the target. only used for vagrant

function deploy_single_local () {
  
  local home_dir='../site/single-node/vagrant'
  sh ../lib/generate_ssh_config $home_dir"/hosts"
  
  if [ $command = 'clean' ]; then
     cd $home_dir
     echo "******* fire up vagrant"
 #    vagrant destroy --force
     vagrant up
  fi
}

case $target in
"local-single")
   deploy_single_local
   exit 0
   ;;
"remote-single")
   message="found"
   exit 0
   ;;
"local-multi")
   message="found"
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