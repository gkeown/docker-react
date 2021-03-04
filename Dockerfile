FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# copy build directory over to use with nginx image
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
