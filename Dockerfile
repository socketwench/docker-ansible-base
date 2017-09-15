FROM alpine
MAINTAINER tess@deninet.com

# Install packages.
RUN apk --update --no-cache add \
        py-pip \
        openssh-client \
        git \
        rsync \
        mariadb-client \
        ansible \
        py-curl

# Install packages only needed for building.
RUN apk add --no-cache --virtual .build-dependencies \
        build-base \
        curl-dev \
        openssl-dev \
        python-dev \
        libffi-dev

RUN pip install \
        linode-api

# Remove unneed packages
RUN apk del .build-dependencies
RUN rm -f /var/cache/apk/*

# Copy needed Ansible files
COPY hosts /etc/ansible/
COPY ansible.cfg /etc/ansible/

CMD ["ansible"]
