docker login $env:DOCKER_URL --username "$env:DOCKER_USERNAME" --password "$env:DOCKER_PASSWORD"
docker login "$env:QUAY_URL" --username "$env:QUAY_USERNAME" --password "$env:QUAY_PASSWORD"
cd s3cmd
$date = get-date -format FileDate
docker build . -f Dockerfile -t opencloudeu/s3cmd:v$date
docker tag opencloudeu/s3cmd:v$date opencloudeu/s3cmd:v1
docker tag opencloudeu/s3cmd:v$date $env:DOCKER_URL/opencloudeu/s3cmd:v$date
docker tag opencloudeu/s3cmd:v$date $env:DOCKER_URL/opencloudeu/s3cmd:v1
docker tag opencloudeu/s3cmd:v$date $env:QUAY_URL/opencloudeu/s3cmd:v$date
docker tag opencloudeu/s3cmd:v$date $env:QUAY_URL/opencloudeu/s3cmd:v1

docker push opencloudeu/s3cmd:v$date
docker push opencloudeu/s3cmd:v1
docker push $env:DOCKER_URL/opencloudeu/s3cmd:v$date
docker push $env:DOCKER_URL/opencloudeu/s3cmd:v1
docker push $env:QUAY_URL/opencloudeu/s3cmd:v$date
docker push $env:QUAY_URL/opencloudeu/s3cmd:v1
