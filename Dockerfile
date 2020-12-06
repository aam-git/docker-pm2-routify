FROM keymetrics/pm2:latest-stretch
LABEL maintainer="AAMServices <info@aamservices.uk>"

RUN groupadd -r routify && useradd --no-log-init -r -g routify routify
RUN mkdir /usr/src/app && chown -R routify:routify /usr/src/app

USER routify

WORKDIR /usr/src/app

RUN curl -fsSL "https://raw.githubusercontent.com/aam-git/docker-pm2-routify/dev/ecosystem.config.js" -o ecosystem.config.js && \
    npx @roxi/routify init

EXPOSE 5000

CMD [ "pm2-runtime", "start", "ecosystem.config.js" ]
