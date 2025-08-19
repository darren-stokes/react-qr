FROM node:alpine3.22 as scaffold

WORKDIR /app

# Install Vite and create a new React project
RUN npm init vite@latest hello-react -- --template react && \
    cd hello-react && npm install --no-fund --no-audit

FROM node:alpine3.22 as build
WORKDIR /app
COPY --from=scaffold /app/hello-react/ .

RUN npm run build

FROM node:alpine3.22 as prod
WORKDIR /app

# Install Vite as a global runtime server
RUN npm install -g vite@latest --no-fund --no-audit

# Copy the built files from the build stage
COPY --from=build /app/dist/ ./dist

EXPOSE 8080

# Run a health check to ensure the server is running
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "wget", "-qO-", "http://127.0.0.1:8080/", "&>/dev/null", "||", "exit", "1" ]

CMD ["vite", "preview", "--port", "8080", "--host", "0.0.0.0", "--port", "8080"]