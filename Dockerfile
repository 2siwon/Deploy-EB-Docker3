FROM            base
MAINTAINER      75220244@naver.com

ENV             LANG C.UTF-8

# 현재 위치를 /srv/app 폴더에 복사 및 requirements 설치
COPY            . /srv/app
RUN             /root/.pyenv/versions/app/bin/pip install -r /srv/app/requirements.txt

# pyenv local 설정
WORKDIR         /srv/app
RUN             pyenv local app


# Nginx
RUN             cp /srv/app/.config/nginx/app.conf \
                        /etc/nginx/sites-available/
RUN             rm -rf /etc/nginx/sites-enabled/*
RUN             ln -sf /etc/nginx/sites-available/app.conf \
                        /etc/nginx/sites-enabled/app.conf

# uWSGI
RUN             mkdir -p /var/log/uwsgi/app