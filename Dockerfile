FROM node:22.16.0-slim
WORKDIR /apps
COPY . .
RUN npm install
CMD [ "npm" ,"start" ]