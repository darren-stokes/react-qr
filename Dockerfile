# ---- Scaffold stage ----
FROM node:alpine3.22 as scaffold

WORKDIR /app

# Install Vite and create a new React project
RUN npm init vite@latest hello-react -- --template react && \
    cd hello-react && npm install --no-fund --no-audit

# ---- Build stage ----
FROM node:alpine3.22 as build
WORKDIR /app
COPY --from=scaffold /app/hello-react/ .

RUN npm ci && npm run build

# ---- Web Server stage ----
FROM caddy:2.10.0-alpine

COPY --from=build /app/dist /usr/share/caddy
COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 80