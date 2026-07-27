# RUN

docker build -t portfolio .

docker run -d -p 8080:80 portfolio

docker tag portfolio:latest nbdevops3036/portfolio-2.0:latest

docker push nbdevops3036/portfolio-2.0:latest

kubectl apply -f k8s/