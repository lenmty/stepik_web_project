sudo ln -sf /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
sudo ln -s /home/box/web/etc/gunicorn.conf  /etc/gunicorn.d/gunicorn.conf
sudo /etc/init.d/gunicorn restart
sudo gunicorn -c /etc/gunicorn.d/gunicorn.conf hello:wsgi_application &
sudo gunicorn -c /home/box/web/etc/gunicorn-django.conf ask.wsgi:application &
