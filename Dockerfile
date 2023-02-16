FROM node:lts-alpine AS build
WORKDIR /usr/app
ADD package.json .
RUN npm install
ADD ./index.js .
ADD ./webpack.config.js .
RUN yarn build

FROM node:lts-alpine
WORKDIR /usr/app
RUN npm install pm2 -g
RUN npm install --platform=linuxmusl --arch=x64 sharp
COPY --from=build /usr/app/build .
CMD ["pm2-runtime", "index.js", "-i", "0"]