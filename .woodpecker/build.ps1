$date = get-date -format FileDate
$DOCKER_URL = $env:DOCKER_URL
$DOCKER_USERNAME = $env:DOCKER_USERNAME
$DOCKER_PASSWORD = $env:DOCKER_PASSWORD
$QUAY_URL = $env:QUAY_URL
$QUAY_USERNAME = $env:QUAY_USERNAME
$QUAY_PASSWORD = $env:QUAY_PASSWORD

docker login $DOCKER_URL --username "$DOCKER_USERNAME" --password "$DOCKER_PASSWORD"
docker login "$QUAY_URL" --username "$QUAY_USERNAME" --password "$QUAY_PASSWORD"
cd s3cmd
docker build . -f Dockerfile -t opencloudeu/s3cmd:w-v$date
docker tag opencloudeu/s3cmd:w-v$date opencloudeu/s3cmd:w-v1
docker tag opencloudeu/s3cmd:w-v$date $DOCKER_URL/opencloudeu/s3cmd:w-v$date
docker tag opencloudeu/s3cmd:w-v$date $DOCKER_URL/opencloudeu/s3cmd:w-v1
docker tag opencloudeu/s3cmd:w-v$date $QUAY_URL/opencloudeu/s3cmd:w-v$date
docker tag opencloudeu/s3cmd:w-v$date $QUAY_URL/opencloudeu/s3cmd:w-v1

docker push opencloudeu/s3cmd:w-v$date
docker push opencloudeu/s3cmd:w-v1
docker push $DOCKER_URL/opencloudeu/s3cmd:w-v$date
docker push $DOCKER_URL/opencloudeu/s3cmd:w-v1
docker push $QUAY_URL/opencloudeu/s3cmd:w-v$date
docker push $QUAY_URL/opencloudeu/s3cmd:w-v1

docker manifest create -a opencloudeu/s3cmd:v1 opencloudeu/s3cmd:l-v1 opencloudeu/s3cmd:w-v1
docker manifest create -a $DOCKER_URL/opencloudeu/s3cmd:v1 $DOCKER_URL/opencloudeu/s3cmd:l-v1 $DOCKER_URL/opencloudeu/s3cmd:w-v1
docker manifest create -a $QUAY_URL/opencloudeu/s3cmd:v1 $QUAY_URL/opencloudeu/s3cmd:l-v1 $QUAY_URL/opencloudeu/s3cmd:w-v1
docker manifest push opencloudeu/s3cmd:v1
docker manifest push $DOCKER_URL/opencloudeu/s3cmd:v1
docker manifest push $env:QUAY_URL/opencloudeu/s3cmd:v1
