FROM node:16-alpine

WORKDIR /app

COPY package.json .

RUN sed -i "s@https://dl-cdn.alpinelinux.org/alpine/@https://ci-repo.aexp.com/repository/alpine-raw/@g" /etc/apk/repositories

RUN echo "registry=https://ci-repo.aexp.com/nodejs/content/groups/npm/" > .npmrc
RUN echo "strict-ssl=false" >> .npmrc

RUN npm install --loglevel verbose

COPY . .

CMD [ "node", "server.js" ]
