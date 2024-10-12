FROM alpine
WORKDIR /app
COPY . .
RUN npm install -g @redocly/cli
COPY openAPI.yaml .
RUN redocly build-docs openAPI.yaml -o index.html

FROM nginx
COPY index.html /usr/share/nginx/html
