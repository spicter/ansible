#!/bin/bash

target="$1"      # describe the target
command="$2"     # describe the command for the target. only used for vagrant


function deploy_single_local () {
  
  sh ../lib/generate_ssh_config ../site/single-node/vagrant/hosts
  
  if [ $command = 'clean' ]
     then echo "clean"
  fi
}

case $target in
"single-local")
   deploy_single_local
   exit 0
   ;;
"single-remote")
   message="found"
   exit 0
   ;;
"multi-local")
   message="found"
   exit 0
   ;;
"multi-remote")
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