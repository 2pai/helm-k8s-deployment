FROM node:alpine

RUN apk update
RUN mkdir /app
ADD . /app
WORKDIR /app

RUN npm update
CMD npm start