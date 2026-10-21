#escape=`

# This Dockerfile will be build on Windows and Linux
# It will rename the s3cmd script to s3cmd.py on Windows
# Afterwards "s3cmd" will be available as a global command
FROM python:3

LABEL maintainer="OpenCloud.eu Team <devops@opencloud.eu>" `
      name="opencloudeu/s3cmd" `
      vendor="OpenCloud GmbH" `
      source="https://github.com/opencloud-eu/ci-docker-desktop"

COPY . .

RUN python -m pip install -r requirements.txt ; `
    python rename_script.py
