FROM node:alpine3.22 as scaffold

WORKDIR /app
RUN npm init vite@latest hello-react -- --template react && \
    cd hello-react && npm install --no-fund --no-audit

FROM node:alpine3.22 as build
WORKDIR /app
COPY --from=scaffold /app/hello-react/ .
RUN npm run build
