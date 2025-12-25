FROM node:lts-alpine AS builder
WORKDIR '/app'
COPY package.json .  
# RUN npm install
# Use npm ci for faster, more reliable installs
RUN npm ci --only=production --silent
COPY . . 
RUN npm run build


# /app/build will contain the production build
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html