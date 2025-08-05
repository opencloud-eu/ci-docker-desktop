echo "$DOCKER_PASSWORD" | docker login "$DOCKER_URL" --username "$DOCKER_USERNAME" --password-stdin
echo "$QUAY_PASSWORD" | docker login "$QUAY_URL" --username "$QUAY_USERNAME" --password-stdin
cd s3cmd
date=$(date +%Y%m%d)
docker build . -f Dockerfile -t opencloudeu/s3cmd:v$date
docker tag opencloudeu/s3cmd:v$date opencloudeu/s3cmd:v1
docker tag opencloudeu/s3cmd:v$date $DOCKER_URL/opencloudeu/s3cmd:v$date
docker tag opencloudeu/s3cmd:v$date $DOCKER_URL/opencloudeu/s3cmd:v1
docker tag opencloudeu/s3cmd:v$date $QUAY_URL/opencloudeu/s3cmd:v$date
docker tag opencloudeu/s3cmd:v$date $QUAY_URL/opencloudeu/s3cmd:v1

docker push opencloudeu/s3cmd:v$date
docker push opencloudeu/s3cmd:v1
docker push DOCKER_URL/opencloudeu/s3cmd:v$date
docker push DOCKER_URL/opencloudeu/s3cmd:v1
docker push QUAY_URL/opencloudeu/s3cmd:v$date
docker push QUAY_URL/opencloudeu/s3cmd:v1
