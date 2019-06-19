# --- Installing stage
FROM node:11.4 AS installer

WORKDIR /usr/src/app

ARG NODE_ENV=production
ARG NPM_TOKEN=
ENV NODE_ENV=${NODE_ENV}

COPY package*.json ./
RUN npm install --quiet

# ---

# Building stage
FROM installer AS builder

## Workdir is shared between the stage so let's reuse it as we neeed the packages
WORKDIR /usr/src/app

COPY ./src src
COPY tsconfig.json .
RUN npm run build

# ---

# Running code under slim image (production part mostly)
FROM node:11.4-slim

## Clean new directory
WORKDIR /app

## We just need the build and package to execute the command
COPY --from=builder /usr/src/app/build build

CMD [ "node", "build/boot.js" ]
