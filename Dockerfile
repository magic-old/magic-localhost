# wizardsatwork/grundstein/postgres dockerfile
# VERSION 0.0.1

FROM mhart/alpine-node:base-5.9.0

MAINTAINER Wizards & Witches <dev@wiznwit.com>
ENV REFRESHED_AT 2016-21-02

WORKDIR /srv
ADD src/ ./
ADD node_modules ./node_modules/

RUN ls -l .

ARG PORT

EXPOSE ${PORT}
CMD ["node", "index.js"]