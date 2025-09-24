server {
#listen 89.169.191.55:5601;
#listen 0.0.0.0:5601;
#server_name kibana;

#listen 0.0.0.0:443;
server_name 89.169.191.55.sslip.io pg.89.169.191.55.sslip.io el.89.169.191.55.sslip.io kib.89.169.191.55.sslip.io gr.89.169.191.55.sslip.io;

error_log /var/log/nginx/kibana.error.log;
access_log /var/log/nginx/kibana.access.log;

location / {
	auth_basic "Restricted Access";
	auth_basic_user_file /etc/nginx/htpasswd;
	rewrite ^/(.\*) /$1 break;
	proxy_ignore_client_abort on;
	proxy_pass http://localhost:5601;
	proxy_set_header X-Real-IP $remote_addr;
	proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	proxy_set_header Host $http_host;
           }
       
    listen *:443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/89.169.191.55.sslip.io/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/89.169.191.55.sslip.io/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot





}
server {
    if ($host = pg.89.169.191.55.sslip.io) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = kib.89.169.191.55.sslip.io) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = gr.89.169.191.55.sslip.io) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = el.89.169.191.55.sslip.io) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = 89.169.191.55.sslip.io) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


listen *:80;
server_name 89.169.191.55.sslip.io pg.89.169.191.55.sslip.io el.89.169.191.55.sslip.io kib.89.169.191.55.sslip.io gr.89.169.191.55.sslip.io;
    return 404; # managed by Certbot










}