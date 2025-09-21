# Dockerfile
FROM nginx:stable-alpine

# 1. Standard-Port von 80 auf 8080 umstellen
RUN sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf

# 2. index.html und Bilder in den Nginx­-Webroot kopieren
COPY index.html /usr/share/nginx/html/
COPY certificates/ /usr/share/nginx/html/certificates/

# 3. Port freigeben (Cloud Run setzt PORT=8080)
EXPOSE 8080

# 4. Nginx im Vordergrund starten
CMD ["nginx", "-g", "daemon off;"]
