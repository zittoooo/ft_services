export MINIKUBE_HOME=$1
minikube start --driver=virtualbox
eval $(minikube -p minikube docker-env)

#metallb
minikube addons enable metallb
kubectl apply -f ./srcs/metallb/metallb_config.yaml

#nginx
cd ./srcs/nginx
echo "nginx image build"
docker build -t nginx:latest . > /dev/null
echo "apply yaml"
kubectl apply -f ./nginx.yaml

#mysql
cd ../mysql
echo "mysql image build"
docker build -t mysql:latest . > /dev/null
echo "apply yaml"
kubectl apply -f mysql.yaml

#phpmyadmin
cd ../phpmyadmin
echo "phpmyadmin image build"
docker build -t phpmyadmin:latest . > /dev/null
echo "apply yaml"
kubectl apply -f phpmyadmin.yaml

#wordpress
cd ../wordpress
echo "wordpress image build"
docker build -t wordpress:latest .  > /dev/null
kubectl apply -f wordpress.yaml

# ftps
cd ../ftps
echo "ftpss image build"
docker build -t ftps:latest .  > /dev/null
kubectl apply -f ftps.yaml

# influxdb
cd ../influxdb
echo "influxdb image build"
docker build -t influxdb:latest . > /dev/null
kubectl apply -f influxdb.yaml

# telegraf
cd ../telegraf
echo "telegraf image build"
docker build -t telegraf:latest . > /dev/null
kubectl apply -f telegraf.yaml

# grafana
cd ../grafana
echo "grafana image build"
docker build -t grafana:latest . > /dev/null
kubectl apply -f grafana.yaml

minikube dashboard
