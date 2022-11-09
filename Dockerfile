FROM node:lts-alpine

LABEL maintainer="Ikonera <gabrielmlt@protonmail.ch>"

ENV NODE_ENV="production"

WORKDIR /app
COPY . /app/

RUN yarn && yarn build

EXPOSE 3000

CMD ["yarn", "start"]
