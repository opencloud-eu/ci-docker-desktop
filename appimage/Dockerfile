FROM invent-registry.kde.org/sysadmin/ci-images/craft-appimage-alma9:latest@sha256:41dd698b4c6c4035ca5216077170006642712f59dab27cbb3dd41e814af8448b

RUN dnf install -y awscli2 fuse3-devel file && \
    dnf clean all && \
    cargo install --root /usr clang-tidy-sarif sarif-fmt

# disable the ownership check in git
RUN git config --system --add safe.directory '*'
