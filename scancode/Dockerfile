FROM frolvlad/alpine-glibc

RUN apk add --no-cache \
    bash \
    git \
    python \
    py-icu

# Override PIP's glibc detection, see https://github.com/pypa/pip/issues/3969#issuecomment-247381915.
RUN echo "manylinux1_compatible = True" > /usr/lib/python2.7/_manylinux.py

RUN git clone --single-branch https://github.com/nexB/scancode-toolkit.git /opt/scancode && \
    cd /opt/scancode && \
    ./configure && \
    ./scancode --version
