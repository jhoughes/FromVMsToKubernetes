###
#Demo 1 - Pod

#Show K8s contexts
kubectl config get-contexts

#Show K8s nodes
kubectl get nodes

#Show K8s pods - none at this point
kubectl get pods

#Deploy pod
kubectl apply -f pod.yml

#Show K8s pods - one exists
kubectl get pods

#Congrats, you've deployed your first Kubernetes workload!

#Pod details
kubectl describe pod vmug-first-pod

###
#Demo 2 - Services

#VMUG local service
kubectl apply -f svc-vmug-local.yml

#Show K8s services
kubectl get service

#Only a NodePort, let's delete
kubectl delete svc svc-vmug-local

#Cloud (load balancer) service
kubectl apply -f svc-cloud.yml

#Show K8s services
kubectl get service

#Clean everything up
kubectl delete svc cloud-lb
kubectl delete pod vmug-first-pod

#All gone
kubectl get pods

###
#Demo 3 - Deployment

#No deployments yet
kubectl get deployments

#First deployment
kubectl apply -f deploy.yml

#New deployment
kubectl get

#Look at all those pods
kubectl get pods


###
#Demo 4 - Self-healing
#Delete a pod
kubectl delete pod vmug-deploy-#

#It's terminated
kubectl get pods

#Get our deployment
kubectl get deployment

###
#Demo 5 - Scaling

#Update the deployment - deploy.yml
#Check the details
cat deploy.yml

#Update the deployment
kubectl apply -f deploy.yml

#Check the deployment
kubectl get deployment vmug-deploy

#Look at pods
kubectl get pods

#Manual scaling
kubectl scale --replicas 6 deployment/vmug-deploy

#Watch the pods
kubectl get pods

#Update the deployment back to propet replicas - deploy.yml
#Check the details
cat deploy.yml

#Update the deployment
kubectl apply -f deploy.yml

#Look at pods decrease
kubectl get pods

#Check the deployment
kubectl get deployment vmug-deploy

###
#Demo 6 - Rolling Update

#Update deploy.yml with details from rolling-update.yml

#Start the upgrade
kubectl apply -f deploy.yml

#Check the rollout
kubectl rollout status deployment vmug-deploy

#Set load balanger service (forgot in video)
kubectl apply -f svc-cloud.yml

#Confirm the new version of web app is online via browser

# Success, thanks for following along.
# I hope you learned something, you can also reach out to me on
# Twitter (@jhoughes), or email me at joe@fullstackgeek.net

#Thanks y'all, I want to see you present at the next VMUG Usercon!