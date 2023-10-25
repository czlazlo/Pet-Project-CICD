# Build image
FROM node:14 as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Runtime image
FROM node:14-alpine
WORKDIR /app
COPY --from=build /app .
CMD ["npm", "start"]
