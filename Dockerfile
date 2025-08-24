# ---- Scaffold stage ----
FROM node:alpine3.22 AS scaffold

WORKDIR /app

# Install Vite and create a new React project
RUN npm init vite@latest hello-react -- --template react && \
    cd hello-react && npm install --no-fund --no-audit

# ---- Build stage ----
FROM node:alpine3.22 AS build
WORKDIR /app
COPY --from=scaffold /app/hello-react/ .

# Remove the default src directory created by Vite
RUN rm -rf src/

# Copy over our source files
COPY src/ ./src
COPY index.html .

RUN npm ci && npm run build

# ---- Web Server stage ----
FROM caddy:2.10.0-alpine

WORKDIR /usr/share/caddy
COPY --from=build /app/dist .
COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 80