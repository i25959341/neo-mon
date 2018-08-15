# base image
FROM node:9.6.1

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH


# install and cache app dependencies 
# .package.json is old package file with lot of dependency
# for faster caching
COPY package.json /usr/src/app/package.json
RUN npm install
RUN bower install

EXPOSE 3000

# start app
CMD gulp serve
