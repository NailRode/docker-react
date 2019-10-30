FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#Note: nginx serves by default the files located in: /usr/share/nginx/html