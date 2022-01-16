docker build -t shahrooz33ce/multi-client:latest -t shahrooz33ce/mluti-client:$SHA -f ./client/Dockerfile ./client
docker build -t shahrooz33ce/multi-server:latest -t shahrooz33ce/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t shahrooz33ce/multi-worker:latest -t shahrooz33ce/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push shahrooz33ce/multi-client:latest
docker push shahrooz33ce/multi-server:latest
docker push shahrooz33ce/multi-worker:latest

docker push shahrooz33ce/multi-client:$SHA
docker push shahrooz33ce/multi-server:$SHA
docker push shahrooz33ce/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=shahrooz33ce/multi-server:$SHA
kubectl set image deployments/client-deployment client=shahrooz33ce/multi-client:$SHA
kubectl set image deployments/worker-deployment wroker=shahrooz33ce/multi-worker:$SHA
