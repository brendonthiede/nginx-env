FROM nginx:1-alpine

COPY ./*.html /usr/share/nginx/html
COPY ./index.html.template /index.html.template
# COPY ./default.conf  /etc/nginx/conf.d/default.conf
COPY ./start-nginx.sh /start-nginx.sh
RUN chmod +x /start-nginx.sh && mkdir /ngconfig
COPY *.config.js /ngconfig
COPY ./default.conf.template  /default.conf.template

CMD ["/bin/sh" , "-c" , "/start-nginx.sh"]
