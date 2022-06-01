FROM node:18-alpine as base
RUN npm install --global npm --silent
WORKDIR /usr/src/app
COPY package*.json ./

FROM base as production
ENV NODE_ENV=production
RUN npm i -g npm --slent && npm ci --omit=dev --silent
COPY . .
CMD ["npm", "start"]

FROM base as dev
ENV NODE_ENV=development \
  LOCAL_DEV=true
RUN npm i -g npm && npm ci
COPY . .
CMD ["npm", "run", "dev"]
