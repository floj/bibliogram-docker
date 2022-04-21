FROM node:17-alpine AS builder
RUN apk --no-cache add git bash graphicsmagick python3 make g++
RUN mkdir /app && \
  git clone --depth 1 https://git.sr.ht/~cadence/bibliogram /app/bibliogram && \
  cd /app/bibliogram && \
  npm install --no-optional

FROM node:17-alpine
RUN apk --no-cache add graphicsmagick tini
COPY --from=builder /app/bibliogram /app
RUN mkdir /app/db && chown node:node /app/db
ENTRYPOINT ["tini", "--"]

EXPOSE 10407
VOLUME /app/db
USER node
WORKDIR /app/src/site
CMD ["node", "server.js"]

