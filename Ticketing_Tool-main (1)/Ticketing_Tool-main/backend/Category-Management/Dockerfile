FROM node:alpine

WORKDIR /app/TicketingTool

# COPY ["package.json", "package-lock.json*", "./"]
#COPY .npmrc ./
COPY package.json ./

RUN npm install

COPY . .

EXPOSE 7003 

CMD [ "npm", "start" ]
