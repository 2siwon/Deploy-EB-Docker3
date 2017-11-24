FROM            base
MAINTAINER      75220244@naver.com

ENV             LANG C.UTF-8

# 현재 위치를 /srv/app 폴더에 복사 및 requirements 설치
COPY            . /srv/app
RUN             /root/.pyenv/versions/app/bin/pip install -r /srv/app/requirements.txt

# pyenv local 설정
WORKDIR         /srv/app
RUN             pyenv local app