FROM invent-registry.kde.org/sysadmin/ci-images/sles15-craft:latest

USER root

# disable the ownership check in git
RUN git config --system --add safe.directory '*'
