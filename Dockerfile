FROM node:11.4 as base

WORKDIR /app

# use changes to package.json to force Docker not to use the cache
# when we change our application's nodejs dependencies:
COPY package*.json /tmp/
RUN cd /tmp && npm install --quiet
RUN cp -r /tmp/node_modules /app

# From here we load our application's code in, therefore the previous docker
# "layer" thats been cached will be used if possible
COPY . /app

CMD [ "npm", "build" ]

# If deployment / testing are used, we could also use other build stages
# We can also use a stage to add our tools if we don't want them in the devDepencies (cf apiDoc for ex.)
