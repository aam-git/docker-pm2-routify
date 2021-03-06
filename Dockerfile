FROM keymetrics/pm2:latest-stretch
LABEL maintainer="AAMServices <info@aamservices.uk>"

RUN groupadd -r routify && useradd --no-log-init -r -g routify routify
RUN mkdir /home/routify && chown -R routify:routify /home/routify

USER routify

WORKDIR /home/routify

RUN curl -fsSL "https://raw.githubusercontent.com/aam-git/docker-pm2-routify/dev/ecosystem.config.js" -o ecosystem.config.js && \
    npx @roxi/routify init

EXPOSE 5000

CMD [ "pm2-runtime", "start", "ecosystem.config.js" ]
