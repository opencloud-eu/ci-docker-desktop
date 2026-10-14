FROM invent-registry.kde.org/sysadmin/ci-images/craft-appimage-alma9:latest

RUN dnf install -y fuse3-devel file && dnf clean all && cargo install clang-tidy-sarif sarif-fmt

# disable the ownership check in git
RUN git config --system --add safe.directory '*'
