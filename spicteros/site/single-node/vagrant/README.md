This installation is derived from the official coreos tutorial for a single host kubernetes installation.

https://coreos.com/kubernetes/docs/latest/kubernetes-on-vagrant-single.html

and the repository 

git clone https://github.com/coreos/coreos-kubernetes.git

the main kubernates installation file - user-data - is now located under roles/system-layer/files. 

After installation configure kubectl

- export KUBECONFIG="${KUBECONFIG}:$(pwd)/kubeconfig"
- kubectl config use-context vagrant-single