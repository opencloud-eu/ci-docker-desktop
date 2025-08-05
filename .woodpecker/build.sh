date=$(date +%Y%m%d)

echo "$DOCKER_PASSWORD" | docker login "$DOCKER_URL" --username "$DOCKER_USERNAME" --password-stdin
echo "$QUAY_PASSWORD" | docker login "$QUAY_URL" --username "$QUAY_USERNAME" --password-stdin
cd s3cmd
docker build . -f Dockerfile -t opencloudeu/s3cmd:l-v$date
docker tag opencloudeu/s3cmd:l-v$date opencloudeu/s3cmd:l-v1
docker tag opencloudeu/s3cmd:l-v$date $DOCKER_URL/opencloudeu/s3cmd:l-v$date
docker tag opencloudeu/s3cmd:l-v$date $DOCKER_URL/opencloudeu/s3cmd:l-v1
docker tag opencloudeu/s3cmd:l-v$date $QUAY_URL/opencloudeu/s3cmd:l-v$date
docker tag opencloudeu/s3cmd:l-v$date $QUAY_URL/opencloudeu/s3cmd:l-v1

docker push opencloudeu/s3cmd:l-v$date
docker push opencloudeu/s3cmd:l-v1
docker push $DOCKER_URL/opencloudeu/s3cmd:l-v$date
docker push $DOCKER_URL/opencloudeu/s3cmd:l-v1
docker push $QUAY_URL/opencloudeu/s3cmd:l-v$date
docker push $QUAY_URL/opencloudeu/s3cmd:l-v1

docker manifest create -a opencloudeu/s3cmd:v1 opencloudeu/s3cmd:l-v1 opencloudeu/s3cmd:w-v1
docker manifest create -a $DOCKER_URL/opencloudeu/s3cmd:v1 $DOCKER_URL/opencloudeu/s3cmd:l-v1 $DOCKER_URL/opencloudeu/s3cmd:w-v1
docker manifest create -a $QUAY_URL/opencloudeu/s3cmd:v1 $QUAY_URL/opencloudeu/s3cmd:l-v1 $QUAY_URL/opencloudeu/s3cmd:w-v1
docker manifest push opencloudeu/s3cmd:v1
docker manifest push $DOCKER_URL/opencloudeu/s3cmd:v1
docker manifest push $QUAY_URL/opencloudeu/s3cmd:v1