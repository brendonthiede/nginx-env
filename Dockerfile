FROM nginx:1-alpine

COPY ./index.html.template /index.html.template
COPY ./default.conf  /etc/nginx/conf.d/default.conf
COPY ./start-nginx.sh /start-nginx.sh

RUN chmod +x /start-nginx.sh && mkdir /ngconfig

COPY ./config/*.config.js /ngconfig

CMD ["/bin/sh" , "-c" , "/start-nginx.sh"]
