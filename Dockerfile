FROM node:lts-alpine AS builder
WORKDIR '/app'
COPY package.json .  
RUN npm install
COPY . . 
CMD ["npm", "run", "build"]


# /app/build will contain the production build
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html