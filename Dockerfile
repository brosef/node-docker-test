FROM node:stretch

WORKDIR /src

COPY package* ./

RUN npm ci

COPY . .

EXPOSE 3000

CMD ["node","index.js"]
