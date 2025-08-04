FROM winamd64/python:3

RUN python -m pip install --system s3cmd

SHELL ["powershell", "-Command", "Set-StrictMode -Version Latest; $ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
CMD ["powershell", "-NoExit", "-Command", "Set-StrictMode -Version Latest; $ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
