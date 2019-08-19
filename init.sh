# Обновица
# sudo apt-get update
# sudo apt-get install python-pip python-dev mysql-server libmysqlclient-dev
# sudo apt-get install -y python3.5
# sudo apt-get install -y python3.5-dev
# sudo unlink /usr/bin/python3
# sudo ln -s /usr/bin/python3.5 /usr/bin/python3
# sudo pip3 install --upgrade pip
# sudo pip3 install --upgrade django==2.1
# sudo pip3 install --upgrade gunicorn
# sudo pip3 install mysqlclient

sudo ln -sf /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
sudo ln -s /home/box/web/etc/gunicorn.conf  /etc/gunicorn.d/gunicorn.conf
sudo /etc/init.d/gunicorn restart
sudo gunicorn -c /etc/gunicorn.d/gunicorn.conf hello:wsgi_application &
sudo gunicorn -c /home/box/web/etc/gunicorn-django.conf ask.wsgi:application &
sudo /etc/init.d/mysql start
