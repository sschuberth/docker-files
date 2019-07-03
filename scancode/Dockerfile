FROM frolvlad/alpine-python2

RUN apk add --no-cache \
    bash \
    git \
    py-icu

# Override PIP's glibc detection, see https://github.com/pypa/pip/issues/3969#issuecomment-247381915.
RUN echo "manylinux1_compatible = True" > /usr/lib/python2.7/_manylinux.py

RUN git clone https://github.com/nexB/scancode-toolkit.git && \
    cd scancode-toolkit && \
    ./configure && \
    ./scancode --version
