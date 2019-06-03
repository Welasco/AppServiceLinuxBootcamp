FROM node:11.15.0-stretch

# Create app directory
WORKDIR /usr/src/app

# Install Tools
RUN apt-get update && apt-get install -y net-tools nano

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install

# Bundle app source
COPY . .

EXPOSE 3000
CMD [ "npm", "start" ]