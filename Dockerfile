FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
run npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
#COPY --from=builder /app/build /usr/share/nginx/html
COPY --from=0 /app/build /usr/share/nginx/html
#comment to change fiel for commit
