FROM craft-appimage-alma9:latest

RUN dnf install -y awscli2 fuse3-devel file && \
    dnf clean all && \
    cargo install --root /usr clang-tidy-sarif sarif-fmt

# disable the ownership check in git
RUN git config --system --add safe.directory '*'
