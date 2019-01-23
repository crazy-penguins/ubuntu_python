FROM ubuntu:bionic
ENV container docker
ENV DEBIAN_FRONTEND noninteractive
WORKDIR /work
SHELL [ "/bin/bash", "-c" ]
COPY NAME .
COPY VERSION .
COPY build_python.sh .
RUN cat ./NAME > /etc/docker.conf \
  && printf ":" >> /etc/docker.conf \
  && cat ./VERSION >> /etc/docker.conf \
  && cat /etc/docker.conf \
  && mkdir -p /u \
  && chmod 0755 build_python.sh
RUN /work/build_python.sh \
  && rm -rf VERSION NAME
