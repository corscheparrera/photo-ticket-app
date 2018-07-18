FROM node:8.9.1

EXPOSE 80

WORKDIR /app

COPY ./chat /app/chat
COPY ./photo-ticket-server /app/photo-ticket-server

WORKDIR /app/chat
RUN yarn
RUN yarn build

RUN rm -r /app/photo-ticket-server/build
RUN mv ./build /app/photo-ticket-server

RUN ls /app/photo-ticket-server/build


WORKDIR /app/photo-ticket-server
RUN yarn

# CMD ["ls"]
CMD PORT=80 node index.js

