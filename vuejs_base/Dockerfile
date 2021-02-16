#FROM node:lts-alpine
#RUN npm install -g http-server
#WORKDIR /
##COPY package*.json ./
#UN npm install
#RUN npm run build
#EXPOSE 8080
#CMD [ "http-server", "dist" ]
FROM node:10.17.0-alpine3.9
RUN rm -rf node_modules package-lock.json && npm install
RUN npm install --save @vue/cli-service
RUN npm add webpack@latest
COPY vuejsenv/package.json ./
WORKDIR /work
RUN npm install
CMD ["npm", "run", "serve"]