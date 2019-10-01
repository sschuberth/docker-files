# See https://github.com/sgerrand/alpine-pkg-glibc/issues/111#issuecomment-466301535.
FROM frolvlad/alpine-miniconda3:python3.6

ENV LD_LIBRARY_PATH=/usr/lib

RUN apk add --no-cache \
    bash \
    git \
    libbz2 \
    py-icu && \
    ln -s /usr/lib/libbz2.so.1 /usr/lib/libbz2.so.1.0

RUN git clone --depth 500 https://github.com/nexB/scancode-toolkit.git /opt/scancode && \
    cd /opt/scancode && \
    ./configure && \
    ./scancode --version

ENTRYPOINT ["/opt/scancode/scancode"]
