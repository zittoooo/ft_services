minikube start --driver=virtualbox
eval $(minikube -p minikube docker-env)

#metallb
minikube addons enable metallb
kubectl apply -f ./srcs/metallb/metallb_config.yaml

#nginx
cd ./srcs/nginx
echo "nginx image build"
docker build -t nginx:latest . > /dev/null
kubectl apply -f ./nginx.yaml
