FROM alpine
MAINTAINER tess@deninet.com

RUN apk --update --no-cache add \
        ansible \
        && rm -f /var/cache/apk/*

COPY hosts /etc/ansible/
COPY ansible.cfg /etc/ansible/

CMD ["ansible"]

