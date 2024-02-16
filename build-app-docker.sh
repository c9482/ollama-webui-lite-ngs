##export DOCKER_REPO=gcr.io/ninth-bonito-196616
export DOCKER_REPO=c9482
export IMAGE_NAME=ollama-webui-lite

#grep '<AssemblyVersion>' src/LCEnterpriseServicesProduct.API/LCEnterpriseServicesProduct.csproj | sed "s@.*<AssemblyVersion>\(.*\)</AssemblyVersion>.*@\1@" > version.txt
export IMAGE_API_VERSION=0.0.3

# Set execute permission on this script before running: chmod 700 build-app-docker.sh
npm run build
docker build . --file Dockerfile --tag webui-lite-image
docker save --output ../webui-lite-image.docker webui-lite-image
docker load --input ../webui-lite-image.docker
docker tag webui-lite-image $DOCKER_REPO/$IMAGE_NAME:$IMAGE_API_VERSION 
docker tag webui-lite-image $DOCKER_REPO/$IMAGE_NAME:latest

#gcloud auth activate-service-account container-registry@ninth-bonito-196616.iam.gserviceaccount.com --key-file=ninth-bonito-196616-e7eb1cb7bcae.json
#gcloud auth login 
#gcloud auth configure-docker 

#docker login -u c9482 -p *********************** docker.io

##docker push $DOCKER_REPO/lcenterpriseservicesproduct:$IMAGE_VERSION
docker push --all-tags $DOCKER_REPO/$IMAGE_NAME