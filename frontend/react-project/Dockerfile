# Build image
FROM node:14 as build
WORKDIR /app
COPY package*.json ./
RUN npm install
# TODO: Why does "clean-install" fail? (due to Jest/DOM)
COPY src src
COPY public public
RUN npm run build

# Runtime image
FROM node:14-alpine
WORKDIR /app
RUN npm install -g http-server
COPY --from=build /app/build .
CMD ["npx", "http-server", "-gb", "-p", "3000", "-P", "http://backend:5000"]

