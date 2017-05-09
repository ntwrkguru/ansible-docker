FROM alpine:3.5

LABEL maintainer="Stephen Steiner<ntwrkguru@gmail.com>"

## Install base packages
RUN apk update \
    && apk add python2-dev py2-pip build-base libffi-dev openssl-dev \
    && pip install --upgrade pip ansible

WORKDIR /playbook

VOLUME ["/playbook"]

ENTRYPOINT ["ash"]