
ns=kube-system

kubectl --namespace=$ns get pods > test.txt

while ! grep -q "Running" test.txt; do

  sleep 5
  kubectl --namespace=$ns get pods > test.txt
  echo "waiting for $ns being up..."
  
done
rm -f test.txt