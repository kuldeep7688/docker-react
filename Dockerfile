FROM node:lts-alpine AS builder
WORKDIR '/app'
COPY package.json package-lock.json ./  
RUN npm ci
COPY . . 
RUN npm run build


# /app/build will contain the production build
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html