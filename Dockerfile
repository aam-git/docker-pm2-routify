FROM keymetrics/pm2:12-stretch
LABEL maintainer="AAMServices <info@aamservices.uk>"

WORKDIR /usr/src/app

RUN apt-get update -qq && apt-get -y --no-install-recommends install git curl && rm -rf /var/lib/apt/lists/* && \
    curl -fsSL "https://raw.githubusercontent.com/aam-git/docker-pm2-routify/dev/ecosystem.config.js" -o ecosystem.config.js && \
    npx @roxi/routify init

EXPOSE 3000

CMD [ "pm2-runtime", "start", "ecosystem.config.js" ]
